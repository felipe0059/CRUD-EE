<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="br.com.datainfo.dao.TelefoneDAO"%>
<%@ page import="br.com.datainfo.model.Telefone"%>
<%@ page import="java.util.*"%>

<%--Array que retorna todos telefones cadastrados no usuario --%>
<%
TelefoneDAO telefoneDao = new TelefoneDAO();
ArrayList<Telefone> lista = (ArrayList<Telefone>) request.getAttribute("listaTelefones");
%>
<html>

<head>
<link rel="stylesheet" href="style.css">
<link rel="icon" href="imagens/phone.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Lista de Telefones</title>
</head>

  <%--Scripts para alarme --%>
	<script>
	function adicionar() {
	alert("Telefone adicionado com sucesso!");
	location.reload(true);
		}	
	function deletartelefone() {
		if (confirm("Deseja excluir o telefone ?")) {
			alert("Excluido com sucesso!")
		} else {
			return false;
		}
	   }
</script>
			
<body>
	<center style="margin-top: 50px">
		<h1 class="display-4">Lista de telefones</h1>

		<table id="tabela">
			<thead>
				<tr>
					<th>DDD</th>
					<th>Numero</th>
					<th>Tipo</th>
					<th>Ação</th>
				</tr>
			</thead>
			<tbody>
				<% for (int i = 0; i < lista.size(); i++) { %>
				<tr>
					<td><%=lista.get(i).getDdd()%></td>
					<td><%=lista.get(i).getNumero()%></td>
					<td><%=lista.get(i).getTipo()%></td>
					
					<% if (telefoneDao.listaTelefonesById(lista.get(i).getIdusuario()).size() == 1) { %>
					<td><button class="btn btn-danger" disabled>Excluir</button></td>

					<%
					} else { %>
					<td><a href="excluirTelefone?id=<%=lista.get(i).getId()%>"
						onclick="return deletartelefone()"><button class="btn btn-danger">Excluir</button></a></td>
				</tr>
				<% } %>
				
				<% } %>
			</tbody>
		</table>
		0.0.1


		<form name="frmAdicionar" action="adicionarTelefone">
			<table>
				<% for (int i = 0; i < lista.size(); i++) {	%>
				<tr>
					<td><input type="hidden"
						value="<%=lista.get(i).getIdusuario()%>" name="idusuario"></td>
				</tr>
				
				<% } %>
				<h1 class="display-4">Adicione um novo telefone</h1>
				<tr>
					<td><input type="text" name="ddd" maxlength="2"	placeholder="DDD" required name="ddd" class=CaixaDDD></td>
				</tr>
				
				<tr>
					<td><input type="text" name="numero" maxlength="9" placeholder="Numero de telefone" required name="numero" class=Caixa></td>
				</tr>
				
				<tr>
					<td><select name="tipotelefone" class="Select">
							<option value="Residencial">Residencial</option>
							<option value="Comercial">Comercial</option>
							<option value="Celular">Celular</option>
					</select></td>
				</tr>				
			</table>
		
			<input type="submit" value="Adicionar" onclick="return adicionar()" class="btn btn-success" style="margin-right: 50px"> 
			<input type="button" value="Voltar" onclick="window.location.href='telaInicio.jsp'" class="btn btn-danger">
    </body>
 </center>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
</html>