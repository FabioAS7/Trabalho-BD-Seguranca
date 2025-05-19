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
        <form action="cadastrar_dev" method="post" >
            <h1>Cadastro de Desenvolvedores</h1>
             <input type=hidden name=id value="${desenvolvedor.id }">
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
                        <button type="submit" name="botao" value="Pesquisar">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="formacao">Formacao:</label>
                    </td>
                    <td>
                    	<input type="radio" value="ensino" name="Formacao">
                        <label for="ensino">Ensino Médio</label>
                        <br>
                    	
                        <input type="radio" value="tecnico" name="Formacao"
                        	<c:if test="${desenvolvedor.formacao == 'tecnico'}"> checked 
                        	</c:if>>
                        <label for="tecnico">Técnico</label>
                        <br>

                        <input type="radio" value="superior" name="Formacao"
                       		<c:if test="${desenvolvedor.formacao == 'superior'}"> checked 
                        	</c:if>>
                        <label for="superior">Superior</label>
                        <br>
                    </td>
                    <td>
                        <button type="submit" name="botao" value="PesquisarF">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="Senioridade">Senioridade:</label>
                    </td>
                    <td>
                        <input type="radio" value="junior" name="Senioridade"
                        	<c:if test="${desenvolvedor.senioridade.nome == 'junior'}"> checked 
                        	</c:if>>
                        <label for="Junior ">Júnior </label>
                        <br>

                        <input type="radio" value="pleno" name="Senioridade"
                        	<c:if test="${desenvolvedor.senioridade.nome == 'pleno'}"> checked 
                        	</c:if>>
                        <label for="Pleno">Pleno</label>
                        <br>

                        <input type="radio" value="senior" name="Senioridade"
                        	<c:if test="${desenvolvedor.senioridade.nome == 'senior'}"> checked 
                        	</c:if>>
                        <label for="Senior">Sênior</label>
                        <br>
                    </td>
                    <td>
                        <button type="submit" name="botao" value="PesquisarSeni">Pesquisar
                        <img src="./assets/pesquisa.ico" alt="">
                        </button>
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
						<c:forEach var="d" items="${desenvolvedores}">
							<tr>
								<td>${d.id }</td>
								<td>${d.nome }</td>
								<td>${d.formacao}</td>
								<td>${d.senioridade.nome}</td>
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_dev?acao=editar&id=${d.id}">Editar</a>
                                </td>
								<td><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_dev?acao=excluir&id=${d.id}">Deletar</a>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>

        <aside>
			<c:if test="${not empty saida}">
				<h2 class="h2_mensagem_VALIDACAO" id=h2_mensagem_VALIDACAO>
					<c:out value="${saida}"/>
				</h2>
			</c:if>
			<c:if test="${not empty erro}">
				<h2 class="h2_mensagem_ERRO" id="h2_mensagem_ERRO">
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