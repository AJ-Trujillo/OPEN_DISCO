<div class="modal fade" id="modalNuevaVenta" tabindex="-1" aria-labelledby="modalNuevaVentaLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalNuevaVentaLabel">Nueva Venta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/VentaController?op=insertar" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="id_cliente" class="form-label">Cliente</label>
                        <input type="text" id="id_cliente" name="id_cliente" class="form-control" placeholder="Ingrese el ID del cliente" required>
                    </div>
                    <div class="mb-3">
                        <label for="id_usuario" class="form-label">Usuario</label>
                        <input type="text" id="id_usuario" name="id_usuario" class="form-control" placeholder="Ingrese el ID del usuario" required>
                    </div>
                    <div class="mb-3">
                        <label for="fecha_venta" class="form-label">Fecha de Venta</label>
                        <input type="datetime-local" id="fecha_venta" name="fecha_venta" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="total" class="form-label">Total</label>
                        <input type="number" step="0.01" id="total" name="total" class="form-control" placeholder="Ingrese el total de la venta" required>
                    </div>
                    <div class="mb-3">
                        <label for="metodo_pago" class="form-label">Método de Pago</label>
                        <select id="metodo_pago" name="metodo_pago" class="form-control" required>
                            <option value="tarjeta">Tarjeta</option>
                            <option value="efectivo">Efectivo</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="estado" class="form-label">Estado</label>
                        <select id="estado" name="estado" class="form-control" required>
                            <option value="completada">Completada</option>
                            <option value="pendiente">Pendiente</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="observaciones" class="form-label">Observaciones</label>
                        <textarea id="observaciones" name="observaciones" class="form-control" rows="3" placeholder="Ingrese observaciones (opcional)"></textarea>
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
