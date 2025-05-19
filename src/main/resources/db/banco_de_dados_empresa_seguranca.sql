CREATE DATABASE empresa_seguranca
GO
USE empresa_seguranca
GO

-------------------------------------------------------------------------- CRIACAO DOS TRIGGERs / PROCEDUREs / FUNCTIONs --------------------------------------------------------------------------- 

-- Verifica se a formacao e 'tecnico' ou 'superior'
CREATE TRIGGER trigger_formacao_dev ON desenvolvedor
FOR INSERT, UPDATE AS
BEGIN

	DECLARE @formacao VARCHAR(15)

	DECLARE c CURSOR
	FOR SELECT formacao FROM inserted
	OPEN c

	FETCH NEXT FROM c INTO @formacao

	WHILE @@FETCH_STATUS = 0 BEGIN

		IF ( LOWER(@formacao COLLATE Latin1_General_CI_AI) NOT IN ('tecnico', 'superior') ) BEGIN
			RAISERROR('Formacao invalida (Apenas tecnico ou superior sao permitidos)', 16, 1)
			ROLLBACK TRANSACTION
			CLOSE c
			DEALLOCATE c
			RETURN
		END
		FETCH NEXT FROM c INTO @formacao

	END

	CLOSE c
	DEALLOCATE c

END
GO

-- Verifica se a a 3 tipos de Senioridade (Junior, Pleno e Senior) 
CREATE TRIGGER trigger_tipo_senioridade ON senioridade
FOR  INSERT, UPDATE AS
BEGIN

	DECLARE @nome VARCHAR(10)

	IF ( (SELECT COUNT(id) FROM senioridade) > 3) BEGIN
		RAISERROR('Limite de tipos de senioridade atingido (Apenas Junior, Pleno e Senior sao permitidos).', 16, 1)
		ROLLBACK TRANSACTION
	END

	IF( (SELECT COUNT(nome) FROM senioridade WHERE nome = LOWER('Junior' COLLATE Latin1_General_CI_AI)) > 1 OR 
		(SELECT COUNT(nome) FROM senioridade WHERE nome = LOWER('Junior' COLLATE Latin1_General_CI_AI)) > 1 OR
		(SELECT COUNT(nome) FROM senioridade WHERE nome = LOWER('Junior' COLLATE Latin1_General_CI_AI)) > 1) BEGIN
		RAISERROR('Nao e possivel adicionar mais de uma Senioridade', 16, 1)
		ROLLBACK TRANSACTION
	END

	DECLARE c CURSOR
	FOR SELECT nome FROM inserted
	OPEN c
	FETCH NEXT FROM c INTO @nome

	WHILE @@FETCH_STATUS = 0 BEGIN

		IF( LOWER(@nome COLLATE Latin1_General_CI_AI) NOT IN ('junior', 'pleno', 'senior') ) BEGIN
			RAISERROR('Nome invalido (Apenas junior, pleno ou senior sao permitidos)', 16, 1)
			ROLLBACK TRANSACTION
			CLOSE c
			DEALLOCATE c
			RETURN
		END
		FETCH NEXT FROM c INTO @nome  

	END

	CLOSE c
	DEALLOCATE c

END
GO

-- Verifica se o Tipo da Linguagem (modular, orientada a objetos ou funcional)
CREATE TRIGGER trigger_tipo_linguagem ON linguagem
FOR  INSERT, UPDATE AS
BEGIN
	
	DECLARE @tipo VARCHAR(25)
	
	DECLARE c CURSOR
	FOR SELECT tipo FROM inserted
	OPEN c

	FETCH NEXT FROM c INTO @tipo

	WHILE @@FETCH_STATUS = 0 BEGIN

		IF ( LOWER (@tipo COLLATE Latin1_General_CI_AI) NOT IN ('modular', 'oo', 'funcional')) BEGIN
			RAISERROR('Tipo invalido (Apenas Modular, Orientada a Objetos ou Funcional sao permitidos)', 16, 1)
			ROLLBACK TRANSACTION
			CLOSE c
			DEALLOCATE c
			RETURN
		END
		FETCH NEXT FROM c INTO @tipo

	END
	
	CLOSE c
	DEALLOCATE c

END
GO

-- Realiza a separacao do versao (VARCHAR) pelos pontos e os transforma em numeros
CREATE PROCEDURE separar_versao (@versao VARCHAR(10), @major INT OUTPUT, @minor INT OUTPUT, @patch INT OUTPUT) AS
BEGIN

	DECLARE @ponto1 INT
	DECLARE @ponto2 INT

	SET @ponto1 = CHARINDEX('.', @versao )
	SET @ponto2 = CHARINDEX('.', @versao, @ponto1+1	)

	IF(@ponto1 = 0) BEGIN
		SET @major = CAST(@versao AS INT)
		SET @minor = 0
		SET @patch = 0
	END
	ELSE BEGIN
		IF(@ponto2 = 0) BEGIN
			SET @major = CAST(SUBSTRING( @versao, 1, (@ponto1-1) ) AS INT)
			SET @minor = CAST(SUBSTRING( @versao, (@ponto1+1), LEN(@versao) ) AS INT)
			SET @patch = 0
		END
		ELSE BEGIN
			SET @major = CAST(SUBSTRING( @versao, 1, (@ponto1-1) ) AS INT)
			SET @minor = CAST(SUBSTRING( @versao, (@ponto1+1), (@ponto2-@ponto1-1) ) AS INT)
			SET @patch = CAST(SUBSTRING( @versao, (@ponto2+1), LEN(@versao)) AS INT)
		END
	END

END
GO

-- Verifica se a versao do framework tomou um downgrade	
CREATE TRIGGER trigger_versao_framework ON framework
FOR INSERT, UPDATE AS
BEGIN

	DECLARE @versao VARCHAR(10)
	DECLARE @versao_anterior VARCHAR(10)
	DECLARE @major INT
	DECLARE @minor INT
	DECLARE @patch INT
	DECLARE @major_anterior INT
	DECLARE @minor_anterior INT
	DECLARE @patch_anterior INT

	SET @versao = (SELECT versao FROM inserted)

	IF ( @versao LIKE '%[^0-9.]%' ) BEGIN
		RAISERROR('Versao invalida (A versao deve conter apenas numeros e pontos para a separacao)', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE BEGIN
		SET @versao_anterior = (SELECT versao FROM deleted)

		IF (@versao_anterior IS NOT NULL AND @versao IS NOT NULL) BEGIN
			EXEC separar_versao @versao, @major OUTPUT, @minor OUTPUT, @patch OUTPUT
			EXEC separar_versao @versao_anterior, @major_anterior OUTPUT, @minor_anterior OUTPUT, @patch_anterior OUTPUT
			IF ( @major < @major_anterior OR (@major = @major_anterior AND @minor < @minor_anterior) OR (@major = @major_anterior AND @minor = @minor_anterior AND @patch < @patch_anterior) ) BEGIN
				RAISERROR('Versao invalida (A versao inserida [%s] nao deve ser menor que a versao anterior [%s])', 16, 1, @versao, @versao_anterior)
				ROLLBACK TRANSACTION
			END
		END
	END
END
GO

-- Funcao que retorna uma tabela dos projetos que estao atrasados
CREATE FUNCTION function_projetos_atrasados() RETURNS @tabela_projetos_atrasados TABLE(
id INT,
nome VARCHAR(100),
data_inicio DATE,
quant_dias_estimados INT,
orcamento DECIMAL(7,2),
linguagem_id INT
) AS
BEGIN

    DECLARE @id AS INT
    DECLARE @data_inicio AS DATE
    DECLARE @quant_dias_estimados AS INT
    DECLARE @quant_dias_atrasados AS INT
    DECLARE @dias_passados AS INT

    DECLARE c CURSOR 
    FOR SELECT id FROM projeto
    OPEN c

    FETCH NEXT FROM c INTO @id

    WHILE @@FETCH_STATUS = 0 BEGIN

        SET @data_inicio = (SELECT data_inicio FROM projeto WHERE id = @id)
        SET @quant_dias_estimados = (SELECT quant_dias_estimados FROM projeto WHERE id = @id)
        SET @dias_passados = (SELECT DATEDIFF(DAY, @data_inicio, GETDATE()))

        IF( @dias_passados > @quant_dias_estimados) BEGIN
            SET @quant_dias_atrasados = @dias_passados - @quant_dias_estimados

            INSERT INTO @tabela_projetos_atrasados VALUES (@id,
                (SELECT nome FROM projeto WHERE id = @id),
                @data_inicio,
                (SELECT quant_dias_estimados FROM projeto WHERE id = @id),
                (SELECT orcamento FROM projeto WHERE id = @id),
                (SELECT id FROM linguagem WHERE id = (SELECT linguagem_id FROM projeto WHERE id = @id))
            )
        END
        FETCH NEXT FROM c INTO @id
    END

    CLOSE c
    DEALLOCATE c
    RETURN
END
GO


SELECT * FROM senioridade
SELECT * FROM desenvolvedor
SELECT * FROM linguagem
SELECT * FROM framework
SELECT * FROM projeto
SELECT * FROM especialidade_dev
SELECT * FROM participacao_dev
SELECT * FROM framework_utilizado
GO