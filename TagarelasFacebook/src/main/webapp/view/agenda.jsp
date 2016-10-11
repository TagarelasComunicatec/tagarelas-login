<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ include file="/view/header.jsp" %>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<div id="visualizacao_agenda">

	<h2>Sess&otilde;es de bate-papo agendadas</h2>
	<p class="nova_sessao">
		<a class="link_perfil" href="${pageContext.request.contextPath}/cadastro_sessao">Criar nova sess&atilde;o</a>
	</p>
	
	<c:choose>
		<c:when test="${not empty sessoesBatePapo}">
				<div align="center">
					<display:table id="sessaoBatePapo" name="sessoesBatePapo" pagesize="10" cellpadding="5px;" cellspacing="5px;" style="align: center;" requestURI="">
						
						<display:column property="diaHorario" format="{0, date, dd/MM/yyy HH:mm}" title="Dia/Horário"/>
						<display:column property="titulo" title="Título"/>
						<display:column property="proprietario.nomeCurto" title="Organizada por"/>
						<display:column property="sistemaBatePapo.nome" title="Sistema"/>

						<spring:url var="detalhesSessao" value="detalhes-sessao" htmlEscape="true">
							<spring:param name="id" value="${sessaoBatePapo.id}" />
						</spring:url>
						<display:column class="coluna_detalhes_sessao" title="">
							<a href="${detalhesSessao}">Ver mais</a>
						</display:column>

						<spring:url var="participarSessao" value="participar-sessao" htmlEscape="true">
							<spring:param name="id" value="${sessaoBatePapo.id}" />
						</spring:url>
						<display:column title="">
							<a href="${participarSessao}">Participar</a>
						</display:column>
						
					</display:table>
				</div>
		</c:when>
		<c:otherwise><p>Nenhuma sess&atilde;o de bate-papo agendada.</p></c:otherwise>
	</c:choose>


</div>

</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>