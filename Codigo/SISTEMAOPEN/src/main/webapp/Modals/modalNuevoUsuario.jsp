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
				method="post" id="formNuevoUsuario">
				<div class="modal-body">
					<div class="mb-3">
						<label for="nombre_usuario" class="form-label">Nombre</label> <input
							type="text" id="nombre_usuario" name="nombre_usuario"
							class="form-control" maxlength="50" required>
					</div>

					<div class="mb-3">
						<label for="apellido_paterno" class="form-label">Apellido
							Paterno</label> <input type="text" id="apellido_paterno"
							name="apellido_paterno" class="form-control" maxlength="50"
							required>
					</div>

					<div class="mb-3">
						<label for="apellido_materno" class="form-label">Apellido
							Materno</label> <input type="text" id="apellido_materno"
							name="apellido_materno" class="form-control" maxlength="50"
							required>
					</div>

					<div class="mb-3">
						<label for="dni" class="form-label">DNI</label> <input type="text"
							id="dni" name="dni" class="form-control" maxlength="8" required>
					</div>

					<div class="mb-3">
						<label for="correo" class="form-label">Correo</label> <input
							type="email" id="correo" name="correo" class="form-control"
							maxlength="100" required>
					</div>

					<div class="mb-3">
						<label for="contrasena" class="form-label">Password</label> <input
							type="password" id="contrasena" name="contrasena"
							class="form-control" maxlength="20" required>
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
							type="number" id="edad" name="edad" class="form-control" min="18"
							max="99" required>
					</div>

					<div class="mb-3">
						<label for="rol" class="form-label">Rol</label> <select id="rol"
							name="rol" class="form-select" required>
							<option value="administrador">Administrador</option>
							<option value="usuario">Usuario</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="estado" class="form-label">Estado</label> <select
							id="estado" name="estado" class="form-select" required>
							<option value="1">Activo</option>
							<option value="0">Inactivo</option>
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
    const formulario = document.getElementById('formNuevoUsuario');

    // Validar entrada de números en campos específicos
    const camposNumericos = ['dni', 'edad'];
    camposNumericos.forEach(campo => {
        const input = document.getElementById(campo);
        input.addEventListener('input', (event) => {
            // Permitir solo números
            event.target.value = event.target.value.replace(/\D/g, '');

            // Limitar el largo del campo
            if (campo === 'dni' && event.target.value.length > 8) {
                event.target.value = event.target.value.slice(0, 8);
            }
            if (campo === 'edad' && event.target.value.length > 2) {
                event.target.value = event.target.value.slice(0, 2);
            }
        });
    });

    formulario.addEventListener('submit', function (event) {
        let errores = [];

        const nombre = document.getElementById('nombre_usuario').value.trim();
        const apellidoPaterno = document.getElementById('apellido_paterno').value.trim();
        const apellidoMaterno = document.getElementById('apellido_materno').value.trim();
        const dni = document.getElementById('dni').value.trim();
        const correo = document.getElementById('correo').value.trim();
        const contrasena = document.getElementById('contrasena').value;
        const edad = parseInt(document.getElementById('edad').value, 10);

        if (nombre === '') {
            errores.push('El nombre no puede estar vacío.');
        }

        if (apellidoPaterno === '' || apellidoMaterno === '') {
            errores.push('Los apellidos no pueden estar vacíos.');
        }

        const dniRegex = /^\d{8}$/;
        if (!dniRegex.test(dni)) {
            errores.push('El DNI debe tener 8 dígitos numéricos.');
        }

        const correoRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!correoRegex.test(correo)) {
            errores.push('El correo no tiene un formato válido.');
        }

        const contrasenaRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/;
        if (!contrasenaRegex.test(contrasena)) {
            errores.push('La contraseña debe tener al menos 8 caracteres, una letra mayúscula y un número.');
        }

        if (isNaN(edad) || edad < 18 || edad > 99) {
            errores.push('La edad debe ser un número entre 18 y 99.');
        }

        if (errores.length > 0) {
            event.preventDefault();
            alert('Por favor corrige los siguientes errores:\n- ' + errores.join('\n- '));
        }
    });
</script>
