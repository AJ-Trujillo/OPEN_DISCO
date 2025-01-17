<div class="modal fade" id="modalEditarProducto" tabindex="-1"
	aria-labelledby="modalEditarProductoLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Encabezado del Modal -->
			<div class="modal-header">
				<h5 class="modal-title" id="modalEditarProductoLabel">Editar
					Producto</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<!-- Formulario -->
			<form
				action="<%=request.getContextPath()%>/ProductosController?op=modificar"
				method="post">
				<div class="modal-body row">
					<!-- Campo oculto para ID -->
					<input type="hidden" id="id_producto" name="id_producto">

					<!-- Columna izquierda -->
					<div class="col-md-6">
						<div class="mb-3">
							<label for="nombre_producto_editar" class="form-label">Nombre
								del Producto</label> <input type="text" id="nombre_producto_editar"
								name="nombre_producto" class="form-control"
								placeholder="Ingrese el nombre del producto" required>
						</div>

						<div class="mb-3">
							<label for="descripcion_editar" class="form-label">Descripción</label>
							<textarea id="descripcion_editar" name="descripcion"
								class="form-control" rows="3"
								placeholder="Ingrese la descripción del producto" required></textarea>
						</div>

						<div class="mb-3">
							<label for="precio_editar" class="form-label">Precio</label> <input
								type="number" step="0.01" id="precio_editar" name="precio"
								class="form-control" placeholder="Ingrese el precio" required>
						</div>
					</div>

					<!-- Columna derecha -->
					<div class="col-md-6">
						<div class="mb-3">
							<label for="stock_editar" class="form-label">Cantidad</label> <input
								type="number" id="stock_editar" name="stock"
								class="form-control"
								placeholder="Ingrese la cantidad disponible" required>
						</div>

						<div class="mb-3">
							<label for="categoria_editar" class="form-label">Categoría</label>
							<input type="text" id="categoria_editar" name="categoria"
								class="form-control" placeholder="Ingrese la categoría" required>
						</div>
					</div>
				</div>

				<!-- Footer del Modal -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Guardar
						Cambios</button>
				</div>
			</form>
		</div>
	</div>
</div>




<script>
	function abrirModalEditarProducto(idProducto, nombreProducto, descripcion,
			precio, stock, categoria) {
		// Asignar valores a los campos del modal
		document.getElementById('id_producto').value = idProducto;
		document.getElementById('nombre_producto_editar').value = nombreProducto;
		document.getElementById('descripcion_editar').value = descripcion;
		document.getElementById('precio_editar').value = precio;
		document.getElementById('stock_editar').value = stock;
		document.getElementById('categoria_editar').value = categoria;

		// Mostrar el modal
		var modalEditarProducto = new bootstrap.Modal(document
				.getElementById('modalEditarProducto'));
		modalEditarProducto.show();
	}
</script>

