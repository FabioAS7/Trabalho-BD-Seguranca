<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Atualizar Frameworks</title>
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
                <li><a href="index.html" target="_self">Início</a></li>

                <li><a href="#" target="_self">Sobre a empresa</a>
                    <ul class="menu_dropdown">
                        <li><a href="valores_senioridade.html">Valores de Senioridade</a></li>
                        <li><a href="funcionarios_do_mes.html">Funcionários do mês</a></li>
                        <li><a href="alterar_valores_senioridade.html">Alterar Valores</a></li>
                    </ul>
                </li>

                <li><a href="#">Área do Dev</a>
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
            <h1>Frameworks Do Projeto</h1>
            <table> 

                <tr>
                    <td>
                        <label for="nome">Projeto:</label>
                    </td>
                    <td>
                        <select name="id">
                            <c:forEach var="a" items="${projeto}">
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
                        <select name="id">
                            <c:forEach var="b" items="${framework}">
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