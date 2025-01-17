<div class="modal fade" id="modalNuevaCategoria" tabindex="-1"
	aria-labelledby="modalNuevaCategoriaLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalNuevaCategoriaLabel">Nueva
					Categoría</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form
				action="<%=request.getContextPath()%>/CategoriaController?op=insertar"
				method="post">
				<div class="modal-body">
					<div class="mb-3">
						<label for="nombre_categoria" class="form-label">Nombre</label> <input
							type="text" id="nombre_categoria" name="nombre_categoria"
							class="form-control"
							placeholder="Ingrese el nombre de la categoría" required>
					</div>
					<div class="mb-3">
						<label for="descripcion_categoria" class="form-label">Descripción</label>
						<textarea id="descripcion_categoria" name="descripcion"
							class="form-control" rows="3"
							placeholder="Ingrese una descripción" required></textarea>
					</div>
					<div class="mb-3">
						<label for="estado_categoria" class="form-label">Estado</label> <select
							id="estado_categoria" name="estado" class="form-control" required>
							<option value="activo">Activo</option>
							<option value="inactivo">Inactivo</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
				</div>
			</form>
		</div>
	</div>
</div>
