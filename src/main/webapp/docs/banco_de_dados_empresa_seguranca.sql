/*CREATE DATABASE empresa_seguranca
GO
USE empresa_seguranca
GO

USE master
GO
DROP DATABASE empresa_seguranca 
GO*/

-------------------------------------------------------------------------- CRIACAO DE TABELAS --------------------------------------------------------------------------- 
GO

CREATE TABLE senioridade(
id INT NOT NULL,
nome VARCHAR(10) NOT NULL,
valor_hora DECIMAL(7,2) NOT NULL,
PRIMARY KEY (id) 
)
GO

CREATE TABLE desenvolvedor(
id INT NOT NULL,
nome VARCHAR(120) NOT NULL,
formacao VARCHAR(15) NOT NULL,
senioridade_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (senioridade_id) REFERENCES senioridade(id)
)
GO

CREATE TABLE linguagem(
id INT NOT NULL,
nome_linguagem VARCHAR(90) NOT NULL,
tipo VARCHAR(25) NOT NULL,
nome_ide VARCHAR(90) NOT NULL,
PRIMARY KEY(id)
)
GO

CREATE TABLE framework(
id INT NOT NULL,
nome VARCHAR(100) NOT NULL,
versao VARCHAR(10) NOT NULL,
linguagem_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (linguagem_id) REFERENCES linguagem(id)
)
GO

CREATE TABLE projeto(
id INT IDENTITY(1,1) NOT NULL,
nome VARCHAR(100) NOT NULL,
data_inicio DATE NOT NULL,
quant_dias_estimados INT NOT NULL,
orcamento DECIMAL(7,2) NOT NULL,
linguagem_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (linguagem_id) REFERENCES linguagem(id)
)
GO

CREATE TABLE especialidade_dev(
desenvolvedor_id INT NOT NULL,
linguagem_id INT NOT NULL,
PRIMARY KEY (desenvolvedor_id, linguagem_id), 
FOREIGN KEY (desenvolvedor_id) REFERENCES desenvolvedor(id),
FOREIGN KEY (linguagem_id) REFERENCES linguagem(id)
)
GO

CREATE TABLE participacao_dev(
desenvolvedor_id INT NOT NULL,
projeto_id INT NOT NULL,
PRIMARY KEY(desenvolvedor_id, projeto_id),
FOREIGN KEY (desenvolvedor_id) REFERENCES desenvolvedor(id),
FOREIGN KEY (projeto_id) REFERENCES projeto(id)
)
GO

CREATE TABLE framework_utilizado(
projeto_id INT NOT NULL,
framework_id INT NOT NULL,
PRIMARY KEY (projeto_id, framework_id),
FOREIGN KEY (projeto_id) REFERENCES projeto(id),
FOREIGN KEY (framework_id) REFERENCES framework(id)
)
GO

-------------------------------------------------------------------------- CRIACAO DOS TRIGGERs / PROCEDUREs / FUNCTIONs --------------------------------------------------------------------------- 
GO

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

-- Verifica se a versao do framework tomou um downgrade							--ARRUMAR? colocar Cursor?? mutiplos inserts
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

-- Funcao que retorna uma tabela dos projetos que estao atrasados				--Tinha que usar Cursor?
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


-------------------------------------------------------------------------- INSERTs E TESTES ---------------------------------------------------------------------------
GO


INSERT INTO senioridade VALUES
(1, 'junior', 18.46),
(2, 'pleno', 33.85),
(3, 'senior', 43.08)
GO

INSERT INTO desenvolvedor VALUES
(1, 'Alexandre Marques de Oliveira Filho', 'tecnico', 2),
(2, 'Angelo Marcos da Costa Muniz', 'superior', 2),
(3, 'Fabio Alves de Souza', 'tecnico', 1),
(4, 'Renato Heiji Morimoto', 'superior', 2),
(5, 'Kayky Rodrigues de Souza Costa', 'tecnico', 3),
(6, 'Renan Germano Palles Habache', 'superior', 1),
(7, 'Kelvin Gabriel Siqueira', 'tecnico', 3),
(8, 'Leandro Colevati dos Santos', 'superior', 3),
(9, 'Cristina Correa De Oliveira', 'superior', 3),
(10, 'Wellington Pinto De Oliveira', 'superior', 3)
GO

INSERT INTO linguagem VALUES
(1, 'Java', 'OO' , 'Eclipse'),
(2, 'Python', 'Modular', 'PyCharm'),
(3, 'C', 'Modular', 'Code Blocks'),
(4, 'Scala', 'Funcional', 'Metals'),
(5, 'Haskell', 'Funcional', 'Visual Studio Code'),
(6, 'Ruby', 'OO', 'RubyMine'),
(7, 'Rust', 'Funcional', 'RustRover'),
(8, 'Pascal', 'Modular', 'Lazarus'),
(9, 'TypeScript', 'OO', 'Visual Studio Code')
GO

--O Trigger nao tem Cursor entao se entra mais de 1 dado por vez ele quebra, por isso eu desativei o Trigger e reativei logo em seguida
DISABLE TRIGGER trigger_versao_framework ON framework
INSERT INTO framework VALUES
(1, 'Spring', '5.3.9', 1),
(2, 'Django', '4.2.1', 2),
(3, 'Flask', '2.3.2', 2),
(4, 'GTK', '3.24.33', 3),
(5, 'Play', '2.8.16', 4),
(6, 'Yesod', '1.6.1', 5),
(7, 'Rails', '7.1.2', 6),
(8, 'Rocket', '0.5.0', 7),
(9, 'Free Vision', '2.0.12', 8),
(10, 'Hibernate', '5.6.15', 1),
(11, 'FastAPI', '0.110.0', 2),
(12, 'Qt', '6.7.0', 3),
(13, 'Scalatra', '2.8.1', 4),
(14, 'Actix', '0.13.0', 7),
(15, 'Angular', '17.0.5', 9),
(16, 'NestJS', '10.3.2', 9)
GO
ENABLE TRIGGER trigger_versao_framework ON framework;
GO

/*
INSERT INTO projeto VALUES
(1, 'Empresa de Seguranca', '07/04/2025', 42, 00.00, 1),
(2, 'Carometro', '15/04/2025', 37, 5400.00, 1),
(3, 'Um jogo sobre aprender a programar TCC', '01/01/2024', 330, 745.00, 9),
(4, 'Sistema de Agendamento de Consultas', '10/05/2025', 60, 1200.00, 2),
(5, 'Dashboard de Energia Solar', '20/05/2025', 45, 2300.50, 7),
(6, 'Portal Educacional com Login e Chat', '03/06/2025', 80, 0.00, 9),
(7, 'Editor de Texto em C com Interface', '01/03/2024', 120, 150.00, 3),
(8, 'Gerenciador de Estoque Simples', '05/04/2024', 25, 500.00, 6)
GO

INSERT INTO especialidade_dev VALUES
(1,2),
(1,9),
(2,1),
(2,4),
(2,9),
(3,1),
(5,2),
(5,3),
(5,4),
(6,1),
(8,6),
(8,9),
(9,1),
(9,4),
(10,5)
GO

INSERT INTO participacao_dev VALUES
(1, 3),
(2, 3),
(3, 3),
(5, 3),
(8, 3),
(1, 2),
(2, 1),
(2, 4),
(3, 1),
(5, 4),
(5, 5),
(6, 1),
(7, 8),
(8, 6),
(9, 1),
(9, 4),
(10, 5)
GO

INSERT INTO framework_utilizado VALUES
(1, 1),
(1, 10),
(2, 1),
(2, 10),
(3, 15),
(3, 16),
(4, 2),
(4, 3),
(4, 11),
(5, 8),
(5, 14),
(6, 15),
(6, 16),
(7, 4),
(7, 12),
(8, 7)
GO*/

SELECT * FROM senioridade
SELECT * FROM desenvolvedor
SELECT * FROM linguagem
SELECT * FROM framework
SELECT * FROM projeto
SELECT * FROM especialidade_dev
SELECT * FROM participacao_dev
SELECT * FROM framework_utilizado
GO

-- DEVE RETORNAR 3 PROJETOS (3, 7, 8)
SELECT * FROM function_projetos_atrasados()
GO
SELECT * FROM projeto

--No repository, deve ser poss�vel buscar desenvolvedores por senioridade X
SELECT * FROM desenvolvedor WHERE senioridade_id = (SELECT id FROM senioridade WHERE nome LIKE 'pleno')


--No repository, deve ser poss�vel buscar desenvolvedores por forma��o X
-- usa o FindBy


--No repository, deve ser poss�vel buscar linguagens dispon�veis por tipo X
-- usa o FindBy


--No repository, deve ser poss�vel buscar linguagem por IDE X
-- usa o FindBy


--No repository, deve ser poss�vel buscar frameworks por nome da linguagem
SELECT * FROM framework WHERE linguagem_id = (SELECT id FROM linguagem WHERE nome_linguagem LIKE 'java')


--No repository, deve ser poss�vel buscar projetos por nome de usu�rio			--??????????????????? ANGELOOOOOOOOO HELP
SELECT pj.nome FROM projeto pj
INNER JOIN participacao_dev pa ON pj.id = pa.projeto_id
INNER JOIN desenvolvedor d ON d.id = pa.desenvolvedor_id
WHERE d.nome = ?
go




