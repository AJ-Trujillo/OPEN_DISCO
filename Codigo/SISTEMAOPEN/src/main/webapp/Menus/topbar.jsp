<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.ventas.beans.Usuario" %>
<%
 
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }


    String iniciales = usuario.getNombreUsuario().substring(0, 1).toUpperCase();
    String apellidoInicial = usuario.getApellidoPaterno() != null && !usuario.getApellidoPaterno().isEmpty()
        ? usuario.getApellidoPaterno().substring(0, 1).toUpperCase()
        : "";
    iniciales += apellidoInicial;
%>
<nav class="navbar topbar px-3 d-flex justify-content-between align-items-center">
    <div></div> <!-- Espaciador para alinear a la derecha -->

    <div class="dropdown ms-auto"> <!-- Añadido 'ms-auto' para alinear a la derecha -->
        <button class="btn btn-dark dropdown-toggle d-flex align-items-center" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="btn btn-light rounded-circle me-2 d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                <strong><%= iniciales %></strong>
            </span>
        </button>
        <ul class="dropdown-menu dropdown-menu-end bg-dark text-white" aria-labelledby="dropdownMenuButton">
            <li class="text-center p-2">
                <span class="d-block fw-bold"><%= usuario.getNombreUsuario() %></span>
                <small><%= usuario.getRol().toUpperCase() %></small>
            </li>
            <li><hr class="dropdown-divider bg-secondary"></li>
            <li>
                <a href="<%= request.getContextPath() %>/LogoutController" class="dropdown-item text-white d-flex align-items-center">
                    <i class="bi bi-box-arrow-right me-2"></i> Cerrar Sesión
                </a>
            </li>
        </ul>
    </div>
</nav>

<style>
    .topbar {
        background-color: #202124;
        color: white;
        height: 60px;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .btn-dark {
        background-color: #343a40;
        border: none;
        color: white;
    }

    .btn-dark:hover {
        background-color: #495057;
    }

    .dropdown-menu {
        border: none;
        border-radius: 8px;
    }

    .dropdown-menu .dropdown-divider {
        border-color: rgba(255, 255, 255, 0.2);
    }

    .btn-light {
        font-weight: bold;
        color: #202124;
    }

    .btn-light:hover {
        color: #202124;
    }
</style>
