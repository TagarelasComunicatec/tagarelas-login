<%@ include file="/view/header.jsp"%>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div class="alterar_cadastro">
	<h2>Altera&ccedil;&atilde;o de senha</h2>
	
	<c:choose>
		<c:when test="${sessionScope.usuarioLogado.senha != null}">
		
			<form:form action="alterar_senha" method="POST" commandName="usuarioCadastro">
			
				<p class="paragrafo_cadastro">
					Senha atual*<br>
					<form:password path="senha" class="campo_cadastro" />
				</p>
				
				<p class="paragrafo_cadastro">
					Nova senha*<br>
					<form:password path="novaSenha" class="campo_cadastro" />
				</p>
				
				<p class="paragrafo_cadastro">
					Confirma&ccedil;&atilde;o da nova senha*<br>
					<form:password path="confirmacaoNovaSenha" class="campo_cadastro" />
				</p>
	
				<p class="mensagem_a_esquerda">${mensagem}</p>
	
				<input type="submit" name="action" value="Salvar" id="botao_alterar_senha" />

			</form:form>
			
		</c:when>
		<c:when test="${sessionScope.usuarioLogado.email != null && sessionScope.usuarioLogado.facebookId != null}">
			<p>Voc&ecirc; acessou o Tagarelas pelo Facebook e n&atilde;o possui uma senha cadastrada.</p>
			<p>Cadastre uma senha para habilitar o acesso ao Tagarelas com seu e-mail e senha.</p>
			<p>O seu acesso pelo Facebook continuar&aacute; funcionando normalmente.</p>
			
			<form:form action="cadastrar_senha" method="POST" commandName="usuarioCadastro">
			
				<p class="paragrafo_cadastro">
					Senha*<br>
					<form:password path="novaSenha" class="campo_cadastro" />
				</p>
				
				<p class="paragrafo_cadastro">
					Confirma&ccedil;&atilde;o da senha*<br>
					<form:password path="confirmacaoNovaSenha" class="campo_cadastro" />
				</p>
	
				<p class="mensagem_a_esquerda">${mensagem}</p>
	
				<input type="submit" name="action" value="Salvar" id="botao_alterar_senha" />

			</form:form>
			
		</c:when>
		<c:when test="${sessionScope.usuarioLogado.facebookId != null}">
			<p>Voc&ecirc; acessou o Tagarelas pelo Facebook e n&atilde;o possui e-mail e senha cadastrados.</p>
			<p>Cadastre seu e-mail e senha para habilitar o acesso ao Tagarelas com esses dados.</p>
			<p>O seu acesso pelo Facebook continuar&aacute; funcionando normalmente.</p>
			
			<form:form action="cadastrar_email_senha" method="POST" commandName="usuarioCadastro">
			
				<p class="paragrafo_cadastro">
					E-mail*<br>
					<form:input path="email" class="campo_cadastro" />
				</p>
			
				<p class="paragrafo_cadastro">
					Senha*<br>
					<form:password path="novaSenha" class="campo_cadastro" />
				</p>
				
				<p class="paragrafo_cadastro">
					Confirma&ccedil;&atilde;o da senha*<br>
					<form:password path="confirmacaoNovaSenha" class="campo_cadastro" />
				</p>
	
				<p class="mensagem_a_esquerda">${mensagem}</p>
	
				<input type="submit" name="action" value="Salvar" id="botao_alterar_senha" />

			</form:form>
			
		</c:when>
	</c:choose>

</div>

</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>