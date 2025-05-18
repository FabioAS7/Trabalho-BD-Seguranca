<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cadastro de Desenvolvedores</title>
    <link rel="shortcut icon" href="./assets/favicon_shield.ico" type="image/x-icon">

    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/footer.css">
</head>
<body>

    <header>
        <nav>
            <h1 id="Logo">
                <a href="index.jsp" target="_self"><img src="./assets/favicon_shield_25x25.png" alt=""></a>Empresa<span>Segura</span>
            </h1>
            <ul>
                <li><a href="index.jsp" target="_self">Início</a></li>

                <li><a href="#" target="_self">Sobre a empresa</a>
                    <ul class="menu_dropdown">
                        <li><a href="valores_senioridade.jsp">Valores de Senioridade</a></li>
                        <li><a href="funcionarios_do_mes.jsp">Funcionários do mês</a></li>
                        <li><a href="alterar_valores_senioridade.jsp">Alterar Valores</a></li>
                    </ul>
                </li>

                <li><a href="#">Área do Dev</a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_dev.jsp">Cadastrar Dev</a></li>
                        <li><a href="especialidade_dev.jsp">Cadastrar Especialidade</a></li>
                        <li><a href="ingressar_projeto.jsp">Ingressar em um Projeto</a></li>
                    </ul>
                </li>

                <li><a href="#">Linguagens e Frameworks</a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_linguagens.jsp">Cadastrar Linguagens</a></li>
                        <li><a href="cadastrar_frameworks.jsp">Cadastrar Frameworks</a></li>
                    </ul>
                </li>

                <li><a href="#">  Projetos  </a>
                    <ul class="menu_dropdown">
                        <li><a href="cadastrar_projeto.jsp">Criar Projeto</a></li>
                        <li><a href="atualizar_frameworks.jsp">Atualizar Frameworks utilizados</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>

    <main class="shadow">
        <form action="cadastrarDev" >
            <h1>Cadastro de Desenvolvedores</h1>
            <table> 
                <tr>
                    <td>
                        <label for="nome">Nome:</label>
                    </td>
                    <td>
                        <input type="text" name="nome" 
                        value='<c:out value="${desenvolvedor.nome}"/>'>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="formacao">Formacao:</label>
                    </td>
                    <td>
                        <input type="radio" value="técnico" name="Formacao">
                        <label for="técnico">Técnico</label>
                        <br>

                        <input type="radio" value="superior" name="Formacao">
                        <label for="superior">Superior</label>
                        <br>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="Senioridade">Senioridade:</label>
                    </td>
                    <td>
                        <input type="radio" value="Junior" name="Senioridade">
                        <label for="Junior ">Júnior </label>
                        <br>

                        <input type="radio" value="Pleno" name="Senioridade">
                        <label for="Pleno">Pleno</label>
                        <br>

                        <input type="radio" value="Senior" name="Senioridade">
                        <label for="Senior">Sênior</label>
                        <br>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td><button type="submit" name="adicionar" value="Adicionar">Adicionar
                    <img src="./assets/botao-adicionar_35x35.ico" alt="">
                    </button></td>
                    
                    <td><button type="submit" name="listar" value="Listar">Listar
                    <img src="./assets/lupa_35x35.ico" alt="">
                    </button></td>

                    <td><button type="submit" name="remover" value="Remover">Remover
                    <img src="./assets/lixeira_35x35.ico" alt="">
                    </button></td>
                </tr>
            </table>
        </form>

        <div>
			<c:if test="${not empty desenvolvedores}">
				<table class="table_border table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Formação</th>
							<th>Senioridade</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${desenvolvedores}">
							<tr>
								<td>${a.id }</td>
								<td>${a.nome }</td>
								<td>${a.formacao}</td>
								<td>${a.senioridade}</td>
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
        <p>Desenvolvido por <a href="https://github.com/AnGeloMuniZZZ" target="_blank">Angelo</a> & <a href="https://github.com/FabioAS7" target="_blank">Fábio</a></p>
        <p>|</p>
        <p> <a href="politicadeprivacidade.html" target="_blank">Política de Privacidade</a></p>
        <p>|</p>
        <p><a href="#">Termos e Condições</a></p>
        <p>|</p>
        <p><a href="#">Sobre este site (MavenSite)</a></p>
    </footer>
    
</body>
</html>