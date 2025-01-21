<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
  rel="stylesheet"
/>
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
  rel="stylesheet"
/>

<div class="container mt-5">
  <!-- Sidebar -->
<jsp:include page="../Menus/sidebar.jsp" />
  <!-- Topbar -->
  <jsp:include page="../Menus/topbar.jsp" />

  <div class="card shadow-sm p-4">
    <h2 class="text-center mb-4 text-primary">Realizar Venta</h2>
    <form>
      <!-- Contenedor DNI y Nombre -->
      <div class="row mb-4">
        <div class="col-md-4">
          <label for="dni" class="form-label">DNI del Cliente</label>
          <input
            type="text"
            id="dni"
            class="form-control"
            placeholder="Ingrese DNI"
            required
          />
        </div>
        <div class="col-md-4">
          <label class="form-label">Nombre</label>
          <input
            type="text"
            id="nombre"
            class="form-control"
            placeholder="Nombre del cliente"
            readonly
          />
        </div>
        <div class="col-md-4">
          <label class="form-label">Apellido Paterno</label>
          <input
            type="text"
            id="apellido_paterno"
            class="form-control"
            placeholder="Apellido paterno del cliente"
            readonly
          />
        </div>
      </div>

      <!-- Botón Añadir Producto -->
      <div class="d-flex justify-content-between mb-3">
        <button
          type="button"
          class="btn btn-success"
          data-bs-toggle="modal"
          data-bs-target="#modalProductos"
        >
          <i class="bi bi-plus-circle"></i> Añadir Producto
        </button>
      </div>

      <!-- Tabla Productos -->
      <div class="table-responsive mb-4">
        <table class="table table-striped table-hover align-middle text-center">
          <thead class="table-primary">
            <tr>
              <th>#</th>
              <th>Producto</th>
              <th>Cantidad</th>
              <th>Precio Unitario</th>
              <th>Subtotal</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody id="productosTabla">
            <!-- Aquí se añadirán dinámicamente los productos -->
            <tr>
              <td colspan="6">No hay productos añadidos</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Botón Confirmar Venta -->
      <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-primary">
          <i class="bi bi-check-circle"></i> Confirmar Venta
        </button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Productos -->
<div
  class="modal fade"
  id="modalProductos"
  tabindex="-1"
  aria-labelledby="modalProductosLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalProductosLabel">Añadir Producto</h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <!-- Contenido del modal de productos -->
        <div class="mb-3">
          <label for="producto" class="form-label">Producto</label>
          <select id="producto" class="form-control">
            <!-- Opciones de productos -->
            <option value="1">Producto 1</option>
            <option value="2">Producto 2</option>
            <option value="3">Producto 3</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="cantidad" class="form-label">Cantidad</label>
          <input
            type="number"
            id="cantidad"
            class="form-control"
            placeholder="Ingrese la cantidad"
            required
          />
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
          Cancelar
        </button>
        <button type="button" class="btn btn-primary" id="agregarProducto">
          <i class="bi bi-plus-circle"></i> Añadir
        </button>
      </div>
    </div>
  </div>
</div>

<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
></script>
