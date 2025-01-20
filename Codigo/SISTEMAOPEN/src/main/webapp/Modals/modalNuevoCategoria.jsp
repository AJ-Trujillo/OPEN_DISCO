<div class="modal fade" id="modalNuevaCategoria" tabindex="-1"
     aria-labelledby="modalNuevaCategoriaLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalNuevaCategoriaLabel">Nueva Categoría</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/CategoriaController?op=insertar"
                  method="post" id="formNuevaCategoria">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="nombre_categoria" class="form-label">Nombre</label>
                        <input type="text" id="nombre_categoria" name="nombre_categoria"
                               class="form-control" maxlength="50"
                               placeholder="Ingrese el nombre de la categoría" required>
                    </div>
                    <div class="mb-3">
                        <label for="descripcion_categoria" class="form-label">Descripción</label>
                        <textarea id="descripcion_categoria" name="descripcion"
                                  class="form-control" rows="3" maxlength="200"
                                  placeholder="Ingrese una descripción" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="estado_categoria" class="form-label">Estado</label>
                        <select id="estado_categoria" name="estado" class="form-control" required>
                            <option value="activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Crear</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const formularioCategoria = document.getElementById('formNuevaCategoria');

    formularioCategoria.addEventListener('submit', function (event) {
        let errores = [];

        const nombreCategoria = document.getElementById('nombre_categoria').value.trim();
        const descripcionCategoria = document.getElementById('descripcion_categoria').value.trim();

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

        const estadoCategoria = document.getElementById('estado_categoria').value;
        if (estadoCategoria !== 'activo' && estadoCategoria !== 'inactivo') {
            errores.push('Debe seleccionar un estado válido para la categoría.');
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
    limitInputLength(document.getElementById('nombre_categoria'), 50);
    limitInputLength(document.getElementById('descripcion_categoria'), 200);
</script>
