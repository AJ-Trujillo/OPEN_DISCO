package com.ventas.controllers;

import com.ventas.beans.Usuario;
import com.ventas.model.UsuariosModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsuariosController", urlPatterns = {"/UsuariosController"})
public class UsuariosController extends HttpServlet {

    private UsuariosModel usuariosModel;

    public UsuariosController() {
        this.usuariosModel = new UsuariosModel();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if (op == null || op.isEmpty()) {
            listarUsuarios(request, response);
        } else if ("estado".equals(op)) {
            actualizarEstado(request, response);
        }
    }

    // Método para listar usuarios
    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Usuario> listaUsuarios = usuariosModel.listarUsuarios();
            request.setAttribute("listaUsuarios", listaUsuarios);
            request.getRequestDispatcher("Usuarios/listaUsuarios.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar usuarios.");
        }
    }

    // Método para validar los parámetros de actualización de estado
    private String validarParametrosEstado(String idUsuarioParam, String estadoParam) {
        if (idUsuarioParam == null || idUsuarioParam.trim().isEmpty()) {
            return "El ID del usuario es obligatorio.";
        }
        if (estadoParam == null || estadoParam.trim().isEmpty()) {
            return "El estado es obligatorio.";
        }
        try {
            Integer.parseInt(idUsuarioParam);
        } catch (NumberFormatException e) {
            return "El ID del usuario debe ser un número válido.";
        }
        try {
            int estado = Integer.parseInt(estadoParam);
            if (estado != 0 && estado != 1) {
                return "El estado debe ser 0 (inactivo) o 1 (activo).";
            }
        } catch (NumberFormatException e) {
            return "El estado debe ser un número válido (0 o 1).";
        }
        return null;
    }

    // Método para actualizar el estado de un usuario
    private void actualizarEstado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String idUsuarioParam = request.getParameter("id");
        String estadoParam = request.getParameter("estado");

        // Validar parámetros
        String error = validarParametrosEstado(idUsuarioParam, estadoParam);
        if (error != null) {
            response.getWriter().write("{\"success\": false, \"message\": \"" + error + "\"}");
            return;
        }

        try {
            int idUsuario = Integer.parseInt(idUsuarioParam);
            int estado = Integer.parseInt(estadoParam);
            int filasAfectadas = usuariosModel.actualizarEstado(idUsuario, estado);

            if (filasAfectadas > 0) {
                response.getWriter().write("{\"success\": true}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"No se pudo actualizar el estado.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\": false, \"message\": \"Error interno del servidor.\"}");
        }
    }
}
