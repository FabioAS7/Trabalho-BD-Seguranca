<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home</title>
    <link rel="shortcut icon" href="./assets/favicon_shield.ico" type="image/x-icon">

    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/footer.css">
</head>
<body> 
    
    <header>
        <nav>
            <h1 id="Logo">
                <a href="index" target="_self"><img src="./assets/favicon_shield_25x25.png" alt=""></a>Empresa<span>Segura</span>
            </h1>
            <ul>
                <li><a href="index" target="_self">Início</a></li>

                <li><a href="#" target="_self">Sobre a empresa</a>
                    <ul class="menu_dropdown">
                        <li><a href="valores_senioridade">Valores de Senioridade</a></li>
                        <li><a href="funcionarios_do_mes">Funcionários do mês</a></li>
                        <li><a href="alterar_valores_senioridade">Alterar Valores</a></li>
                    </ul>
                </li>

                <li><a href="#">Área do Dev</a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_dev">Cadastrar Dev</a></li>
                        <li><a href="especialidade_dev">Cadastrar Especialidade</a></li>
                        <li><a href="ingressar_projeto">Ingressar em um Projeto</a></li>
                    </ul>
                </li>

                <li><a href="#">Linguagens e Frameworks</a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_linguagens">Cadastrar Linguagens</a></li>
                        <li><a href="cadastrar_frameworks">Cadastrar Frameworks</a></li>
                    </ul>
                </li>

                <li><a href="#">  Projetos  </a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_projeto">Criar Projeto</a></li>
                        <li><a href="atualizar_frameworks">Atualizar Frameworks utilizados</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>

    <main class="shadow">

        <div class="Bem-vindo">
            <h1 id="sub_logo">Bem-vindo à <img src="../../assets/favicon_shield_25x25.png" alt="">Empresa<span>Segura</span></h1>
            <p>Na <span class="loguinho">Empresa<span>Segura</span></span>, acreditamos que segurança e tecnologia caminham lado a lado. Com uma equipe dedicada e altamente capacitada, desenvolvemos soluções de software robustas e sob medida para projetos que exigem confiabilidade, agilidade e inovação. &#x1F4F1;</p>
            
        </div>
        <br>

        <div class="dd">
            <h2>🎯Nossa Missão🎯</h2>
            <p>Desenvolver projetos de software com excelência técnica, mantendo o <strong>compromisso com a segurança da informação</strong>, a padronização tecnológica e a valorização de nossos talentos.</p>
        </div>
        <br>

        <div class="dd">
            <h2>👨‍💻Nossos Desenvolvedores👨‍💻</h2>
            <p>Contamos com profissionais de diversas formações, sejam técnicos ou com graduação superior. Cada desenvolvedor atua com um nível de <strong>senioridade bem definido — júnior, pleno ou sênior</strong> — e tem sua remuneração calculada de forma justa, baseada na experiência e competência.</p>
        </div>

        <div class="dd">
            <h2>📚Valorizamos o Conhecimento📚</h2>
            <p>Nossos profissionais são especialistas em múltiplas <strong>linguagens de programação</strong>, o que garante flexibilidade e a escolha da melhor tecnologia para cada projeto. A empresa incentiva a <strong>formação contínua</strong> e o <strong>desenvolvimento de habilidades em diferentes paradigmas:</strong></p>
            <ul>
                <li><strong>Modular</strong></li>
                <li><strong>Orientado a Objetos (OO)</strong></li>
                <li><strong>Funcional</strong></li>
            </ul>
        </div>

        <div class="dd"> 
            <h2>💻Tecnologia com Padronização💻</h2>
            <p>Para garantir organização e produtividade, cada linguagem de programação é acompanhada de uma <strong>IDE padronizada</strong>, cuidadosamente escolhida para melhor atender às necessidades dos projetos.</p>
        </div>

        <div class="dd">
            <h2>🧩Frameworks Atualizados, Sempre🧩</h2>
            <p>Nosso sistema permite o uso de <strong>frameworks especializados</strong>, vinculados diretamente à linguagem utilizada. Mantemos sempre a versão mais atualizada de cada framework, garantindo que o projeto esteja alinhado <strong>às melhores práticas do mercado</strong>, sem permitir retrocessos ou versões ultrapassadas.</p>
        </div>

        <div class="dd">
            <h2>🛠️Projetos que Transformam🛠️</h2>
            <p>
                Cada projeto é desenvolvido com foco total em <strong>qualidade e resultado</strong>.<br>Ele possui:
                <ul>
                    <li>Uma <strong>linguagem principal</strong></li>
                    <li>Pode utilizar <strong>diversos frameworks associados</strong></li>
                    <li>É executado por <strong>um ou mais desenvolvedores especialistas</strong></li>
                    <li>Conta com <strong>nome, data de início, duração estimada e orçamento controlado</strong></li>
                </ul>
            </p>
        </div>

        <div class="dd">
            <h2>🏆Nossos Valores🏆</h2>
            <ul>
                <li><strong>Comprometimento com a qualidade</strong></li>
                <li><strong>Valorização profissional</strong></li>
                <li><strong>Padronização tecnológica</strong></li>
                <li><strong>Segurança em todos os níveis</strong></li>
                <li><strong>Atualização contínua</strong></li>
            </ul>
        </div>

        <div class="dd">
            <h2>🤝Junte-se a Nós🤝</h2>
            <p>Se você é apaixonado por desenvolvimento de software, busca desafios técnicos e acredita que segurança é essencial, venha fazer parte da nossa equipe! <strong><del>SOFRA CONOSCO</del></strong></p>
        </div>

        <div class="dd">
            <h2>❗🤖ATENÇÃO🤖❗</h2>
            <P>Os textos desse site foram gerados por IA, é muito texto 😭</P>
            <p>Como esse Projeto foi feito? Olhe o Passo-a-passo</p>
            <ol>
                <li>Passo: Ler o <strong><a href="./docs/Av2_LabBD.pdf" class="a_link_clicavel" target="_blank">enunciado</a></strong></li>
                <li>Passo: Montar o <strong><a href="./docs/diagrama_de_relacionamento_de_entidades.jpg" class="a_link_clicavel" target="_blank">Diagrama De Entidades</a></strong></li>
                <li>Passo: Montar o <strong><a href="./docs/diagrama_de_classes.jpg" class="a_link_clicavel" target="_blank">Diagrama De Classes</a></strong></li>
                <li>Passo: Montar o <strong><a href="./docs/banco_de_dados_empresa_seguranca.sql" class="a_link_clicavel" target="_blank">Banco de Bagos(TRIGGERs/PROCEDUREs/FUNCTIONs)</a></strong></li>
                <li>Passo: <Strong>Desenvolver o HTML</Strong> (QUE ESTÁ LINDO APROPOSITO 😆)</li>
                <li>Passo: <strong>Desenvolver o CSS</strong> (Que deixou o site mais bonito ainda)</li>
                <li>Passo: <Strong>Fazer o JAVA!!!</Strong></li>
                <li>Passo final: Enviar e torcer pra que funcione</li>
            </ol>
        </div>

    </main>

    <footer>
        <p>Desenvolvido por <a href="https://github.com/AnGeloMuniZZZ" target="_blank">Angelo</a> & <a href="https://github.com/FabioAS7" target="_blank">Fábio</a></p>
        <p>|</p>
        <p> <a href="politicadeprivacidade" target="_blank">Política de Privacidade</a></p>
        <p>|</p>
        <p><a href="#">Termos e Condições</a></p>
        <p>|</p>
        <p><a href="${pageContext.request.contextPath}/maven-site/index.html" target="_blank">Sobre este site (MavenSite)</a></p>
    </footer>

</body>
</html>