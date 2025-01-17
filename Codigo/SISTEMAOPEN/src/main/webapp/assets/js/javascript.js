
// JS DEL LOGIN
const togglePassword = document.querySelector('.toggle-password');
const passwordInput = document.querySelector('#contrasena');

togglePassword.addEventListener('click', () => {
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);

    // Cambiar el icono
    const icon = togglePassword.querySelector('i');
    icon.classList.toggle('bi-eye');
    icon.classList.toggle('bi-eye-slash');
});

// Mostrar un mensaje de éxito
function mostrarExito() {
    Swal.fire({
        icon: 'success',
        title: 'Operación exitosa',
        text: 'Los datos han sido guardados correctamente.',
        confirmButtonColor: '#007bff'
    });
}

// Mostrar un mensaje de error
function mostrarError() {
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Ocurrió un problema, inténtalo de nuevo.',
        confirmButtonColor: '#d33'
    });
}






// JS DE PRODUCTOS
const toggleSidebarButton = document.getElementById("toggleSidebar");
const sidebar = document.getElementById("sidebar");
const contentWrapper = document.getElementById("content-wrapper");
const backToMainButton = document.getElementById("btnBack");
const mainModules = document.getElementById("mainModules");
const usuariosSubmodules = document.getElementById("usuariosSubmodules");

// Validar si los elementos existen antes de aplicar eventos
if (toggleSidebarButton && sidebar && contentWrapper) {
    toggleSidebarButton.addEventListener("click", () => {
        sidebar.classList.toggle("sidebar-hidden");
        contentWrapper.classList.toggle("content-expanded");
    });
}

// Mostrar submódulos y ocultar los módulos principales
if (mainModules && usuariosSubmodules && backToMainButton) {
    document.querySelectorAll("[data-module]").forEach((module) => {
        module.addEventListener("click", () => {
            mainModules.classList.add("hidden");
            usuariosSubmodules.classList.remove("hidden");
            backToMainButton.classList.remove("hidden");
        });
    });

    backToMainButton.addEventListener("click", () => {
        mainModules.classList.remove("hidden");
        usuariosSubmodules.classList.add("hidden");
        backToMainButton.classList.add("hidden");
    });
}







