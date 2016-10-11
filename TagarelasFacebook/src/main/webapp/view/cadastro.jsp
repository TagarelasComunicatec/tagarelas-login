<%@ include file="/view/header.jsp" %>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div id="cadastro">
	<h2>Cadastro</h2>
	<div id="formulario_cadastro">
		<h3>Fa&ccedil;a seu cadastro no Tagarelas</h3>
		
		<form:form action="cadastrar" method="POST" commandName="usuarioCadastro">
		
		<p class="paragrafo_cadastro">Nome completo*<br>
		<form:input path="nomeCompleto" class="campo_cadastro" /></p>
		
		<p class="paragrafo_cadastro">Nome curto*<br>
		<form:input path="nomeCurto" class="campo_cadastro" /></p>
		
		<p class="paragrafo_cadastro">E-mail*<br>
		<form:input path="email" class="campo_cadastro" /></p>
		
		<p class="paragrafo_cadastro">Senha*<br>
		<form:password path="senha" class="campo_cadastro" /></p>
		
		<p class="paragrafo_cadastro">Confirma&ccedil;&atilde;o da senha*<br>
		<form:password path="confirmacaoSenha" class="campo_cadastro" /></p>
		
		<p class="mensagem">${mensagem}</p>
		
		<input type="submit" name="action" value="Cadastrar" id="botao_cadastro" />

		</form:form>
		<p class="paragrafo_centralizado">J&aacute; possui uma conta? Fa&ccedil;a <a href="login">login</a>.</p>

	</div>
	
	<%@ include file="/view/facebook.jsp" %>
</div>

</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>