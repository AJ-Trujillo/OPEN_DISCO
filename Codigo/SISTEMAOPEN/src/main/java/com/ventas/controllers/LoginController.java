package com.ventas.controllers;

import com.ventas.beans.Usuario;
import com.ventas.model.UsuariosModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private UsuariosModel usuariosModel;

    public LoginController() {
        this.usuariosModel = new UsuariosModel();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        // Log para depuración
        System.out.println("Intentando iniciar sesión con:");
        System.out.println("Correo: " + correo);
        System.out.println("Contraseña: " + contrasena);

        // Validar credenciales
        Usuario usuario = usuariosModel.autenticarUsuario(correo, contrasena);

        if (usuario != null) {
            System.out.println("Usuario encontrado: " + usuario.getNombreUsuario());

            if (usuario.getEstado() == 0) {
                // Usuario deshabilitado
                request.getSession().setAttribute("mensaje", "El usuario está deshabilitado. Contacte al administrador.");
                request.getSession().setAttribute("tipoMensaje", "warning");
                response.sendRedirect("index.jsp");
            } else {
                // Usuario habilitado: Guardar en sesión y redirigir según el rol
                request.getSession().setAttribute("usuarioLogueado", usuario);

                if ("administrador".equalsIgnoreCase(usuario.getRol())) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if ("usuario".equalsIgnoreCase(usuario.getRol())) {
                    response.sendRedirect("userDashboard.jsp");
                } else {
                    // Rol no válido
                    request.getSession().setAttribute("mensaje", "Rol no válido. Contacte al administrador.");
                    request.getSession().setAttribute("tipoMensaje", "error");
                    response.sendRedirect("index.jsp");
                }
            }
        } else {
            // Credenciales inválidas
            System.out.println("Credenciales incorrectas.");
            request.getSession().setAttribute("mensaje", "Correo o contraseña incorrectos.");
            request.getSession().setAttribute("tipoMensaje", "error");
            response.sendRedirect("index.jsp");
        }
    }
}
