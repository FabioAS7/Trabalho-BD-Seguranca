<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Senioridades</title>
    <link rel="shortcut icon" href="../../assets/favicon_shield.ico" type="image/x-icon">

    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/main.css">
    <link rel="stylesheet" href="../../css/footer.css">
</head>
<body>
    
    <header>
        <nav>
            <h1 id="Logo">
                <a href="index.html" target="_self"><img src="../../assets/favicon_shield_25x25.png" alt=""></a>Empresa<span>Segura</span>
            </h1>
            <ul>
                <li><a href="index.html" target="_self">InÃ­cio</a></li>

                <li><a href="#" target="_self">Sobre a empresa</a>
                    <ul class="menu_dropdown">
                        <li><a href="valores_senioridade.html">Valores de Senioridade</a></li>
                        <li><a href="funcionarios_do_mes.html">FuncionÃ¡rios do mÃªs</a></li>
                        <li><a href="alterar_valores_senioridade.html">Alterar Valores</a></li>
                    </ul>
                </li>

                <li><a href="#">Ãrea do Dev</a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_dev.html">Cadastrar Dev</a></li>
                        <li><a href="especialidade_dev.html">Cadastrar Especialidade</a></li>
                        <li><a href="ingressar_projeto.html">Ingressar em um Projeto</a></li>
                    </ul>
                </li>

                <li><a href="#">Linguagens e Frameworks</a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_linguagens.html">Cadastrar Linguagens</a></li>
                        <li><a href="cadastrar_frameworks.html">Cadastrar Frameworks</a></li>
                    </ul>
                </li>

                <li><a href="#">  Projetos  </a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_projeto.html">Criar Projeto</a></li>
                        <li><a href="atualizar_frameworks.html">Atualizar Frameworks utilizados</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="valores_senioridade">
            <h1>
                <img src="../../assets/medalha_bronze_20px.ico" alt="">
                JÃºnior
                <img src="../../assets/medalha_bronze_20px.ico" alt="">
            </h1>

            <img src="../../assets/pessoa_generica_junior_260x385.jpg" alt="" style="float: right;">

            <p>Se vocÃª estÃ¡ comeÃ§ando sua jornada na programaÃ§Ã£o, aqui Ã© o lugar certo pra aprender e evoluir com apoio. No dia a dia, vai trabalhar em tarefas bem definidas, colocar a mÃ£o no cÃ³digo, participar das entregas e aprender com os desafios. O mais importante Ã© ter vontade de crescer, entender a lÃ³gica dos projetos e buscar evoluir a cada sprint. 
            </p>
           

            <h2>Responsabilidades:</h2>
            <ul>
                <li>Compreender e seguir boas prÃ¡ticas de programaÃ§Ã£o.</li>
                <li>Escrever cÃ³digo simples, legÃ­vel e funcional com supervisÃ£o.</li>
                <li>Corrigir bugs simples com ajuda.</li>
                <li>Executar tarefas de baixa complexidade previamente definidas.</li>
                <li>Escrever testes simples</li>
                <li>Participar de reuniÃµes de equipe (daily, planning, etc.).</li>
                <li>Documentar pequenas partes do sistema.</li>
            </ul>
            <h2>Valor / Hora:</h2>
        </div>

        <div class="valores_senioridade">
            <h1>
                <img src="../../assets/medalha_prata_20px.ico" alt="">
                Pleno 
                <img src="../../assets/medalha_prata_20px.ico" alt="">
            </h1>

            <img src="../../assets/pessoa_generica_pleno_300x200.jpg" alt="" style="float: right;">

            <p>Para quem jÃ¡ tem boa bagagem e consegue assumir tarefas de ponta a ponta. A rotina envolve resolver problemas mais complexos, pensar em melhorias, apoiar colegas mais novos e ajudar a manter o ritmo do time. O dev pleno entende o impacto das suas entregas e contribui para a construÃ§Ã£o de soluÃ§Ãµes cada vez mais estÃ¡veis e eficientes.</p>

            <h2>Responsabilidades:</h2>
            <ul>
                <li>Analisar e implementar funcionalidades de mÃ©dia/alta complexidade.</li>
                <li>Realizar code reviews construtivos com feedbacks tÃ©cnicos.</li>
                <li>Ajudar desenvolvedores juniores com dÃºvidas tÃ©cnicas.</li>
                <li>Corrigir bugs de diferentes nÃ­veis de complexidade.</li>
                <li>Ajudar desenvolvedores juniores com dÃºvidas tÃ©cnicas.</li>
                <li>Compreender e trabalhar com APIs, bancos de dados, integraÃ§Ãµes.</li>
                <li>Entender e aplicar princÃ­pios SOLID, Clean Code, DRY, KISS.</li>
                <li>Participar ativamente de decisÃµes tÃ©cnicas do projeto.</li>
                <li>Aplicar padrÃµes de arquitetura (MVC, REST, etc.).</li>
            </ul>
            <h2>Valor / Hora:</h2>
        </div>
       

        <div class="valores_senioridade">
            <h1>
                <img src="../../assets/medalha_ouro_20px.ico" alt="">
                SÃªnior 
                <img src="../../assets/medalha_ouro_20px.ico" alt="">
            </h1>

            <img src="../../assets/pessoa_generica_senior_260x380.jpg" alt="" style="float: right;">

            <p>Aqui Ã© onde a experiÃªncia se transforma em visÃ£o estratÃ©gica. O papel do sÃªnior vai alÃ©m do cÃ³digo: ele lidera tecnicamente, ajuda a desenhar soluÃ§Ãµes escalÃ¡veis, antecipa problemas e contribui diretamente com a evoluÃ§Ã£o do produto e da equipe. Ã uma pessoa que inspira, orienta e ajuda a elevar o nÃ­vel tÃ©cnico do time como um todo.</p>
            <h2>Responsabilidades:</h2>
            <ul>
                <li>Liderar decisÃµes de arquitetura de sistemas.</li>
                <li>Definir padrÃµes de desenvolvimento e boas prÃ¡ticas da equipe.</li>
                <li>Mentorar e desenvolver outros devs (plenos e juniores).</li>
                <li>Conduzir POCs (provas de conceito) e avaliar novas tecnologias.</li>
                <li>Revisar arquitetura de microserviÃ§os, banco de dados e mensageria.</li>
                <li>Estimular a inovaÃ§Ã£o e melhoria contÃ­nua nos projetos.</li>
                <li>Otimizar pipelines de CI/CD e infraestrutura com DevOps.</li>
                <li>Garantir alta cobertura de testes e confiabilidade do sistema.</li>
                <li>Realizar code reviews complexos com foco em performance e manutenibilidade.</li>
                <li>Antecipar problemas tÃ©cnicos e riscos em entregas.</li>
            </ul>
            <h2>Valor / Hora:</h2>
        </div>
    </main>

    <footer>
        <p>Desenvolvido por <a href="https://github.com/AnGeloMuniZZZ" target="_blank">Angelo</a> & <a href="https://github.com/FabioAS7" target="_blank">FÃ¡bio</a></p>
        <p>|</p>
        <p> <a href="politicadeprivacidade.html" target="_blank">PolÃ­tica de Privacidade</a></p>
        <p>|</p>
        <p><a href="#">Termos e CondiÃ§Ãµes</a></p>
        <p>|</p>
        <p><a href="#">Sobre este site (MavenSite)</a></p>
    </footer>

</body>
</html>