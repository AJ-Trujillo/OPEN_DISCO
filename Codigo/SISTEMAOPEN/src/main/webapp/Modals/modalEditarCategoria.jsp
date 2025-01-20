<div class="modal fade" id="modalEditarCategoria" tabindex="-1"
     aria-labelledby="modalEditarCategoriaLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Encabezado del Modal -->
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarCategoriaLabel">Editar Categoría</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <!-- Formulario -->
            <form action="<%=request.getContextPath()%>/CategoriaController?op=modificar"
                  method="post" id="formEditarCategoria">
                <div class="modal-body">
                    <!-- Campo oculto para ID -->
                    <input type="hidden" id="id_categoria" name="id_categoria">

                    <!-- Campo Nombre -->
                    <div class="mb-3">
                        <label for="nombre_categoria_editar" class="form-label">Nombre</label>
                        <input type="text" id="nombre_categoria_editar" name="nombre_categoria"
                               class="form-control" maxlength="50"
                               placeholder="Ingrese el nombre de la categoría" required>
                    </div>

                    <!-- Campo Descripción -->
                    <div class="mb-3">
                        <label for="descripcion_categoria_editar" class="form-label">Descripción</label>
                        <textarea id="descripcion_categoria_editar" name="descripcion"
                                  class="form-control" rows="3" maxlength="200"
                                  placeholder="Ingrese una descripción" required></textarea>
                    </div>

                    <!-- Campo Estado -->
                    <div class="mb-3">
                        <label for="estado_categoria_editar" class="form-label">Estado</label>
                        <select id="estado_categoria_editar" name="estado" class="form-control" required>
                            <option value="activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
                    </div>
                </div>

                <!-- Footer del Modal -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const formularioEditarCategoria = document.getElementById('formEditarCategoria');

    formularioEditarCategoria.addEventListener('submit', function (event) {
        let errores = [];

        const nombreCategoria = document.getElementById('nombre_categoria_editar').value.trim();
        const descripcionCategoria = document.getElementById('descripcion_categoria_editar').value.trim();
        const estadoCategoria = document.getElementById('estado_categoria_editar').value;

        if (nombreCategoria === '') {
            errores.push('El nombre de la categoría no puede estar vacío.');
        } else if (nombreCategoria.length > 50) {
            errores.push('El nombre de la categoría no debe exceder los 50 caracteres.');
        }

        if (descripcionCategoria === '') {
            errores.push('La descripción no puede estar vacía.');
        } else if (descripcionCategoria.length > 200) {
            errores.push('La descripción no debe exceder los 200 caracteres.');
        }

        if (estadoCategoria !== 'activo' && estadoCategoria !== 'inactivo') {
            errores.push('Debe seleccionar un estado válido.');
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

    // Aplicar límites de caracteres
    limitInputLength(document.getElementById('nombre_categoria_editar'), 50);
    limitInputLength(document.getElementById('descripcion_categoria_editar'), 200);

    // Función para abrir el modal y asignar valores
    function abrirModalEditar(idCategoria, nombreCategoria, descripcion, estado) {
        document.getElementById('id_categoria').value = idCategoria;
        document.getElementById('nombre_categoria_editar').value = nombreCategoria;
        document.getElementById('descripcion_categoria_editar').value = descripcion;
        document.getElementById('estado_categoria_editar').value = estado;

        // Abrir el modal
        const modalEditar = new bootstrap.Modal(document.getElementById('modalEditarCategoria'));
        modalEditar.show();
    }
</script>
