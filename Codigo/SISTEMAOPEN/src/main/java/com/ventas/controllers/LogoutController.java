package com.ventas.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LogoutController", urlPatterns = {"/LogoutController"})
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Invalida la sesión del usuario si existe
            if (request.getSession(false) != null) {
                request.getSession().invalidate();
            }

            // Redirige al login utilizando el contexto de la aplicación
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (Exception e) {
            // Manejo de errores, opcionalmente puedes redirigir a una página de error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cerrar sesión");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reutilizamos el método GET para manejar solicitudes POST
        doGet(request, response);
    }
}