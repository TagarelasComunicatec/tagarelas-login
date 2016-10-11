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

	<meta property="og:title" content="Log da sessão ${sessao.titulo}">
	<meta property="og:description" content="Sessão organizada por ${sessao.proprietario.nomeCurto}, realizada em <fmt:formatDate value='${sessao.diaHorario}' pattern='dd/MM/yyyy - HH:mm'/>.">
	
	<style>
		/* Tooltip container */
		.tooltipTeste {
			position: relative;
			display: inline-block;
		}
		
		/* Tooltip text */
		.tooltipTeste .tooltiptext {
			visibility: hidden;
			width: 120px;
			background-color: black;
			color: #fff;
			text-align: center;
			padding: 5px 0;
			border-radius: 6px;
			/* Position the tooltip text - see examples below! */
			position: absolute;
			z-index: 1;
			bottom: 19px;
			right: -25px;
		}
		
		/* Show the tooltip text when you mouse over the tooltip container */
		.tooltipTeste:hover .tooltiptext {
			visibility: visible;
		}
	</style>
	
	<title>Tagarelas</title>
</head>
<body>	

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

<div class="global">

	<%@ include file="/view/header_parte_2.jsp" %>

	<div id="log">
		<h2 id="titulo_log">Log</h2>
		
		<div class="direita">
			<button id="compartilhar_facebook" class="botao_facebook"><img alt="Logo do Facebook" src="${pageContext.request.contextPath}/assets/img/f_facebook_2.png"> Compartilhar no Facebook</button>
			<br><br>

			<script>
				document.getElementById('compartilhar_facebook').onclick = function() {
				  FB.ui({
				    method: 'share',
				    hashtag: '#Tagarelas',
				    picture: 'https://fbcdn-photos-c-a.akamaihd.net/hphotos-ak-xfa1/t39.2081-0/p200x200/13706771_319856228351579_1060594279_n.png',
				    href: '${dominio}/TagarelasFacebook/log?id=${sessao.id}'
				  }, function(response){});
				}
			</script>
			
		</div>

		<div id="conversa">
		
			<div id="conteudoEsq"><!-- conteúdo lado esquerdo = caixa de envio de mensagem, janela chat -->
				<div id="janela_chat">	<!-- só mensagens-->
					<div id="mensagens_Chat"> <!--  -->
						<div id="mensagens" class="cabecalhoChat">
							<div class="avisos">
								Sessão: ${sessao.titulo}. Realizada em: <fmt:formatDate value='${sessao.diaHorario}' pattern='dd/MM/yyyy - HH:mm'/>
							</div>
							<br>

			<div id="msg_576">
				<div class="msgAvatar">
					<div class="foto">
						<img class="avatar"
							src="${pageContext.request.contextPath}/assets/img/pimentel.jpg"
							alt="Pimentel" title="Pimentel"><br>
					</div>
					<span id="nomeUsuario">Pimentel</span>
				</div>

				<div class="msgInfo">
					<div class="speechBalloon">
						<p class="msgContent">oi dolor.</p>
					</div>

					<div id="linksAcoes_576">
						<a class="respondo" href="#">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="acao" title="Curtir" href="#"><i
							class="fa fa-heart-o"></i>&nbsp;<span class="curtir_576">0</span></a>
						| <a class="acao" title="Relevante" href="#"><i
							class="fa fa-star-o"></i>&nbsp;<span class="relevante_576">0</span></a>
						| <a class="acao" title="Concordo" href="#"><i
							class="fa fa-thumbs-o-up"></i>&nbsp;<span class="concordo_576">0</span></a>
						| <a class="acao" title="Discordo" href="#"><i
							class="fa fa-thumbs-o-down"></i>&nbsp;<span class="discordo_576">0</span></a>
					</div>

				</div>
			</div>
			<br clear="all">

			<div id="msg_576">

				<div class="speechBalloonCoText">
					<strong>Marcelo</strong> - vamos testar
				</div>

				<div class="msgAvatar">
					<div class="foto">
						<img class="avatar"
							src="${pageContext.request.contextPath}/assets/img/pimentel.jpg"
							alt="Pimentel" title="Pimentel"><br>
					</div>
					<span id="nomeUsuario">Pimentel</span>
				</div>

				<div class="msgInfo">
					<div class="speechBalloon">
						<p class="msgContent">Sit amet, consectetur adipiscing elit.
							Phasellus sapien nisi, rhoncus auctor magna eu, facilisis congue
							nulla. Proin porttitor eros libero. Mauris ac scelerisque augue,
							vitae tristique tellus. Maecenas sit amet ornare neque.
							Pellentesque habitant morbi tristique senectus et netus et
							malesuada fames ac turpis egestas. Vivamus sapien eros, aliquam
							quis enim ut, fermentum porttitor massa. In faucibus et nisi sit
							amet feugiat. Cras in felis mollis, tristique nunc sit amet,
							congue erat. Suspendisse potenti. Proin quis nibh purus. Quisque
							ultrices vulputate elementum.</p>
					</div>

					<div id="linksAcoes_576">
						<a class="respondo" href="#">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="acao" title="Curtir" href="#"><i
							class="fa fa-heart-o"></i>&nbsp;<span class="curtir_576">0</span></a>
						| <a class="acao" title="Relevante" href="#"><i
							class="fa fa-star-o"></i>&nbsp;<span class="relevante_576">0</span></a>
						| <a class="acao" title="Concordo" href="#"><i
							class="fa fa-thumbs-o-up"></i>&nbsp;<span class="concordo_576">0</span></a>
						| <a class="acao" title="Discordo" href="#"><i
							class="fa fa-thumbs-o-down"></i>&nbsp;<span class="discordo_576">0</span></a>
					</div>
				</div>
			</div>
			<br clear="all">


			<div id="msg_577">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:44:52</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">mudei muita coisa</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_577">
						<a href="#"  class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_577">1</span>)
							</a> <span id="tooltip_curtir_577" class="tooltiptext">Pimentel,
								Mariano<br>
							</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_577">0</span>)
							</a> <span id="tooltip_relevante_577" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_577">0</span>)
							</a> <span id="tooltip_concordo_577" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_577">0</span>)
							</a> <span id="tooltip_discordo_577" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_578">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:07</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">apliquei algumas coisas de banco coloquei para
					jquery</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_578">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_578">0</span>)
							</a> <span id="tooltip_curtir_578" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_578">0</span>)
							</a> <span id="tooltip_relevante_578" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_578">0</span>)
							</a> <span id="tooltip_concordo_578" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_578">0</span>)
							</a> <span id="tooltip_discordo_578" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_579">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:09</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">com ajax</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_579">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_579">0</span>)
							</a> <span id="tooltip_curtir_579" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_579">0</span>)
							</a> <span id="tooltip_relevante_579" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_579">0</span>)
							</a> <span id="tooltip_concordo_579" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_579">0</span>)
							</a> <span id="tooltip_discordo_579" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div class="arrowchat_chatboxmessagecontent arrowchat_self dial"
				style="display: none; margin-left: 0px; border-top: 1px solid #eee"
				id="divResp_580">
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div class="balaoInside" id="balaoEncadeaInside"></div>
							<strong>Marcelo</strong> - mudei muita coisa
						</div>
					</div>
				</div>
			</div>
			<div id="divInjetaModal_580">
				<div id="msgEncadeadaInside">
					<div id="encadeadaInside">
						<div class="balaoInside" id="balaoEncadeaInside"></div>
						<div id="historico">
							<div class="balaoHistorico" id="balaoEncadeaHistorico"></div>
							
						</div>
						<strong>Marcelo</strong> - mudei muita coisa
					</div>
				</div>
			</div>
			<div id="msg_580">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:10</span> <img
					class="avatar"
					src="${pageContext.request.contextPath}/assets/img/pimentel.jpg">
				<span id="nomeUsuario"><strong>Pimentel</strong></span><br>
				<div id="texto">Quais mudanças foram feitas?</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_580">
						<a href="#"
							class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_580">0</span>)
							</a> <span id="tooltip_curtir_580" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_580">1</span>)
							</a> <span id="tooltip_relevante_580" class="tooltiptext">Marcelo
								Estruc<br>
							</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_580">0</span>)
							</a> <span id="tooltip_concordo_580" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_580">0</span>)
							</a> <span id="tooltip_discordo_580" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_581">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:21</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">as requisicoes do banco diminuira</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_581">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_581">0</span>)
							</a> <span id="tooltip_curtir_581" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_581">0</span>)
							</a> <span id="tooltip_relevante_581" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_581">0</span>)
							</a> <span id="tooltip_concordo_581" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_581">0</span>)
							</a> <span id="tooltip_discordo_581" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_582">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:31</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">ssim o servidor ficou menos carregado</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_582">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_582">0</span>)
							</a> <span id="tooltip_curtir_582" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_582">0</span>)
							</a> <span id="tooltip_relevante_582" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_582">0</span>)
							</a> <span id="tooltip_concordo_582" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_582">0</span>)
							</a> <span id="tooltip_discordo_582" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_583">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:45</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">veja se a velocidade melhorou</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_583">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_583">0</span>)
							</a> <span id="tooltip_curtir_583" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_583">0</span>)
							</a> <span id="tooltip_relevante_583" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_583">0</span>)
							</a> <span id="tooltip_concordo_583" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_583">0</span>)
							</a> <span id="tooltip_discordo_583" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_584">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:45:57</span> <img
					class="avatar"
					src="${pageContext.request.contextPath}/assets/img/pimentel.jpg">
				<span id="nomeUsuario"><strong>Pimentel</strong></span><br>
				<div id="texto">opa... faz sentido. Vc está mantendo tudo em
					memória no servidor?</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_584">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_584">0</span>)
							</a> <span id="tooltip_curtir_584" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_584">0</span>)
							</a> <span id="tooltip_relevante_584" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_584">0</span>)
							</a> <span id="tooltip_concordo_584" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_584">0</span>)
							</a> <span id="tooltip_discordo_584" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_585">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:08</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">agora nao</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_585">
						<a href="#" class="respondo">Cancelar</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_585">0</span>)
							</a> <span id="tooltip_curtir_585" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_585">0</span>)
							</a> <span id="tooltip_relevante_585" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_585">0</span>)
							</a> <span id="tooltip_concordo_585" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_585">0</span>)
							</a> <span id="tooltip_discordo_585" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div class="arrowchat_chatboxmessagecontent arrowchat_self dial"
				style="margin-left: 0; border-top: 1px solid #eee" id="dialogo_null">
				<div style="padding-left: 5px; color: #D3D3D3">Edmilson acabou
					de entrar na sala...</div>
			</div>
			<div id="msg_587">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:19</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">agora é pelo brwnser</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_587">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_587">0</span>)
							</a> <span id="tooltip_curtir_587" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_587">0</span>)
							</a> <span id="tooltip_relevante_587" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_587">0</span>)
							</a> <span id="tooltip_concordo_587" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_587">0</span>)
							</a> <span id="tooltip_discordo_587" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div class="arrowchat_chatboxmessagecontent arrowchat_self dial"
				style="display: none; margin-left: 0px; border-top: 1px solid #eee"
				id="divResp_589">
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div class="balaoInside" id="balaoEncadeaInside"></div>
							<strong>Marcelo</strong> - veja se a velocidade melhorou
						</div>
					</div>
				</div>
			</div>
			<div id="divInjetaModal_589">
				<div id="msgEncadeadaInside">
					<div id="encadeadaInside">
						<div class="balaoInside" id="balaoEncadeaInside"></div>
						<div id="historico">
							<div class="balaoHistorico" id="balaoEncadeaHistorico"></div>
							
						</div>
						<strong>Marcelo</strong> - veja se a velocidade melhorou
					</div>
				</div>
			</div>
			<div id="msg_589">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:26</span> <img
					class="avatar"
					src="${pageContext.request.contextPath}/assets/img/pimentel.jpg">
				<span id="nomeUsuario"><strong>Pimentel</strong></span><br>
				<div id="texto">Aqui está com velocidade boa!</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_589">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_589">0</span>)
							</a> <span id="tooltip_curtir_589" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_589">0</span>)
							</a> <span id="tooltip_relevante_589" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_589">0</span>)
							</a> <span id="tooltip_concordo_589" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_589">0</span>)
							</a> <span id="tooltip_discordo_589" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_590">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:29</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">blz edmilson</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_590">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_590">0</span>)
							</a> <span id="tooltip_curtir_590" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_590">0</span>)
							</a> <span id="tooltip_relevante_590" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_590">0</span>)
							</a> <span id="tooltip_concordo_590" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_590">0</span>)
							</a> <span id="tooltip_discordo_590" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div class="arrowchat_chatboxmessagecontent arrowchat_self dial"
				style="display: none; margin-left: 0px; border-top: 1px solid #eee"
				id="divResp_591">
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div class="balaoInside" id="balaoEncadeaInside"></div>
							<strong>Marcelo</strong> - blz edmilson
						</div>
					</div>
				</div>
			</div>
			<div id="divInjetaModal_591">
				<div id="msgEncadeadaInside">
					<div id="encadeadaInside">
						<div class="balaoInside" id="balaoEncadeaInside"></div>
						<div id="historico">
							<div class="balaoHistorico" id="balaoEncadeaHistorico"></div>
							<div id="linkEncad">
								
							</div>
						</div>
						<strong>Marcelo</strong> - blz edmilson
					</div>
				</div>
			</div>
			<div id="msg_591">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:38</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Edmilson</strong></span><br>
				<div id="texto">blz marcelo</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_591">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_591">0</span>)
							</a> <span id="tooltip_curtir_591" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_591">0</span>)
							</a> <span id="tooltip_relevante_591" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_591">0</span>)
							</a> <span id="tooltip_concordo_591" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_591">0</span>)
							</a> <span id="tooltip_discordo_591" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div class="arrowchat_chatboxmessagecontent arrowchat_self dial"
				style="display: none; margin-left: 0px; border-top: 1px solid #eee"
				id="divResp_592">
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div id="historico"></div>
							<div id="msg_590">
								<span class="data" id="hora_590">11:46:29</span> <img
									class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
								<strong>Marcelo</strong> <br>
								<div id="texto">blz edmilson</div>
								<br clear="all">
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div class="balaoInside" id="balaoEncadeaInside"></div>
							<strong>Edmilson</strong> - blz marcelo
						</div>
					</div>
				</div>
			</div>
			<div id="divInjetaModal_592">
				<div id="msgEncadeadaInside">
					<div id="encadeadaInside">
						<div class="balaoInside" id="balaoEncadeaInside"></div>
						<div id="historico">
							<div class="balaoHistorico" id="balaoEncadeaHistorico"></div>
							
						</div>
						<strong>Edmilson</strong> - blz marcelo
					</div>
				</div>
			</div>
			<div id="msg_592">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:48</span> <img
					class="avatar"
					src="${pageContext.request.contextPath}/assets/img/pimentel.jpg">
				<span id="nomeUsuario"><strong>Pimentel</strong></span><br>
				<div id="texto">oi Edmilson!</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_592">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_592">0</span>)
							</a> <span id="tooltip_curtir_592" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_592">0</span>)
							</a> <span id="tooltip_relevante_592" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_592">0</span>)
							</a> <span id="tooltip_concordo_592" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_592">0</span>)
							</a> <span id="tooltip_discordo_592" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_593">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:49</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">ainda nao fiz o que vc pediu</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_593">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_593">0</span>)
							</a> <span id="tooltip_curtir_593" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_593">0</span>)
							</a> <span id="tooltip_relevante_593" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_593">0</span>)
							</a> <span id="tooltip_concordo_593" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_593">0</span>)
							</a> <span id="tooltip_discordo_593" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_594">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:46:55</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">do clicar no icone</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_594">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_594">0</span>)
							</a> <span id="tooltip_curtir_594" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_594">0</span>)
							</a> <span id="tooltip_relevante_594" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_594">0</span>)
							</a> <span id="tooltip_concordo_594" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_594">0</span>)
							</a> <span id="tooltip_discordo_594" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div class="arrowchat_chatboxmessagecontent arrowchat_self dial"
				style="display: none; margin-left: 0px; border-top: 1px solid #eee"
				id="divResp_595">
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div id="historico"></div>
							<div id="msg_590">
								<span class="data" id="hora_590">11:46:29</span> <img
									class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
								<strong>Marcelo</strong> <br>
								<div id="texto">blz edmilson</div>
								<br clear="all">
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div id="historico"></div>
							<div id="msg_591">
								<span class="data" id="hora_591">11:46:38</span> <img
									class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
								<strong>Edmilson</strong> <br>
								<div id="texto">blz marcelo</div>
								<br clear="all">
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="msgEncadeadaInside">
						<div id="encadeadaInside">
							<div class="balaoInside" id="balaoEncadeaInside"></div>
							<strong>Pimentel</strong> - oi Edmilson!
						</div>
					</div>
				</div>
			</div>
			<div id="divInjetaModal_595">
				<div id="msgEncadeadaInside">
					<div id="encadeadaInside">
						<div class="balaoInside" id="balaoEncadeaInside"></div>
						<div id="historico">
							<div class="balaoHistorico" id="balaoEncadeaHistorico"></div>
						</div>
						<strong>Pimentel</strong> - oi Edmilson!
					</div>
				</div>
			</div>
			<div id="msg_595">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:47:01</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Edmilson</strong></span><br>
				<div id="texto">Oi Pimentel!</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_595">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_595">0</span>)
							</a> <span id="tooltip_curtir_595" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_595">0</span>)
							</a> <span id="tooltip_relevante_595" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_595">0</span>)
							</a> <span id="tooltip_concordo_595" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_595">0</span>)
							</a> <span id="tooltip_discordo_595" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_596">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:47:03</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">que vc falou</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_596">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_596">0</span>)
							</a> <span id="tooltip_curtir_596" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_596">0</span>)
							</a> <span id="tooltip_relevante_596" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_596">0</span>)
							</a> <span id="tooltip_concordo_596" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_596">0</span>)
							</a> <span id="tooltip_discordo_596" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_597">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:47:11</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">de ficar escuro</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_597">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_597">0</span>)
							</a> <span id="tooltip_curtir_597" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_597">0</span>)
							</a> <span id="tooltip_relevante_597" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_597">0</span>)
							</a> <span id="tooltip_concordo_597" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_597">1</span>)
							</a> <span id="tooltip_discordo_597" class="tooltiptext">Edmilson<br></span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
			<div id="msg_598">
				<span class="data"><img border="0"
					src="${pageContext.request.contextPath}/assets/img/colonthree.gif">11:47:34</span> <img
					class="avatar" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
				<span id="nomeUsuario"><strong>Marcelo</strong></span><br>
				<div id="texto">foquei em resolver os problemas de lentidao</div>
				<div id="encadeamentoLinks">
					<div id="linksAcoes_598">
						<a href="#" class="respondo">Responder</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-heart-o"></i> Curtir(<span class="curtir_598">0</span>)
							</a> <span id="tooltip_curtir_598" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-star-o"></i> Relevante(<span
								class="relevante_598">0</span>)
							</a> <span id="tooltip_relevante_598" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-up"></i> Concordo(<span
								class="concordo_598">0</span>)
							</a> <span id="tooltip_concordo_598" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
						|
						<div class="tooltipTeste">
							<a href="#">
								<i class="fa fa-thumbs-o-down"></i> Discordo(<span
								class="discordo_598">0</span>)
							</a> <span id="tooltip_discordo_598" class="tooltiptext">Ninguém
								opinou!</span>
						</div>
					</div>
				</div>
				<br clear="all">
			</div>
		</div>
	</div>
</div>

</div></div></div></div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>
