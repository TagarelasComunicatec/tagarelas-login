<%@ include file="/view/header.jsp"%>

<div class="global">

	<%@ include file="/view/header_parte_2.jsp"%>

	<div id="login">
		<h2>Login</h2>

		<c:if test="${exibirOrientacao}">
			<p class="orientacao">${orientacao}</p>
		</c:if>

		<div id="formulario_login">
			<h3>Fa&ccedil;a seu login no Tagarelas</h3>
			<form:form action="logar" method="POST" commandName="usuarioLogin">
				<p class="paragrafo_cadastro">
					E-mail <br>
					<form:input path="email" class="campo_login" />
				</p>
				<p class="paragrafo_cadastro">
					Senha <br>
					<form:password path="senha" class="campo_login" />
				</p>

				<p class="mensagem">${mensagem}</p>

				<input type="submit" name="action" value="Login" id="botao_login" />

			</form:form>
			<p class="paragrafo_centralizado">
				<a href="#">Esqueci minha senha</a>
			</p>
			<p class="paragrafo_centralizado">
				Ainda n&atilde;o possui uma conta? <a href="cadastro">Cadastre-se</a>.
			</p>
		</div>

		<%@ include file="/view/facebook.jsp"%>

	</div>
</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>