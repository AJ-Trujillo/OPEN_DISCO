<div class="modal fade" id="modalEditarUsuario" tabindex="-1"
	aria-labelledby="modalEditarUsuarioLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalEditarUsuarioLabel">Editar
					Usuario</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form
				action="<%=request.getContextPath()%>/UsuariosController?op=modificar"
				method="post">
				<div class="modal-body">
					<input type="hidden" id="id_usuario" name="id_usuario">

					<div class="mb-3">
						<label for="nombre_usuario_editar" class="form-label">Nombre</label>
						<input type="text" id="nombre_usuario_editar"
							name="nombre_usuario" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="apellido_paterno_editar" class="form-label">Apellido
							Paterno</label> <input type="text" id="apellido_paterno_editar"
							name="apellido_paterno" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="apellido_materno_editar" class="form-label">Apellido
							Materno</label> <input type="text" id="apellido_materno_editar"
							name="apellido_materno" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="dni_editar" class="form-label">DNI</label> <input
							type="text" id="dni_editar" name="dni" class="form-control"
							required>
					</div>

					<div class="mb-3">
						<label for="correo_editar" class="form-label">Correo</label> <input
							type="email" id="correo_editar" name="correo"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="contrasena_editar" class="form-label">Contraseña</label>
						<input type="password" id="contrasena_editar" name="contrasena"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="sexo_editar" class="form-label">Sexo</label> <select
							id="sexo_editar" name="sexo" class="form-select" required>
							<option value="M">Masculino</option>
							<option value="F">Femenino</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="edad_editar" class="form-label">Edad</label> <input
							type="number" id="edad_editar" name="edad" class="form-control"
							required>
					</div>

					<div class="mb-3">
						<label for="rol_editar" class="form-label">Rol</label> <select
							id="rol_editar" name="rol" class="form-select" required>
							<option value="administrador">Administrador</option>
							<option value="usuario">Usuario</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="estado_editar" class="form-label">Estado</label> <select
							id="estado_editar" name="estado" class="form-select" required>
							<option value="1">Habilitado</option>
							<option value="0">Deshabilitado</option>
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
	function abrirModalEditar(idUsuario, nombreUsuario, apellidoPaterno,
			apellidoMaterno, dni, correo, contrasena, sexo, edad, rol, estado) {
		const modal = new bootstrap.Modal(document
				.getElementById("modalEditarUsuario"));

		document.getElementById("id_usuario").value = idUsuario || "";
		document.getElementById("nombre_usuario_editar").value = nombreUsuario
				|| "";
		document.getElementById("apellido_paterno_editar").value = apellidoPaterno
				|| "";
		document.getElementById("apellido_materno_editar").value = apellidoMaterno
				|| "";
		document.getElementById("dni_editar").value = dni || "";
		document.getElementById("correo_editar").value = correo || "";
		document.getElementById("contrasena_editar").value = contrasena || "";
		document.getElementById("sexo_editar").value = sexo || "";
		document.getElementById("edad_editar").value = edad || "";
		document.getElementById("rol_editar").value = rol || "";
		document.getElementById("estado_editar").value = estado || "";

		modal.show();
	}
</script>