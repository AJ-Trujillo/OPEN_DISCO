<div class="modal fade" id="modalEditarCategoria" tabindex="-1"
	aria-labelledby="modalEditarCategoriaLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalEditarCategoriaLabel">Editar
					Categoría</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form
				action="<%=request.getContextPath()%>/CategoriaController?op=modificar"
				method="post">
				<div class="modal-body">
					<input type="hidden" id="id_categoria" name="id_categoria">
					<div class="mb-3">
						<label for="nombre_categoria_editar" class="form-label">Nombre</label>
						<input type="text" id="nombre_categoria_editar"
							name="nombre_categoria" class="form-control"
							placeholder="Ingrese el nombre de la categoría" required>
					</div>
					<div class="mb-3">
						<label for="descripcion_categoria_editar" class="form-label">Descripción</label>
						<textarea id="descripcion_categoria_editar" name="descripcion"
							class="form-control" rows="3"
							placeholder="Ingrese una descripción" required></textarea>
					</div>
					<div class="mb-3">
						<label for="estado_categoria_editar" class="form-label">Estado</label>
						<select id="estado_categoria_editar" name="estado"
							class="form-control" required>
							<option value="activo">Activo</option>
							<option value="inactivo">Inactivo</option>
						</select>
					</div>
				</div>
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
	function abrirModalEditar(idCategoria, nombreCategoria, descripcion, estado) {
		// Asignar valores a los campos del modal
		document.getElementById('id_categoria').value = idCategoria;
		document.getElementById('nombre_categoria_editar').value = nombreCategoria;
		document.getElementById('descripcion_categoria_editar').value = descripcion;
		document.getElementById('estado_categoria_editar').value = estado;

		// Abrir el modal
		var modalEditar = new bootstrap.Modal(document
				.getElementById('modalEditarCategoria'));
		modalEditar.show();
	}
</script>
