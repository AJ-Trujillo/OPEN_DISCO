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

    private void actualizarEstado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String idUsuarioParam = request.getParameter("id");
            String estadoParam = request.getParameter("estado");

            if (idUsuarioParam == null || estadoParam == null) {
                response.getWriter().write("{\"success\": false, \"message\": \"Parámetros faltantes.\"}");
                return;
            }

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
