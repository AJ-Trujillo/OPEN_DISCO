<div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="modalEditarUsuarioLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarUsuarioLabel">Editar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/UsuariosController?op=modificar" method="post" id="formEditarUsuario">
                <div class="modal-body">
                    <input type="hidden" id="id_usuario" name="id_usuario">

                    <div class="mb-3">
                        <label for="nombre_usuario_editar" class="form-label">Nombre</label>
                        <input type="text" id="nombre_usuario_editar" name="nombre_usuario"
                               class="form-control" maxlength="50" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellido_paterno_editar" class="form-label">Apellido Paterno</label>
                        <input type="text" id="apellido_paterno_editar" name="apellido_paterno"
                               class="form-control" maxlength="50" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellido_materno_editar" class="form-label">Apellido Materno</label>
                        <input type="text" id="apellido_materno_editar" name="apellido_materno"
                               class="form-control" maxlength="50" required>
                    </div>

                    <div class="mb-3">
                        <label for="dni_editar" class="form-label">DNI</label>
                        <input type="text" id="dni_editar" name="dni" class="form-control"
                               maxlength="8" required>
                    </div>

                    <div class="mb-3">
                        <label for="correo_editar" class="form-label">Correo</label>
                        <input type="email" id="correo_editar" name="correo" class="form-control"
                               maxlength="100" required>
                    </div>

                    <div class="mb-3">
                        <label for="contrasena_editar" class="form-label">Contraseña</label>
                        <input type="password" id="contrasena_editar" name="contrasena"
                               class="form-control" minlength="6" maxlength="20" required>
                    </div>

                    <div class="mb-3">
                        <label for="sexo_editar" class="form-label">Sexo</label>
                        <select id="sexo_editar" name="sexo" class="form-select" required>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="edad_editar" class="form-label">Edad</label>
                        <input type="number" id="edad_editar" name="edad" class="form-control"
                               min="18" max="100" required>
                    </div>

                    <div class="mb-3">
                        <label for="rol_editar" class="form-label">Rol</label>
                        <select id="rol_editar" name="rol" class="form-select" required>
                            <option value="administrador">Administrador</option>
                            <option value="usuario">Usuario</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="estado_editar" class="form-label">Estado</label>
                        <select id="estado_editar" name="estado" class="form-select" required>
                            <option value="1">Habilitado</option>
                            <option value="0">Deshabilitado</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const formularioEditarUsuario = document.getElementById('formEditarUsuario');

    formularioEditarUsuario.addEventListener('submit', function (event) {
        let errores = [];

        const nombreUsuario = document.getElementById('nombre_usuario_editar').value.trim();
        const apellidoPaterno = document.getElementById('apellido_paterno_editar').value.trim();
        const apellidoMaterno = document.getElementById('apellido_materno_editar').value.trim();
        const dni = document.getElementById('dni_editar').value.trim();
        const correo = document.getElementById('correo_editar').value.trim();
        const contrasena = document.getElementById('contrasena_editar').value.trim();
        const edad = parseInt(document.getElementById('edad_editar').value, 10);

        if (nombreUsuario === '' || nombreUsuario.length > 50) {
            errores.push('El nombre debe tener entre 1 y 50 caracteres.');
        }

        if (apellidoPaterno === '' || apellidoPaterno.length > 50) {
            errores.push('El apellido paterno debe tener entre 1 y 50 caracteres.');
        }

        if (apellidoMaterno === '' || apellidoMaterno.length > 50) {
            errores.push('El apellido materno debe tener entre 1 y 50 caracteres.');
        }

        if (!/^\d{8}$/.test(dni)) {
            errores.push('El DNI debe tener exactamente 8 dígitos.');
        }

        if (correo === '' || correo.length > 100 || !/\S+@\S+\.\S+/.test(correo)) {
            errores.push('El correo no es válido.');
        }

        if (contrasena.length < 6 || contrasena.length > 20) {
            errores.push('La contraseña debe tener entre 6 y 20 caracteres.');
        }

        if (isNaN(edad) || edad < 18 || edad > 100) {
            errores.push('La edad debe ser un número válido entre 18 y 100.');
        }

        if (errores.length > 0) {
            event.preventDefault();
            alert('Por favor corrige los siguientes errores:\n- ' + errores.join('\n- '));
        }
    });

    // Limitar caracteres mientras se escribe
    const limitInputLength = (element, maxLength) => {
        element.addEventListener('input', () => {
            if (element.value.length > maxLength) {
                element.value = element.value.slice(0, maxLength);
            }
        });
    };

    // Aplicar límite de caracteres
    limitInputLength(document.getElementById('nombre_usuario_editar'), 50);
    limitInputLength(document.getElementById('apellido_paterno_editar'), 50);
    limitInputLength(document.getElementById('apellido_materno_editar'), 50);
    limitInputLength(document.getElementById('dni_editar'), 8);
    limitInputLength(document.getElementById('correo_editar'), 100);
    limitInputLength(document.getElementById('contrasena_editar'), 20);
</script>
