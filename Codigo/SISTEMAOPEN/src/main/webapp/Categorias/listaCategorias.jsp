<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ventas.beans.Categoria"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Categorías</title>

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
			<h1 class="text-2xl font-bold mb-4">Categorías Registradas</h1>

			<button type="button" class="btn btn-primary mb-4"
				data-bs-toggle="modal" data-bs-target="#modalNuevaCategoria">
				+ Crear Nueva Categoría</button>

			<table class="table table-striped table-bordered text-center">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Descripción</th>
						<th>Fecha Creación</th>
						<th>Fecha Modificación</th>
						<th>Acciones</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");
					if (listaCategorias != null && !listaCategorias.isEmpty()) {
						for (Categoria categoria : listaCategorias) {
					%>
					<tr>
						<td><%=categoria.getIdCategoria()%></td>
						<td><%=categoria.getNombreCategoria()%></td>
						<td><%=categoria.getDescripcion()%></td>
						<td><%=categoria.getFechaCreacion()%></td>
						<td><%=categoria.getFechaModificacion()%></td>
						<td>
							<button class="btn btn-warning btn-sm"
								onclick="abrirModalEditar(
                    '<%=categoria.getIdCategoria()%>',
                    '<%=categoria.getNombreCategoria()%>',
                    '<%=categoria.getDescripcion()%>',
                    '<%=categoria.getEstado()%>'
                )">
								✏️ Editar</button>
						<td>
							<button
								onclick="cambiarEstado(<%=categoria.getIdCategoria()%>, '<%=categoria.getEstado().equals("activo") ? "inactivo" : "activo"%>')"
								class="btn <%=categoria.getEstado().equals("activo") ? "btn-success" : "btn-secondary"%>">
								<%=categoria.getEstado().equals("activo") ? "Activo" : "Inactivo"%>
							</button>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="7" class="text-center">No hay categorías
							registradas.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Modals -->
	<jsp:include page="/Modals/modalNuevoCategoria.jsp" />
	<jsp:include page="/Modals/modalEditarCategoria.jsp" />

	<!-- Menús -->
	<jsp:include page="/Menus/sidebar.jsp" />
	<jsp:include page="/Menus/topbar.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/javascript.js"></script>
</body>
</html>
