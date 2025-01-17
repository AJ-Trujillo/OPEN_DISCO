<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ventas.beans.Usuario"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
%>


<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Usuarios</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
</head>
<body>

	<div class="content-wrapper" id="content-wrapper">
		<div class="table-container">
			<h1 class="text-2xl font-bold mb-4">Usuarios Registrados</h1>


			<button type="button" class="btn btn-primary mb-4"
				data-bs-toggle="modal" data-bs-target="#modalNuevoUsuario">
				+ Crear Nuevo Usuario</button>

			<table class="table table-striped table-bordered text-center">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Apellido Paterno</th>
						<th>Apellido Materno</th>
						<th>DNI</th>
						<th>Correo</th>
						<th>Contraseña</th>
						<th>Sexo</th>
						<th>Edad</th>
						<th>Rol</th>
						<th>Fecha Registro</th>
						<th>Acciones</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("listaUsuarios");
					if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
						for (Usuario usuario : listaUsuarios) {
					%>
					<tr>
						<td><%=usuario.getIdUsuario()%></td>
						<td><%=usuario.getNombreUsuario()%></td>
						<td><%=usuario.getApellidoPaterno()%></td>
						<td><%=usuario.getApellidoMaterno()%></td>
						<td><%=usuario.getDni()%></td>
						<td><%=usuario.getCorreo()%></td>
						<td><%=usuario.getContrasena()%></td>
						<td><%=usuario.getSexo()%></td>
						<td><%=usuario.getEdad()%></td>
						<td><%=usuario.getRol()%></td>
						<td><%=usuario.getFechaRegistro() != null ? usuario.getFechaRegistro().format(formatter) : "Sin fecha"%></td>

						<td>
							<button
								onclick="abrirModalEditar(
                                <%=usuario.getIdUsuario()%>, 
                                '<%=usuario.getNombreUsuario()%>', 
                                '<%=usuario.getApellidoPaterno()%>', 
                                '<%=usuario.getApellidoMaterno()%>', 
                                '<%=usuario.getDni()%>', 
                                '<%=usuario.getCorreo()%>', 
                                '<%=usuario.getContrasena()%>', 
                                '<%=usuario.getSexo()%>', 
                                <%=usuario.getEdad()%>, 
                                '<%=usuario.getRol()%>', 
                                <%=usuario.getEstado()%>)"
								class="btn btn-warning btn-sm">✏️ Editar</button>
						</td>
						<td>
							<button
								onclick="cambiarEstado(<%=usuario.getIdUsuario()%>, <%=usuario.getEstado() == 1 ? 0 : 1%>)"
								class="btn <%=usuario.getEstado() == 1 ? "btn-success" : "btn-secondary"%>">
								<%=usuario.getEstado() == 1 ? "Habilitado" : "Deshabilitado"%>
							</button>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="13" class="text-center">No hay usuarios
							registrados.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>


	<jsp:include page="/Modals/modalNuevoUsuario.jsp" />
	<jsp:include page="/Modals/modalEditarUsuario.jsp" />
	<jsp:include page="/Menus/sidebar.jsp" />
	<jsp:include page="/Menus/topbar.jsp" />


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/js/javascript.js"></script>
</body>
</html>
