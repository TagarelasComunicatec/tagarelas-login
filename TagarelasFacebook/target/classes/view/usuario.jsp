<%@ include file="/view/header.jsp" %>

<div class="global">

<%@ include file="/view/header_parte_2.jsp" %>

<h1>Dados dos usu&aacute;rios</h1>
<form:form action="usuario.do" method="POST" commandName="usuario">
	<table>
		<tr>
			<td>Nome completo</td>
			<td><form:input path="nomeCompleto" /></td>
		</tr>
		<tr>
			<td>Nome curto</td>
			<td><form:input path="nomeCurto" /></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><form:input path="email" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" name="action" value="Adicionar" />
				<input type="submit" name="action" value="Editar" />
				<input type="submit" name="action" value="Deletar" />
				<input type="submit" name="action" value="Buscar" />
			</td>
		</tr>
		</table>
</form:form>
<br>
<table border="1">
	<tr>
		<th>ID</th>
		<th>Nome completo</th>
		<th>Nome curto</th>
		<th>E-mail</th>
		<c:forEach items="${usuarioList}" var="usuario">
			<tr>
				<td>${usuario.id}</td>
				<td>${usuario.nomeCompleto}</td>
				<td>${usuario.nomeCurto}</td>
				<td>${usuario.email}</td>
			</tr>
		</c:forEach>
	</tr>
</table>
<!-- http://stackoverflow.com/questions/24403672/how-to-invoke-a-controller-using-a-html-link-in-spring-mvc -->
</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>