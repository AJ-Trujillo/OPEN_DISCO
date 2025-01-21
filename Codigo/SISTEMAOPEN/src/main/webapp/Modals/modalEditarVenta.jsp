<div class="modal fade" id="modalEditarVenta" tabindex="-1" aria-labelledby="modalEditarVentaLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarVentaLabel">Editar Venta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/VentaController?op=modificar" method="post">
                <div class="modal-body">
                    <input type="hidden" id="id_venta" name="id_venta">
                    <div class="mb-3">
                        <label for="id_cliente_editar" class="form-label">Cliente</label>
                        <input type="text" id="id_cliente_editar" name="id_cliente" class="form-control" placeholder="Ingrese el ID del cliente" required>
                    </div>
                    <div class="mb-3">
                        <label for="id_usuario_editar" class="form-label">Usuario</label>
                        <input type="text" id="id_usuario_editar" name="id_usuario" class="form-control" placeholder="Ingrese el ID del usuario" required>
                    </div>
                    <div class="mb-3">
                        <label for="fecha_venta_editar" class="form-label">Fecha de Venta</label>
                        <input type="datetime-local" id="fecha_venta_editar" name="fecha_venta" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="total_editar" class="form-label">Total</label>
                        <input type="number" step="0.01" id="total_editar" name="total" class="form-control" placeholder="Ingrese el total de la venta" required>
                    </div>
                    <div class="mb-3">
                        <label for="metodo_pago_editar" class="form-label">Método de Pago</label>
                        <select id="metodo_pago_editar" name="metodo_pago" class="form-control" required>
                            <option value="tarjeta">Tarjeta</option>
                            <option value="efectivo">Efectivo</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="estado_editar" class="form-label">Estado</label>
                        <select id="estado_editar" name="estado" class="form-control" required>
                            <option value="completada">Completada</option>
                            <option value="pendiente">Pendiente</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="observaciones_editar" class="form-label">Observaciones</label>
                        <textarea id="observaciones_editar" name="observaciones" class="form-control" rows="3" placeholder="Ingrese observaciones (opcional)"></textarea>
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
    function abrirModalEditarVenta(idVenta, idCliente, idUsuario, fechaVenta, total, metodoPago, estado, observaciones) {
        // Asignar valores a los campos del modal
        document.getElementById('id_venta').value = idVenta;
        document.getElementById('id_cliente_editar').value = idCliente;
        document.getElementById('id_usuario_editar').value = idUsuario;
        document.getElementById('fecha_venta_editar').value = fechaVenta;
        document.getElementById('total_editar').value = total;
        document.getElementById('metodo_pago_editar').value = metodoPago;
        document.getElementById('estado_editar').value = estado;
        document.getElementById('observaciones_editar').value = observaciones;

        // Abrir el modal
        var modalEditarVenta = new bootstrap.Modal(document.getElementById('modalEditarVenta'));
        modalEditarVenta.show();
    }
</script>
