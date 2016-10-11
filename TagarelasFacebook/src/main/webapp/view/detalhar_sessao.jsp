<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/view/includes.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link href="${pageContext.request.contextPath}/assets/css/jquery.guillotine.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/assets/css/NewStyle.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jQueryRotate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.guillotine.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.guillotine.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<meta property="og:title" content="Convite para a sessão ${sessao.titulo}">
	<meta property="og:description" content="Sessão agendada por ${sessao.proprietario.nomeCurto} para <fmt:formatDate value='${sessao.diaHorario}' pattern='dd/MM/yyyy - HH:mm'/>. Descrição: ${sessao.descricao}">
	
	<title>Tagarelas</title>
</head>
<body>	

<c:if test="${idConvite != null}"> 
<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId : 'COLOQUE O ID DO APP AQUI',
			xfbml : true,
			version : 'v2.7'
		});
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/pt_BR/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
</c:if>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div class="detalhes_sessao">

	<div class="titulo_sessao">
			<h2>Sess&atilde;o <c:out value="${sessao.sistemaBatePapo.nome}"></c:out>: "<c:out value="${sessao.titulo}"></c:out>"</h2>
			<p>Organizada por: <c:out value="${sessao.proprietario.nomeCurto}"></c:out></p>
	</div>
	
	<p class="mensagem_participacao">${mensagem}</p>
	
	<c:if test="${idConvite != null}">
		<div class="centralizado">
			<p class="mensagem_participacao">O convite foi criado. Clique no bot&atilde;o para compartilhar com os seus amigos do Facebook.</p>
			<button id="convidar_amigos_facebook" class="botao_facebook"><img alt="Logo do Facebook" src="${pageContext.request.contextPath}/assets/img/f_facebook_2.png"> Convidar amigos do Facebook</button>
			<br><br>
		</div>
		<script>
			document.getElementById('convidar_amigos_facebook').onclick = function() {
			  FB.ui({
			    method: 'share',
			    hashtag: '#Tagarelas',
			    picture: 'https://fbcdn-photos-c-a.akamaihd.net/hphotos-ak-xfa1/t39.2081-0/p200x200/13706771_319856228351579_1060594279_n.png',
			    href: '${dominio}/TagarelasFacebook/convite?id=${idConvite}'
			  }, function(response){});
			}
		</script>
	</c:if>
	
	<div class="dados_sessao">
		
		<form:form commandName="sessao">
			
			<div class="subdivisao_dados_sessao">
				<h3>Agendamento</h3>
				<p>
					Dia/hor&aacute;rio: <fmt:formatDate value='${sessao.diaHorario}' pattern='dd/MM/yyyy HH:mm'/>
				</p>
			</div>
			
			<div class="subdivisao_dados_sessao">
				<h3>Sobre</h3>
				<p>
					Descri&ccedil;&atilde;o:<br>
					<form:textarea path="descricao" readonly="true" />
				</p>
			
				<p>
					Observa&ccedil;&atilde;o:<br>
					<form:textarea path="observacao" readonly="true" />
				</p>
			</div>
			
		</form:form>
	</div>
	
	<div class="participacao_sessao">
		<h3>Participantes</h3>
		<div id="botoes_sessao">
		 	<a class="link_perfil" href="${pageContext.request.contextPath}/participar-sessao?id=${sessao.id}">Participar</a>
		 	<a class="link_perfil" href="${pageContext.request.contextPath}/convidar?idSessao=${sessao.id}">Convidar</a>
		</div>
		<div id="participantes_confirmados">
			<display:table id="participante" name="participantes" pagesize="5" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="">
				<display:column property="nomeCurto" title="Confirmados(as)"/>
				<display:column title="" media="html">
				<c:choose>
					<c:when test="${participante.foto != null}">
						<img alt="Miniatura da imagem do usuário" src="data:image/jpg;base64,${participante.fotoString}" width="32" height="32">
					</c:when>
					<c:when test="${participante.facebookId != null}">
	 					<img alt="Miniatura da imagem do usuário" src="//graph.facebook.com/${participante.facebookId}/picture?height=32&width=32">
	 				</c:when>
					<c:otherwise>
						<img alt="Miniatura da imagem de usuário genérica" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png" width="32" height="32">
					</c:otherwise>
    			</c:choose>	
    			</display:column>
			</display:table>
		</div>
	</div>

</div>

</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>