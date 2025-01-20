package com.ventas.controllers;

import com.ventas.beans.Usuario;
import com.ventas.model.UsuariosModel;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.Key;
import java.util.Date;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private UsuariosModel usuariosModel;
    private final Key secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256); // Genera una clave segura automáticamente

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
                // Generar token JWT
                String token = generarToken(usuario);
                System.out.println("Token generado: " + token);

                // Guardar token y usuario en sesión
                request.getSession().setAttribute("authToken", token);
                request.getSession().setAttribute("usuarioLogueado", usuario);

                // Redirigir según el rol
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

    private String generarToken(Usuario usuario) {
        // Generar un token con la información del usuario
        return Jwts.builder()
                .setSubject(usuario.getCorreo())
                .claim("rol", usuario.getRol())
                .claim("nombreUsuario", usuario.getNombreUsuario())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 86400000)) // Expira en 1 día
                .signWith(secretKey) // Usar la clave generada
                .compact();
    }
}
