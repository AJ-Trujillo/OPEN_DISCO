<div class="modal fade" id="modalEditarProducto" tabindex="-1"
     aria-labelledby="modalEditarProductoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Encabezado del Modal -->
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarProductoLabel">Editar Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Formulario -->
            <form action="<%=request.getContextPath()%>/ProductosController?op=modificar"
                  method="post" id="formEditarProducto">
                <div class="modal-body row">
                    <!-- Campo oculto para ID -->
                    <input type="hidden" id="id_producto" name="id_producto">

                    <!-- Columna izquierda -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="nombre_producto_editar" class="form-label">Nombre del Producto</label>
                            <input type="text" id="nombre_producto_editar" name="nombre_producto"
                                   class="form-control" maxlength="50"
                                   placeholder="Ingrese el nombre del producto" required>
                        </div>

                        <div class="mb-3">
                            <label for="descripcion_editar" class="form-label">Descripción</label>
                            <textarea id="descripcion_editar" name="descripcion"
                                      class="form-control" rows="3" maxlength="200"
                                      placeholder="Ingrese la descripción del producto" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="precio_editar" class="form-label">Precio</label>
                            <input type="number" step="0.01" id="precio_editar" name="precio"
                                   class="form-control" min="0.01" max="99999.99"
                                   placeholder="Ingrese el precio" required>
                        </div>
                    </div>

                    <!-- Columna derecha -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="stock_editar" class="form-label">Cantidad</label>
                            <input type="number" id="stock_editar" name="stock"
                                   class="form-control" min="1" max="9999"
                                   placeholder="Ingrese la cantidad disponible" required>
                        </div>

                        <div class="mb-3">
                            <label for="categoria_editar" class="form-label">Categoría</label>
                            <input type="text" id="categoria_editar" name="categoria"
                                   class="form-control" maxlength="50"
                                   placeholder="Ingrese la categoría" required>
                        </div>
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
    const formularioEditarProducto = document.getElementById('formEditarProducto');

    formularioEditarProducto.addEventListener('submit', function (event) {
        let errores = [];

        const nombreProducto = document.getElementById('nombre_producto_editar').value.trim();
        const descripcionProducto = document.getElementById('descripcion_editar').value.trim();
        const precioProducto = parseFloat(document.getElementById('precio_editar').value);
        const stockProducto = parseInt(document.getElementById('stock_editar').value, 10);
        const categoriaProducto = document.getElementById('categoria_editar').value.trim();

        if (nombreProducto === '') {
            errores.push('El nombre del producto no puede estar vacío.');
        } else if (nombreProducto.length > 50) {
            errores.push('El nombre del producto no debe exceder los 50 caracteres.');
        }

        if (descripcionProducto === '') {
            errores.push('La descripción no puede estar vacía.');
        } else if (descripcionProducto.length > 200) {
            errores.push('La descripción no debe exceder los 200 caracteres.');
        }

        if (isNaN(precioProducto) || precioProducto <= 0 || precioProducto > 99999.99) {
            errores.push('El precio debe ser un número válido entre 0.01 y 99999.99.');
        }

        if (isNaN(stockProducto) || stockProducto < 1 || stockProducto > 9999) {
            errores.push('La cantidad debe ser un número válido entre 1 y 9999.');
        }

        if (categoriaProducto === '') {
            errores.push('La categoría no puede estar vacía.');
        } else if (categoriaProducto.length > 50) {
            errores.push('La categoría no debe exceder los 50 caracteres.');
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
    limitInputLength(document.getElementById('nombre_producto_editar'), 50);
    limitInputLength(document.getElementById('descripcion_editar'), 200);
    limitInputLength(document.getElementById('categoria_editar'), 50);
</script>
