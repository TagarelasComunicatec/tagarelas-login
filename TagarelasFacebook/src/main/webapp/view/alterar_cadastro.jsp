<%@ include file="/view/header.jsp"%>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div class="alterar_cadastro">
	<h2>Altera&ccedil;&atilde;o de dados</h2>

		<form:form action="alterar_cadastro" method="POST" commandName="usuarioCadastro">
			
			<p class="paragrafo_cadastro">
				Nome completo*<br>
				<form:input path="nomeCompleto" class="campo_cadastro" />
			</p>

			<p class="paragrafo_cadastro">
				Nome curto*<br>
				<form:input path="nomeCurto" class="campo_cadastro" />
			</p>

			<p class="paragrafo_cadastro">
			
				<c:choose>
					<c:when test="${usuarioCadastro.senha == null}">
						E-mail<br>
					</c:when>
					<c:otherwise>
						E-mail*<br>
					</c:otherwise>
				</c:choose>
				
				<form:input path="email" class="campo_cadastro" />
			</p>

			<p class="mensagem_a_esquerda">${mensagem}</p>

			<input type="submit" name="action" value="Salvar" id="botao_alterar_cadastro" />

		</form:form>

</div>

</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>