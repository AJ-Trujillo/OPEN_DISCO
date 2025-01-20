<%@page import="java.util.List"%>
<%@page import="com.ventas.beans.Categoria"%>
<div class="modal fade" id="modalNuevoProducto" tabindex="-1"
	aria-labelledby="modalNuevoProductoLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalNuevoProductoLabel">Crear
					Nuevo Producto</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form
				action="<%=request.getContextPath()%>/ProductosController?op=insertar"
				method="post" id="formNuevoProducto">
				<div class="modal-body">
					<div class="mb-3">
						<label for="nombre_producto" class="form-label">Nombre</label> <input
							type="text" id="nombre_producto" name="nombre_producto"
							class="form-control" maxlength="50"
							placeholder="Ingrese el nombre del producto" required>
					</div>
					<div class="mb-3">
						<label for="descripcion_producto" class="form-label">Descripción</label>
						<textarea id="descripcion_producto" name="descripcion_producto"
							class="form-control" rows="3" maxlength="200"
							placeholder="Ingrese una descripción" required></textarea>
					</div>
					<div class="mb-3">
						<label for="precio_producto" class="form-label">Precio</label> <input
							type="number" id="precio_producto" name="precio_producto"
							class="form-control" step="0.01" min="0.01" max="99999.99"
							placeholder="Ingrese el precio" required>
					</div>
					<div class="mb-3">
						<label for="cantidad_producto" class="form-label">Cantidad</label>
						<input type="number" id="cantidad_producto"
							name="cantidad_producto" class="form-control" min="1" max="9999"
							placeholder="Ingrese la cantidad" required>
					</div>
					<div class="mb-3">
						<label for="categoria_producto" class="form-label">Categoría</label>
						<select id="categoria_producto" name="categoria_producto"
							class="form-select" required>
							<option value="">Seleccione una categoría</option>
							<%
							List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");
							if (listaCategorias != null && !listaCategorias.isEmpty()) {
								for (Categoria categoria : listaCategorias) {
							%>
							<option value="<%=categoria.getIdCategoria()%>">
								<%=categoria.getNombreCategoria()%>
							</option>
							<%
							}
							} else {
							%>
							<option value="">No hay categorías disponibles</option>
							<%
							}
							%>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Guardar
						Producto</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
    const formularioProducto = document.getElementById('formNuevoProducto');

    formularioProducto.addEventListener('submit', function (event) {
        let errores = [];

        const nombreProducto = document.getElementById('nombre_producto').value.trim();
        const descripcionProducto = document.getElementById('descripcion_producto').value.trim();
        const precioProducto = parseFloat(document.getElementById('precio_producto').value);
        const cantidadProducto = parseInt(document.getElementById('cantidad_producto').value, 10);
        const categoriaProducto = document.getElementById('categoria_producto').value;

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

        if (isNaN(cantidadProducto) || cantidadProducto < 1 || cantidadProducto > 9999) {
            errores.push('La cantidad debe ser un número válido entre 1 y 9999.');
        }

        if (categoriaProducto === '') {
            errores.push('Debe seleccionar una categoría válida.');
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
    limitInputLength(document.getElementById('nombre_producto'), 50);
    limitInputLength(document.getElementById('descripcion_producto'), 200);
</script>
