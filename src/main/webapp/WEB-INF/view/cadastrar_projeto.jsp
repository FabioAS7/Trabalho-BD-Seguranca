<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cadastro de Projetos</title>
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
        <form action="cadastrarDev">
            <h1>Criação de Projetos</h1>
            <table> 
                <tr>
                    <td>
                        <label for="nome">Nome do Projeto:</label>
                    </td>
                    <td>
                        <input type="text" name="nome" 
                        value='<c:out value="${projeto.nome}"/>'>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="data_inicio">Data de Inicio:</label>
                    </td>
                    <td>
                        <input type="date" name="data_inicio" 
                        value='<c:out value="${framework.data_inicio}"/>'>
                    </td>
                    <td>
                        <button type="submit" name="pesquisar" value="Pesquisar">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="quant_dias_estimados">Quant. de dias estimados:</label>
                    </td>
                    <td>
                        <input type="number" name="quant_dias_estimados" 
                        value='<c:out value="${framework.quant_dias_estimados}"/>'>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="orcamento">Orçamento:
                            <abbr title="O valor informado deve ser separado por ponto, ex: 3296.00"><img src="../../assets/ponto-de-interrogacao_25x25.ico" alt=""></abbr>
                        </label>
                    </td>
                    <td>
                        <input type="number" name="orcamento" 
                        value='<c:out value="${framework.orcamento}"/>'>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="linguagem_id">Linguagem:</label>
                    </td>
                    <td>
                        <select name="linguagem_id">
                            <c:forEach var="a" items="${linguagens}">
							    <option value="${a.id}"
								    <c:if test="${linguagem.id != null}">selected
                                    </c:if>
                                    >${a.nome}
                                </option>
						    </c:forEach>
                        </select>
                    </td>
                    <!--Como diabos isso funciona?-->
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

                    <td><button type="submit" name="listar_atrasados" value="listar_atrasados">Listar Atrasados
                    <img src="./assets/lupa_calendario_35x35.ico" alt="">
                    </button></td>
                </tr>
            </table>
        </form>

        <!--Pesquisa normal-->
        <div>
			<c:if test="${not empty framework}">
				<table class="table_border table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome do Projeto</th>
							<th>Data de Inicio</th>
							<th>Quant. de dias Estimados</th>
                            <th>Orçamento</th>
                            <th>Linguagem</th>
                            <th></th>
                            <th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${projeto}">
							<tr>
								<td>${a.id}</td>
								<td>${a.nome}</td>
								<td>${a.data_inicio}</td>
                                <td>${a.quant_dias_estimados}</td>
                                <td>${a.orcamento}</td>
                                <td>${a.linguagem.nome}</td> <!--Assim?-->
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
        

        <!--Pesquisa de Atrasados-->
        <br>
        <div>
			<c:if test="${not empty framework}">
				<table class="table_border table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome do Projeto</th>
							<th>Data de Inicio</th>
							<th>Quant. de dias Estimados</th>
                            <th>Quant. de dias Atrasados</th>
                            <th>Orçamento</th>
                            <th>Linguagem</th>
                            <th></th>
                            <th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${projeto}">
							<tr>
								<td>${a.id}</td>
								<td>${a.nome}</td>
								<td>${a.data_inicio}</td>
                                <td>${a.quant_dias_estimados}</td>
                                <td>${a.quant_dias_atrasados} &#x26A0;&#xFE0F;</td> <!--Atrasados-->
                                <td>${a.orcamento}</td>
                                <td>${a.linguagem.nome}</td> <!--Assim?-->
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