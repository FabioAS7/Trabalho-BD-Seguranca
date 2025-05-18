<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home</title>
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

    <main class="shadow">
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