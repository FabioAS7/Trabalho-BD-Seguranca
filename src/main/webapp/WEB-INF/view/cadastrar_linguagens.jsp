<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cadastro de Linguagens</title>
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
        <form action="cadastrarDev" >
            <h1>Cadastro de Linguagens</h1>
            <table> 
                <tr>
                    <td>
                        <label for="nome_linguagem">Nome da Linguagem:</label>
                    </td>
                    <td>
                        <input type="text" name="nome_linguagem" 
                        value='<c:out value="${linguagem.nome_linguagem}"/>'>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="../../assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="Tipo">Tipo:</label>
                    </td>
                    <td>
                        <input type="radio" value="modular" name="tipo">
                        <label for="Modular">Modular</label>
                        <br>

                        <input type="radio" value="oo" name="tipo">
                        <label for="Orientada a objetos">Orientada a objetos</label>
                        <br>

                        <input type="radio" value="funcional" name="tipo">
                        <label for="Funcional">Funcional</label>
                        <br>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="../../assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="nome_ide">IDE Utilizada:</label>
                    </td>
                    <td>
                        <input type="text" name="nome_ide" 
                        value='<c:out value="${linguagem.nome_ide}"/>'>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="../../assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td><button type="submit" name="adicionar" value="Adicionar">Adicionar
                    <img src="../../assets/botao-adicionar_35x35.ico" alt="">
                    </button></td>
                    
                    <td><button type="submit" name="listar" value="Listar">Listar
                    <img src="../../assets/lupa_35x35.ico" alt="">
                    </button></td>

                    <td><button type="submit" name="remover" value="Remover">Remover
                    <img src="../../assets/lixeira_35x35.ico" alt="">
                    </button></td>
                </tr>
            </table>
        </form>

        <div>
			<c:if test="${not empty linguagens}">
				<table class="table_border table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome da Linguagem</th>
							<th>Tipo</th>
							<th>IDE Utilizada</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${linguagens}">
							<tr>
								<td>${a.id}</td>
								<td>${a.nome_linguagem}</td>
								<td>${a.tipo}</td>
								<td>${a.nome_ide}</td>
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/controleDev?acao=editar&id=${a.id}">Editar</a>
                                </td> <!--arrumar-->
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/controleDev?acao=editar&id=${a.id}">Deletar</a>
                                </td> <!--arrumar-->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>

        <aside>
			<c:if test="${not empty saida}">
				<h2 class="h2_mensagem_VALIDACAO">
					<c:out value="${saida}"/>
				</h2>
			</c:if>
			<c:if test="${not empty erro}">
				<h2 class="h2_mensagem_ERRO">
					<c:out value="${erro}" />
				</h2>
			</c:if>
		</aside>
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