<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ include file="/view/header.jsp" %>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div id="div_centralizada">
<div class="tabs-container">

<c:choose>
	<c:when test="${abaSelecionada == null || abaSelecionada == 1}">
		<input type="radio" name="tabs" class="tabs" id="tab1" checked>
	</c:when>
	<c:otherwise>
		<input type="radio" name="tabs" class="tabs" id="tab1">
	</c:otherwise>
</c:choose>

<label for="tab1">Meu perfil</label>
<div id="perfil">
 	<div id="imagem_perfil">
 		
 		<c:choose>
	 		<c:when test="${sessionScope.usuarioLogado.foto != null}">
	 			<img id="foto_perfil" src="data:image/jpg;base64,<c:out value='${sessionScope.usuarioLogado.fotoString}'/>" width="200" height="200">
	 		</c:when>
	 		<c:when test="${sessionScope.usuarioLogado.facebookId != null}">
	 			<img id="foto_perfil" src="//graph.facebook.com/${sessionScope.usuarioLogado.facebookId}/picture?type=large">
	 		</c:when>
	 		<c:otherwise>
	 			<img id="foto_perfil" src="${pageContext.request.contextPath}/assets/img/foto_nao_enviada.png">
	 		</c:otherwise>
 		</c:choose>
 		
 		<p class="mensagem">${mensagem}</p>
 		
 		<form id="alterar_foto" method="POST" action="alterar_foto" enctype="multipart/form-data" onsubmit="return checkForm()">
 			<input id="foto_selecionada" type="file" name="foto" accept=".jpg, .jpeg, .png, image/jpeg, image/pjpeg, image/png" onchange="fileSelectHandler()">
 			
 			<c:choose>
		 		<c:when test="${sessionScope.usuarioLogado.foto != null && sessionScope.usuarioLogado.facebookId != null}">
		 			<div id="opcoes_alterar_foto">
			 			<input class="botao_alterar_foto" type="button" value="Carregar nova foto" onclick="document.getElementById('foto_selecionada').click();">
			 			<br><br>
			 			<input class="botao_alterar_foto" type="button" value="Usar foto do Facebook" onclick="location.href='${pageContext.request.contextPath}/usar_foto_facebook';">
		 			</div>
		 		</c:when>
		 		<c:otherwise>
		 			<input class="botao_alterar_foto" type="button" value="Carregar nova foto" onclick="document.getElementById('foto_selecionada').click();">
		 		</c:otherwise>
 			</c:choose>
 			
 			<div id="cortar_imagem">
 			
	 			<input type="hidden" id="x" name="x" />
		        <input type="hidden" id="y" name="y" />
		        <input type="hidden" id="w" name="w" />
		        <input type="hidden" id="h" name="h" />
		        <input type="hidden" id="scale" name="scale" />
		        <input type="hidden" id="angle" name="angle" />
		        
	 			<h2>Selecione o corte da imagem</h2>
	 			<p>Arraste a imagem e clique nos bot&otilde;es para ajust&aacute;-la.</p>
	 			<div class="erro"></div>
	 			<div id="preview_container">
	            	<img id="preview" />
	            	
	            	<div id="controles">
				    	<button id="girar_para_esquerda" type="button" title="Girar à esquerda"><img alt="Seta virada para o lado esquerdo" src="${pageContext.request.contextPath}/assets/img/esquerda.png"></button>
				      	<button id="diminuir_zoom" type="button" title="Menos zoom"><img alt="Lupa com sinal de menos" src="${pageContext.request.contextPath}/assets/img/menos_zoom.png"></button>
				     	<button id="aumentar_zoom" type="button" title="Mais zoom"><img alt="Lupa com sinal de mais" src="${pageContext.request.contextPath}/assets/img/mais_zoom.png"></button>
				      	<button id="girar_para_direita" type="button" title="Girar à direita"><img alt="Seta virada para o lado direito" src="${pageContext.request.contextPath}/assets/img/direita.png"></button>
			    	</div>
	            
	            	<input type="submit" id="botao_enviar_foto" value="Enviar" />
	            	<input type="button" id="botao_cancelar" value="Cancelar" onclick="javascript:cancelar()">
	            </div>
	            
 			</div>
 			
 		</form>
 	</div>
 	<div id="dados_perfil">
 		<h2>Dados pessoais</h2>
 		<ul id="lista_perfil">
 			<li>Nome completo: ${sessionScope.usuarioLogado.nomeCompleto}</li>
 			<li>Nome curto: ${sessionScope.usuarioLogado.nomeCurto}</li>
 			<li>E-mail: ${sessionScope.usuarioLogado.email}</li>
 		</ul>
 		<ul id="lista_links_perfil">
	 		<li><a class="link_perfil" href="${pageContext.request.contextPath}/alteracao_cadastro">Alterar dados</a></li>
	 		<li><a class="link_perfil" href="${pageContext.request.contextPath}/alteracao_senha">Alterar senha</a></li>
	 		<li><a class="link_perfil" href="${pageContext.request.contextPath}/logout">Sair do sistema</a></li>
 		</ul>
 	</div>
</div>


<c:choose>
	<c:when test="${abaSelecionada == 2}">
		<input type="radio" name="tabs" class="tabs" id="tab2" checked>
	</c:when>
	<c:otherwise>
		<input type="radio" name="tabs" class="tabs" id="tab2" onclick="location.href='${pageContext.request.contextPath}/sessoes_agendadas';">
	</c:otherwise>
</c:choose>

<label for="tab2">Minhas sess&otilde;es agendadas</label>
<div>

<h2>Minhas sess&otilde;es agendadas</h2>

<p class="nova_sessao">
	<a class="link_perfil" href="${pageContext.request.contextPath}/cadastro_sessao">Criar nova sess&atilde;o</a>
</p>
	
<div align="center">
	<display:table class="tabelaSessoesBatePapoUsuario" id="sessaoAgendada" name="sessoesBatePapoAgendadas" pagesize="10" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="/sessoes_agendadas">
						
		<display:column property="diaHorario" format="{0, date, dd/MM/yyy HH:mm}" title="Dia/Horário"/>
		<display:column property="titulo" title="Título"/>
		<display:column property="sistemaBatePapo.nome" title="Sistema"/>
		
		<spring:url var="detalhesSessao" value="detalhes-sessao" htmlEscape="true">
			<spring:param name="id" value="${sessaoAgendada.id}" />
		</spring:url>
		<display:column title="">
			<a href="${detalhesSessao}">Ver mais</a>
		</display:column>
						
	</display:table>
</div>

</div>


<c:choose>
	<c:when test="${abaSelecionada == 3}">
		<input type="radio" name="tabs" class="tabs" id="tab3" checked>
	</c:when>
	<c:otherwise>
		<input type="radio" name="tabs" class="tabs" id="tab3" onclick="location.href='${pageContext.request.contextPath}/sessoes_arquivadas';">
	</c:otherwise>
</c:choose>

<label for="tab3">Minhas sess&otilde;es arquivadas</label>
<div>

<h2>Minhas sess&otilde;es arquivadas</h2>
	
<div align="center">
	<display:table class="tabelaSessoesBatePapoUsuario" id="sessaoArquivada" name="sessoesBatePapoArquivadas" pagesize="10" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="/sessoes_arquivadas">
						
		<display:column property="diaHorario" format="{0, date, dd/MM/yyy HH:mm}" title="Dia/Horário"/>
		<display:column property="titulo" title="Título"/>
		<display:column property="sistemaBatePapo.nome" title="Sistema"/>
		
		<spring:url var="detalhesSessao" value="detalhes-sessao" htmlEscape="true">
			<spring:param name="id" value="${sessaoArquivada.id}" />
		</spring:url>
		<display:column title="">
			<a href="${detalhesSessao}">Ver mais</a>
		</display:column>
		
	</display:table>
</div>

</div>

<c:choose>
	<c:when test="${abaSelecionada == 4}">
		<input type="radio" name="tabs" class="tabs" id="tab4" checked>
	</c:when>
	<c:otherwise>
		<input type="radio" name="tabs" class="tabs" id="tab4" onclick="location.href='${pageContext.request.contextPath}/sessoes_que_participei';">
	</c:otherwise>
</c:choose>


<label for="tab4">Sess&otilde;es que j&aacute; participei</label>
<div>
<h2>Sess&otilde;es que j&aacute; participei</h2>
	
<div align="center">
	<display:table class="tabelaSessoesBatePapoUsuario" id="sessaoQueParticipou" name="sessoesBatePapoQueParticipou" pagesize="10" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="/sessoes_que_participei">
						
		<display:column property="diaHorario" format="{0, date, dd/MM/yyy HH:mm}" title="Dia/Horário"/>
		<display:column property="titulo" title="Título"/>
		<display:column property="sistemaBatePapo.nome" title="Sistema"/>
		
		<spring:url var="detalhesSessao" value="detalhes-sessao" htmlEscape="true">
			<spring:param name="id" value="${sessaoQueParticipou.id}" />
		</spring:url>
		<display:column title="">
			<a href="${detalhesSessao}">Ver mais</a>
		</display:column>
		
	</display:table>
</div>

</div>

<c:choose>
	<c:when test="${abaSelecionada == 5}">
		<input type="radio" name="tabs" class="tabs" id="tab5" checked>
	</c:when>
	<c:otherwise>
		<input type="radio" name="tabs" class="tabs" id="tab5" onclick="location.href='${pageContext.request.contextPath}/sessoes_que_participarei';">
	</c:otherwise>
</c:choose>


<label for="tab5">Sess&otilde;es que vou participar</label>
<div>
<h2>Sess&otilde;es que vou participar</h2>

 <div align="center">
	<display:table class="tabelaSessoesBatePapoUsuario" id="sessaoQueParticipara" name="sessoesBatePapoQueParticipara" pagesize="10" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="/sessoes_que_participarei">
						
		<display:column property="diaHorario" format="{0, date, dd/MM/yyy HH:mm}" title="Dia/Horário"/>
		<display:column property="titulo" title="Título"/>
		<display:column property="sistemaBatePapo.nome" title="Sistema"/>
		
		<spring:url var="detalhesSessao" value="detalhes-sessao" htmlEscape="true">
			<spring:param name="id" value="${sessaoQueParticipara.id}" />
		</spring:url>
		<display:column title="">
			<a href="${detalhesSessao}">Ver mais</a>
		</display:column>

	</display:table>
</div>

</div>

</div>

</div>
</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>
