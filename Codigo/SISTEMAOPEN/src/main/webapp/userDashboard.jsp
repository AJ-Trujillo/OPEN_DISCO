<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ventas.beans.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
if (usuario == null || !"usuario".equalsIgnoreCase(usuario.getRol())) {
	response.sendRedirect("index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Usuario - Dashboard</title>
</head>
<body>
	<h1>
		Bienvenido Usuario:
		<%=usuario.getNombreUsuario()%></h1>
</body>
</html>
