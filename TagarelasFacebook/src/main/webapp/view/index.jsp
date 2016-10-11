<%@ include file="/view/header.jsp" %>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

	<div id="aula_interativa">
		<div id="texto_aula_interativa">
			<h2>Torne a sua aula mais interativa!</h2>
			<ul>
				<li>Escolha uma <a href="#">Din&acirc;mica</a> para realizar com a sua turma.</li>
				<li><a href="#">Agende</a> uma sess&atilde;o com o uso de <a href="#">sistema</a> de bate-papo.</li>
			</ul>
			<a href="${pageContext.request.contextPath}/cadastro"><img alt="Link para cadastro" src="${pageContext.request.contextPath}/assets/img/cadastre-se_2.png"></a>
		</div>
		<div id="imagem_aula_interativa">
			<img alt="Aula interativa" src="${pageContext.request.contextPath}/assets/img/aula_interativa.png">
		</div>
	</div>
	<br>
	<div id="dinamicas">
		<p><a href="#"><img src="${pageContext.request.contextPath}/assets/img/dinamicas.png"></a></p>
		<h3>Din&acirc;micas</h3>
		<p>Din&acirc;micas de grupo com bate-papo</p>
	</div>
	
	<div id="agenda">
		<p><a href="agenda"><img src="${pageContext.request.contextPath}/assets/img/agenda.png"></a></p>
		<h3>Agenda</h3>
		<p>Agende suas pr&oacute;ximas sess&otilde;es</p>
	</div>
	
	<div id="sistemas">
		<p><a href="#"><img src="${pageContext.request.contextPath}/assets/img/sistemas.png"></a></p>
		<h3>Sistemas</h3>
		<p>Sistemas de bate-papo</p>
	</div>
</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>