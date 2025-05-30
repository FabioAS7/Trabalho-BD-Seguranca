<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Cadastro de FrameWorks</title>
<link rel="shortcut icon" href="./assets/favicon_shield.ico"
	type="image/x-icon">

<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/footer.css">
</head>
<body>

	<header>
		<nav>
			<h1 id="Logo">
				<a href="index" target="_self"><img
					src="./assets/favicon_shield_25x25.png" alt=""></a>Empresa<span>Segura</span>
			</h1>
			<ul>
				<li><a href="index" target="_self">Início</a></li>

				<li><a href="#" target="_self">Sobre a empresa</a>
					<ul class="menu_dropdown">
						<li><a href="valores_senioridade">Valores de Senioridade</a></li>
						<li><a href="funcionarios_do_mes">Funcionários do mês</a></li>
						<li><a href="alterar_valores_senioridade">Alterar Valores</a></li>
					</ul></li>

				<li><a href="#">Área do Dev</a>
					<ul class="menu_dropdown">
						<li><a href="cadastrar_dev">Cadastrar Dev</a></li>
						<li><a href="especialidade_dev">Cadastrar Especialidade</a></li>
						<li><a href="ingressar_projeto">Ingressar em um Projeto</a></li>
					</ul></li>

				<li><a href="#">Linguagens e Frameworks</a>
					<ul class="menu_dropdown">
						<li><a href="cadastrar_linguagens">Cadastrar Linguagens</a></li>
						<li><a href="cadastrar_frameworks">Cadastrar Frameworks</a></li>
					</ul></li>

				<li><a href="#"> Projetos </a>
					<ul class="menu_dropdown">
						<li><a href="cadastrar_projeto">Criar Projeto</a></li>
						<li><a href="atualizar_frameworks">Atualizar Frameworks
								utilizados</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>

	<main class="shadow">
		<form action="cadastrar_frameworks" method="post">
			<h1>Cadastro de Frameworks</h1>
			<input type=hidden name=id value="${framework.id }">
			<table>
				<tr>
					<td><label for="nome">Nome do Framework:</label></td>
					<td><input type="text" name="nome"
						value='<c:out value="${framework.nome}"/>'></td>
					<td>
						<button type="submit" name="botao" value="Pesquisar">
							Pesquisar <img src="./assets/pesquisa.ico" alt="">
						</button>
					</td>
				</tr>

				<tr>
					<td><label for="versao">Versão: <abbr
							title="Versão no formato major.minor.patch, ex: 1.2.3 — Separados por Ponto(.)"><img
								src="./assets/ponto-de-interrogacao_25x25.ico" alt=""></abbr>
					</label></td>
					<td><input type="text" name="versao"
						value='<c:out value="${framework.versao}"/>'></td>
				</tr>

				<tr>
					<td><label for="linguagem_id">Linguagem:</label></td>
					<td><select name="linguagem_id">
							<c:forEach var="l" items="${linguagens}">
								<option value="${l.id}"
									<c:if test="${framework.linguagem.id == l.id}">selected </c:if>>
									${l.nomeLinguagem}</option>
							</c:forEach>
					</select></td>
					<td>
						<button type="submit" name="botao" value="PesquisarL">
							Pesquisar <img src="./assets/pesquisa.ico" alt="">
						</button>
					</td>
				</tr>

				<tr>
					<td><button type="submit" name="botao" value="Adicionar">
							Adicionar <img src="./assets/botao-adicionar_35x35.ico" alt="">
						</button></td>

					<td><button type="submit" name="botao" value="Listar">
							Listar <img src="./assets/lupa_35x35.ico" alt="">
						</button></td>

					<td><button type="submit" name="botao" value="Remover">
							Remover <img src="./assets/lixeira_35x35.ico" alt="">
						</button></td>
				</tr>
			</table>
		</form>

		<div>
			<c:if test="${not empty frameworks}">
				<table class="table_border table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome do Framework</th>
							<th>Versão</th>
							<th>Linguagem</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="f" items="${frameworks}">
							<tr>
								<td>${f.id}</td>
								<td>${f.nome}</td>
								<td>${f.versao}</td>
								<td>${f.linguagem.nomeLinguagem}</td>
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_frameworks?acao=editar&id=${f.id}">Editar</a>
								</td>
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_frameworks?acao=excluir&id=${f.id}">Deletar</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>

		<aside>
			<c:if test="${not empty saida}">
				<h2 class="h2_mensagem_VALIDACAO">
					<c:out value="${saida}" />
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
        <p> <a href="politicadeprivacidade" target="_blank">Política de Privacidade</a></p>
        <p>|</p>
        <p><a href="#">Termos e Condições</a></p>
        <p>|</p>
        <p><a href="${pageContext.request.contextPath}/maven-site/index.html" target="_blank">Sobre este site (MavenSite)</a></p>
    </footer>

</body>
</html>