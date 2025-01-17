<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ventas.beans.Producto"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Ventas</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        /* Ajustar márgenes para el contenido */
        .content-wrapper {
            margin-left: 250px; /* Espacio para el sidebar */
            margin-top: 60px; /* Espacio para el topbar */
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }

        .table-container {
            background: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        body {
            background-color: #f8f9fa; /* Fondo claro */
        }
    </style>
</head>
<body>
    <!-- Include Sidebar -->
    <jsp:include page="/Menus/sidebar.jsp" />
    <!-- Include Topbar -->
    <jsp:include page="/Menus/topbar.jsp" />

    <!-- Main Content -->
    <div class="content-wrapper" id="content-wrapper">
        <div class="table-container">
            <h1 class="text-center mb-4">Productos Registrados</h1>

            <!-- Botón para abrir el modal de crear producto -->
            <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#modalNuevoProducto">
                + Crear Nuevo Producto
            </button>

            <!-- Tabla de productos -->
            <div class="table-responsive">
                <table id="tablaProductos" class="table table-hover align-middle text-center shadow-sm">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Codigo de Venta</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Categoría</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        List<Producto> listaProductos = (List<Producto>) request.getAttribute("listaProductos");
                        if (listaProductos != null) {
                            for (Producto producto : listaProductos) {
                        %>
                        <tr>

                                <!-- Ícono para abrir el modal de edición con tooltip -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" 
                                    onclick="abrirModalEditar()"
                                    style="cursor: pointer;" data-bs-toggle="tooltip" title="Editar Producto">
                                    <g fill="none" stroke="#ffc107" stroke-width="1.5">
                                        <path d="m18.18 8.04l.463-.464a1.966 1.966 0 1 1 2.781 2.78l-.463.464M18.18 8.04s.058.984.927 1.853s1.854.927 1.854.927M18.18 8.04l-4.26 4.26c-.29.288-.434.433-.558.592q-.22.282-.374.606c-.087.182-.151.375-.28.762l-.413 1.24l-.134.401m8.8-5.081l-4.26 4.26c-.29.29-.434.434-.593.558q-.282.22-.606.374c-.182.087-.375.151-.762.28l-1.24.413l-.401.134m0 0l-.401.134a.53.53 0 0 1-.67-.67l.133-.402m.938.938l-.938-.938"/>
                                        <path stroke-linecap="round" d="M8 13h2.5M8 9h6.5M8 17h1.5"/>
                                        <path d="M3 10c0-3.771 0-5.657 1.172-6.828S7.229 2 11 2h2c3.771 0 5.657 0 6.828 1.172S21 6.229 21 10v4c0 3.771 0 5.657-1.172 6.828S16.771 22 13 22h-2c-3.771 0-5.657 0-6.828-1.172S3 17.771 3 14z" opacity="0.5"/>
                                    </g>
                                </svg>
                            </td>
                        </tr>
                        <% 
                            }
                        } else { 
                        %>
                        <tr>
                            <td colspan="7" class="text-center">No hay productos registrados.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modales -->
    <jsp:include page="/Modals/modalNuevoProducto.jsp" />
    <jsp:include page="/Modals/modalEditarProducto.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function abrirModalEditar(idProducto, nombreProducto, descripcion, precio, cantidad, categoria) {
        document.getElementById("id_producto").value = idProducto;
        document.getElementById("nombre_producto_editar").value = nombreProducto;
        document.getElementById("descripcion_editar").value = descripcion;
        document.getElementById("precio_editar").value = precio;
        document.getElementById("cantidad_editar").value = cantidad;
        document.getElementById("categoria_editar").value = categoria;

        const modal = new bootstrap.Modal(document.getElementById("modalEditarProducto"));
        modal.show();
    }
    </script>
</body>
</html>
