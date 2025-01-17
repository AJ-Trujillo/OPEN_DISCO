<div class="modal fade" id="modalNuevoUsuario" tabindex="-1"
	aria-labelledby="modalNuevoUsuarioLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalNuevoUsuarioLabel">Crear Nuevo
					Usuario</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form
				action="<%=request.getContextPath()%>/UsuariosController?op=insertar"
				method="post">
				<div class="modal-body">
					<div class="mb-3">
						<label for="nombre_usuario" class="form-label">Nombre</label> <input
							type="text" id="nombre_usuario" name="nombre_usuario"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="apellido_paterno" class="form-label">Apellido
							Paterno</label> <input type="text" id="apellido_paterno"
							name="apellido_paterno" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="apellido_materno" class="form-label">Apellido
							Materno</label> <input type="text" id="apellido_materno"
							name="apellido_materno" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="dni" class="form-label">DNI</label> <input type="text"
							id="dni" name="dni" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="correo" class="form-label">Correo</label> <input
							type="email" id="correo" name="correo" class="form-control"
							required>
					</div>

					<div class="mb-3">
						<label for="contrasena" class="form-label">Contraseña</label> <input
							type="password" id="contrasena" name="contrasena"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="sexo" class="form-label">Sexo</label> <select
							id="sexo" name="sexo" class="form-select" required>
							<option value="M">Masculino</option>
							<option value="F">Femenino</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="edad" class="form-label">Edad</label> <input
							type="number" id="edad" name="edad" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="rol" class="form-label">Rol</label> <select id="rol"
							name="rol" class="form-select" required>
							<option value="administrador">Administrador</option>
							<option value="usuario">Usuario</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear
						Usuario</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

const btnNuevoUsuario = document.querySelector("[data-bs-target='#modalNuevoUsuario']");
const modalNuevoUsuario = document.getElementById("modalNuevoUsuario");


if (btnNuevoUsuario && modalNuevoUsuario) {
    btnNuevoUsuario.addEventListener("click", () => {
        const bootstrapModal = new bootstrap.Modal(modalNuevoUsuario);
        bootstrapModal.show();
    });
}

</script>
