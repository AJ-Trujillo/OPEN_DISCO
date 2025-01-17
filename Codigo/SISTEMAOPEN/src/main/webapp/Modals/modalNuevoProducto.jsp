<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ventas.beans.Categoria"%>
<div class="modal fade" id="modalNuevoProducto" tabindex="-1"
	aria-labelledby="modalNuevoProductoLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalNuevoProductoLabel">Crear
					Nuevo Producto</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form
				action="<%=request.getContextPath()%>/ProductosController?op=insertar"
				method="post">
				<div class="modal-body">
					<div class="mb-3">
						<label for="nombre_producto" class="form-label">Nombre</label> <input
							type="text" id="nombre_producto" name="nombre_producto"
							class="form-control" placeholder="Ingrese el nombre del producto"
							required>
					</div>
					<div class="mb-3">
						<label for="descripcion_producto" class="form-label">Descripción</label>
						<textarea id="descripcion_producto" name="descripcion_producto"
							class="form-control" rows="3"
							placeholder="Ingrese una descripción" required></textarea>
					</div>
					<div class="mb-3">
						<label for="precio_producto" class="form-label">Precio</label> <input
							type="number" id="precio_producto" name="precio_producto"
							class="form-control" step="0.01" placeholder="Ingrese el precio"
							required>
					</div>
					<div class="mb-3">
						<label for="cantidad_producto" class="form-label">Cantidad</label>
						<input type="number" id="cantidad_producto"
							name="cantidad_producto" class="form-control"
							placeholder="Ingrese la cantidad" required>
					</div>
					<div class="mb-3">
						<label for="categoria_producto" class="form-label">Categoría</label>
						<select id="categoria_producto" name="categoria_producto"
							class="form-select" required>
							<option value="">Seleccione una categoría</option>
							<%
							List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");
							if (listaCategorias != null && !listaCategorias.isEmpty()) {
								for (Categoria categoria : listaCategorias) {
							%>
							<option value="<%=categoria.getIdCategoria()%>"><%=categoria.getNombreCategoria()%></option>
							<%
							}
							} else {
							%>
							<option value="">No hay categorías disponibles</option>
							<%
							}
							%>
						</select>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Guardar
						Producto</button>
				</div>
			</form>
		</div>
	</div>
</div>
