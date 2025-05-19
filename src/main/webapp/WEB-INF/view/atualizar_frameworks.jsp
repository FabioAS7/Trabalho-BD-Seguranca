<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Atualizar Frameworks</title>
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
        <form action="atualizar_frameworks" method="post">
            <h1>Frameworks Do Projeto</h1>
            <table> 

                <tr>
                    <td>
                        <label for="nome">Projeto:</label>
                    </td>
                    <td>
                        <select name="idP">
                            <c:forEach var="a" items="${projetos}">
							    <option value="${a.id}"
								    <c:if test="${projeto.id != null}">selected
                                    </c:if>
                                    >${a.nome}
                                </option>
						    </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="nome">Framework:</label>
                    </td>
                    <td>
                        <select name="idF">
                            <c:forEach var="b" items="${frameworks}">
							    <option value="${b.id}"
								    <c:if test="${framework.id != null}">selected
                                    </c:if>
                                    >${b.nome}
                                </option>
						    </c:forEach>
                        </select>
                    </td>
                </tr>


                <tr>
                    <td><button type="submit" name="botao" value="Adicionar">Adicionar
                    <img src="./assets/botao-adicionar_35x35.ico" alt="">
                    </button></td>
                    
                    <td><button type="submit" name="botao" value="Listar">Listar
                    <img src="./assets/lupa_35x35.ico" alt="">
                    </button></td>

                    <td><button type="submit" name="botao" value="Remover">Remover
                    <img src="./assets/lixeira_35x35.ico" alt="">
                    </button></td>
                </tr>
            </table>
        </form>
	
		 <div>
			<c:if test="${not empty projetos}">
				<table class="table_border table">
					<thead>
						<tr>
							<th>ID do Projeto</th>
							<th>Nome do Projeto</th>
							<th>ID do Framework</th>
							<th>Nome do Framework</th>
                            <th></th>
                            <th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${frameworkUtilizados}">
							<tr>
								<td>${p.projeto.id}</td>
								<td>${p.projeto.nome}</td>
								<td>${p.framework.id}</td>
								<td>${p.framework.nome}</td>
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_projeto?acao=editar&id=${p.projeto.id}">Editar</a>
                                </td> <!--arrumar-->
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_projeto?acao=excluir&id=${p.id}">Deletar</a>
                                </td> <!--arrumar-->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
        <!--Tem q listar? como? tabela assosiativa-->

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