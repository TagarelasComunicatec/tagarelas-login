<%@ include file="/view/includes.jsp" %>

<div id="logo">
	<a href="${pageContext.request.contextPath}/index"><img
		src="${pageContext.request.contextPath}/assets/img/logo_tagarelas.png"></a>
</div>
<c:if test="${sessionScope.usuarioLogado != null}">
	<div id="usuario_logado">
		<a href="perfil">
			<c:choose>
	 		<c:when test="${sessionScope.usuarioLogado.foto != null}">
	 			<img id="miniatura_usuario_logado" src="data:image/jpg;base64,<c:out value='${sessionScope.usuarioLogado.fotoString}'/>" width="30" height="30">
	 		</c:when>
	 		<c:when test="${sessionScope.usuarioLogado.facebookId != null}">
	 			<img id="miniatura_usuario_logado" src="//graph.facebook.com/${sessionScope.usuarioLogado.facebookId}/picture?type=small" width="30" height="30">
	 		</c:when>
	 		<c:otherwise>
	 			<img id="miniatura_usuario_logado" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png" width="30" height="30">
	 		</c:otherwise>
 		</c:choose>
 		</a>
 		<div id="links_textuais">
			<a href="perfil"><c:out value="${sessionScope.usuarioLogado.nomeCurto}"></c:out></a> (<a href="logout">sair do sistema</a>)
		</div>
	</div>
</c:if>

<br>
<br>
<br>
<br>
<br>
<ul id="menu">
	<li><a href="#">Din&acirc;micas</a></li>
	<li><a href="#">Sistemas</a></li>
	<li><a href="agenda">Agenda</a></li>
	<li><a href="arquivo">Arquivo</a></li>
	<li><a href="#">Publica&ccedil;&otilde;es</a></li>

	<c:if test="${sessionScope.usuarioLogado == null}">
		<li style="float: right"><a id="ativo" href="login">Entrar</a></li>
	</c:if>

</ul>
