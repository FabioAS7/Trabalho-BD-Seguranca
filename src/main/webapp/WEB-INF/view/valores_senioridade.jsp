<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Senioridades</title>
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

    <main>
        <div class="valores_senioridade">
            <h1>
                <img src="./assets/medalha_bronze_20px.ico" alt="">
                Júnior
                <img src="./assets/medalha_bronze_20px.ico" alt="">
            </h1>

            <img src="./assets/pessoa_generica_junior_260x385.jpg" alt="" style="float: right;">

            <p>Se você está começando sua jornada na programação, aqui é o lugar certo pra aprender e evoluir com apoio. No dia a dia, vai trabalhar em tarefas bem definidas, colocar a mão no código, participar das entregas e aprender com os desafios. O mais importante é ter vontade de crescer, entender a lógica dos projetos e buscar evoluir a cada sprint. 
            </p>
           

            <h2>Responsabilidades:</h2>
            <ul>
                <li>Compreender e seguir boas práticas de programação.</li>
                <li>Escrever código simples, legível e funcional com supervisão.</li>
                <li>Corrigir bugs simples com ajuda.</li>
                <li>Executar tarefas de baixa complexidade previamente definidas.</li>
                <li>Escrever testes simples</li>
                <li>Participar de reuniões de equipe (daily, planning, etc.).</li>
                <li>Documentar pequenas partes do sistema.</li>
            </ul>
            <h2>Valor / Hora: <c:out value="${SenioridadeJ }"/></h2>
        </div>

        <div class="valores_senioridade">
            <h1>
                <img src="./assets/medalha_prata_20px.ico" alt="">
                Pleno 
                <img src="./assets/medalha_prata_20px.ico" alt="">
            </h1>

            <img src="./assets/pessoa_generica_pleno_300x200.jpg" alt="" style="float: right;">

            <p>Para quem já tem boa bagagem e consegue assumir tarefas de ponta a ponta. A rotina envolve resolver problemas mais complexos, pensar em melhorias, apoiar colegas mais novos e ajudar a manter o ritmo do time. O dev pleno entende o impacto das suas entregas e contribui para a construção de soluções cada vez mais estáveis e eficientes.</p>

            <h2>Responsabilidades:</h2>
            <ul>
                <li>Analisar e implementar funcionalidades de média/alta complexidade.</li>
                <li>Realizar code reviews construtivos com feedbacks técnicos.</li>
                <li>Ajudar desenvolvedores juniores com dúvidas técnicas.</li>
                <li>Corrigir bugs de diferentes níveis de complexidade.</li>
                <li>Ajudar desenvolvedores juniores com dúvidas técnicas.</li>
                <li>Compreender e trabalhar com APIs, bancos de dados, integrações.</li>
                <li>Entender e aplicar princípios SOLID, Clean Code, DRY, KISS.</li>
                <li>Participar ativamente de decisões técnicas do projeto.</li>
                <li>Aplicar padrões de arquitetura (MVC, REST, etc.).</li>
            </ul>
            <h2>Valor / Hora: <c:out value="${SenioridadeP }"/></h2>
        </div>
       

        <div class="valores_senioridade">
            <h1>
                <img src="./assets/medalha_ouro_20px.ico" alt="">
                Sênior 
                <img src="./assets/medalha_ouro_20px.ico" alt="">
            </h1>

            <img src="./assets/pessoa_generica_senior_260x380.jpg" alt="" style="float: right;">

            <p>Aqui é onde a experiência se transforma em visão estratégica. O papel do sênior vai além do código: ele lidera tecnicamente, ajuda a desenhar soluções escaláveis, antecipa problemas e contribui diretamente com a evolução do produto e da equipe. É uma pessoa que inspira, orienta e ajuda a elevar o nível técnico do time como um todo.</p>
            <h2>Responsabilidades:</h2>
            <ul>
                <li>Liderar decisões de arquitetura de sistemas.</li>
                <li>Definir padrões de desenvolvimento e boas práticas da equipe.</li>
                <li>Mentorar e desenvolver outros devs (plenos e juniores).</li>
                <li>Conduzir POCs (provas de conceito) e avaliar novas tecnologias.</li>
                <li>Revisar arquitetura de microserviços, banco de dados e mensageria.</li>
                <li>Estimular a inovação e melhoria contínua nos projetos.</li>
                <li>Otimizar pipelines de CI/CD e infraestrutura com DevOps.</li>
                <li>Garantir alta cobertura de testes e confiabilidade do sistema.</li>
                <li>Realizar code reviews complexos com foco em performance e manutenibilidade.</li>
                <li>Antecipar problemas técnicos e riscos em entregas.</li>
            </ul>
            <h2>Valor / Hora: <c:out value="${SenioridadeS }"/></h2>
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