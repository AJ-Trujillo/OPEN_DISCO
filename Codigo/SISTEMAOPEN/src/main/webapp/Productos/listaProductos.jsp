<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ventas.beans.Producto"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Productos</title>

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
			<h1 class="text-center mb-4">Productos Registrados</h1>


			<button type="button" class="btn btn-primary mb-4"
				data-bs-toggle="modal" data-bs-target="#modalNuevoProducto">
				+ Crear Nuevo Producto</button>


			<div class="table-responsive">
				<table id="tablaProductos"
					class="table table-striped align-middle text-center">
					<thead class="table-dark">
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Descripción</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>Categoría</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Producto> listaProductos = (List<Producto>) request.getAttribute("listaProductos");
						if (listaProductos != null && !listaProductos.isEmpty()) {
							for (Producto producto : listaProductos) {
						%>
						<tr>
							<td><%=producto.getIdProducto()%></td>
							<td><%=producto.getNombreProducto()%></td>
							<td><%=producto.getDescripcion()%></td>
							<td><%=producto.getPrecio()%></td>
							<td><%=producto.getStock()%></td>
							<td><%=producto.getCategoriaId()%></td>
							<td>
								<button class="btn btn-warning btn-sm"
									onclick="abrirModalEditarProducto(
                    '<%=producto.getIdProducto()%>',
                    '<%=producto.getNombreProducto()%>',
                    '<%=producto.getDescripcion()%>',
                    '<%=producto.getPrecio()%>',
                    '<%=producto.getStock()%>',
     
                )">
									✏️ Editar</button>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="7" class="text-center">No hay productos
								registrados.</td>
						</tr>
						<%
						}
						%>
					</tbody>

				</table>
			</div>
		</div>
	</div>

	<jsp:include page="/Modals/modalNuevoProducto.jsp" />
	<jsp:include page="/Modals/modalEditarProducto.jsp" />
	<jsp:include page="/Menus/sidebar.jsp" />
	<jsp:include page="/Menus/topbar.jsp" />


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/javascript.js"></script>
</body>
</html>
