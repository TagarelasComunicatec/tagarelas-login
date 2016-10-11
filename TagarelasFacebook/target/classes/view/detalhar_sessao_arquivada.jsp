<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ include file="/view/header.jsp" %>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div class="detalhes_sessao">

	<div class="titulo_sessao">
			<h2>Sess&atilde;o <c:out value="${sessao.sistemaBatePapo.nome}"></c:out>: "<c:out value="${sessao.titulo}"></c:out>"</h2>
			<p>Organizada por: <c:out value="${sessao.proprietario.nomeCurto}"></c:out></p>
	</div>
	
	<div class="dados_sessao">
		
		<form:form commandName="sessao">
			
			<div class="subdivisao_dados_sessao">
				<h3>Realizada em</h3>
				<p>
					Dia/hor&aacute;rio: <fmt:formatDate value='${sessao.diaHorario}' pattern='dd/MM/yyyy HH:mm'/>
				</p>
			</div>
			
			<div id="subdivisao_dados_sessao_arquivada">
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

		<div id="participantes_confirmados">
			<display:table id="participante" name="participantes" pagesize="6" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="">
				<display:column property="nomeCurto" title="Participaram"/>
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