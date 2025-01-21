<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

<div id="sidebar" class="sidebar p-3 bg-dark text-white">
    <h4 class="text-center mb-5 text-white fs-4">Administrador</h4>
    <button id="btnBack" class="btn btn-secondary mb-4 hidden fs-5">
        <i class="bi bi-arrow-left"></i> Regresar
    </button>

    <div id="mainModules" class="fs-5">
        <div class="menu-item mb-4" data-module="usuarios">
            <a class="d-flex align-items-center justify-content-between py-3 px-3 rounded" href="#">
                <div class="d-flex align-items-center text-white">
                    <i class="bi bi-files-alt me-2"></i> Registros
                </div>
                <i class="bi bi-chevron-right"></i>
            </a>
        </div>
        <div class="menu-item mb-4" data-module="ventas">
            <a class="d-flex align-items-center justify-content-between py-3 px-3 rounded text-white" href="#">
                <i class="bi bi-box-seam me-2"></i> Ventas
                <i class="bi bi-chevron-right"></i>
            </a>
        </div>
        <div class="menu-item mb-4" data-module="configuraciones">
            <a class="d-flex align-items-center justify-content-between py-3 px-3 rounded text-white" href="#">
                <i class="bi bi-gear-fill me-2"></i> Configuraciones
                <i class="bi bi-chevron-right"></i>
            </a>
        </div>
    </div>

    <div id="usuariosSubmodules" class="hidden fs-5">
        <a href="/SISTEMAOPEN/UsuariosController" class="d-flex align-items-center py-3 px-3 rounded text-white mb-2">
            <i class="bi bi-people-fill me-2"></i> Usuarios
        </a>
        <a href="/SISTEMAOPEN/ProductosController" class="d-flex align-items-center py-3 px-3 rounded text-white">
            <i class="bi bi-box-fill me-2"></i> Productos
        </a>
        <a href="/SISTEMAOPEN/CategoriaController" class="d-flex align-items-center py-3 px-3 rounded text-white">
            <i class="bi bi-tags-fill me-2"></i> Categoría
        </a>
    </div>

    <div id="ventasSubmodules" class="hidden fs-5">
        <a href="/SISTEMAOPEN/Ventas/RealizarVenta.jsp" class="d-flex align-items-center py-3 px-3 rounded text-white mb-2">
            <i class="bi bi-cart-plus-fill me-2"></i> Realizar Venta
        </a>
        <a href="/SISTEMAOPEN/Ventas/listaVentas.jsp" class="d-flex align-items-center py-3 px-3 rounded text-white">
            <i class="bi bi-list-check me-2"></i> Visualizar Ventas
        </a>
    </div>
</div>

<style>
    .sidebar {
        width: 240px;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        background-color: #343a40;
        overflow-y: auto;
        transition: transform 0.3s ease-in-out;
        z-index: 1000;
    }

    .hidden {
        display: none !important;
    }

    .content-wrapper {
        margin-left: 240px;
        padding: 20px;
        transition: margin-left 0.3s ease-in-out;
    }

    .sidebar-hidden {
        transform: translateX(-240px);
    }

    .sidebar a:hover {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .sidebar a {
        text-decoration: none;
        color: white;
        padding: 10px 20px;
        display: block;
        margin: 10px 0;
    }

    .sidebar a i {
        margin-right: 10px;
    }

    @media (max-width: 768px) {
        .sidebar {
            transform: translateX(-240px);
        }

        .sidebar-visible {
            transform: translateX(0);
        }

        .content-wrapper {
            margin-left: 0;
        }
    }
</style>

<script>
    const toggleSidebarButton = document.getElementById('toggleSidebar');
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');
    const mainModules = document.getElementById('mainModules');
    const usuariosSubmodules = document.getElementById('usuariosSubmodules');
    const ventasSubmodules = document.getElementById('ventasSubmodules');
    const backToMainButton = document.getElementById('btnBack');

    toggleSidebarButton?.addEventListener('click', () => {
        sidebar.classList.toggle('sidebar-hidden');
        content?.classList.toggle('content-expanded');
    });

    // Mostrar submódulos de Usuarios
    document.querySelector('[data-module="usuarios"]')?.addEventListener('click', () => {
        mainModules.classList.add('hidden');
        usuariosSubmodules.classList.remove('hidden');
        backToMainButton.classList.remove('hidden');
    });

    // Mostrar submódulos de Ventas
    document.querySelector('[data-module="ventas"]')?.addEventListener('click', () => {
        mainModules.classList.add('hidden');
        ventasSubmodules.classList.remove('hidden');
        backToMainButton.classList.remove('hidden');
    });

    // Regresar al menú principal
    backToMainButton?.addEventListener('click', () => {
        mainModules.classList.remove('hidden');
        usuariosSubmodules.classList.add('hidden');
        ventasSubmodules.classList.add('hidden');
        backToMainButton.classList.add('hidden');
    });
</script>
