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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if ("insertar".equals(op)) {
            insertarUsuario(request, response);
        } else if ("modificar".equals(op)) {
            modificarUsuario(request, response);
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

    // Método para insertar un usuario
    private void insertarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain; charset=UTF-8");
        try {
            Usuario usuario = new Usuario();

            // Validar y asignar parámetros
            String nombre = request.getParameter("nombre_usuario");
            if (nombre == null || nombre.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'nombre_usuario' es obligatorio.");
                return;
            }
            usuario.setNombreUsuario(nombre);

            String apellidoPaterno = request.getParameter("apellido_paterno");
            if (apellidoPaterno == null || apellidoPaterno.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'apellido_paterno' es obligatorio.");
                return;
            }
            usuario.setApellidoPaterno(apellidoPaterno);

            String apellidoMaterno = request.getParameter("apellido_materno");
            if (apellidoMaterno == null || apellidoMaterno.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'apellido_materno' es obligatorio.");
                return;
            }
            usuario.setApellidoMaterno(apellidoMaterno);

            String edadParam = request.getParameter("edad");
            if (edadParam == null || edadParam.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'edad' es obligatorio.");
                return;
            }
            try {
                usuario.setEdad(Integer.parseInt(edadParam));
            } catch (NumberFormatException e) {
                response.getWriter().write("El parámetro 'edad' debe ser un número válido.");
                return;
            }

            String sexo = request.getParameter("sexo");
            if (sexo == null || (!sexo.equals("M") && !sexo.equals("F"))) {
                response.getWriter().write("El parámetro 'sexo' es obligatorio y debe ser 'M' o 'F'.");
                return;
            }
            usuario.setSexo(sexo);

            String correo = request.getParameter("correo");
            if (correo == null || correo.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'correo' es obligatorio.");
                return;
            }
            usuario.setCorreo(correo);

            String dni = request.getParameter("dni");
            if (dni == null || dni.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'dni' es obligatorio.");
                return;
            }
            usuario.setDni(dni);

            String contrasena = request.getParameter("contrasena");
            if (contrasena == null || contrasena.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'contrasena' es obligatorio.");
                return;
            }
            usuario.setContrasena(contrasena);

            String rol = request.getParameter("rol");
            if (rol == null || (!rol.equals("administrador") && !rol.equals("usuario"))) {
                response.getWriter().write("El parámetro 'rol' es obligatorio y debe ser 'administrador' o 'usuario'.");
                return;
            }
            usuario.setRol(rol);

            String estadoParam = request.getParameter("estado");
            if (estadoParam == null || estadoParam.trim().isEmpty()) {
                response.getWriter().write("El parámetro 'estado' es obligatorio.");
                return;
            }
            try {
                usuario.setEstado(Integer.parseInt(estadoParam));
            } catch (NumberFormatException e) {
                response.getWriter().write("El parámetro 'estado' debe ser un número válido.");
                return;
            }

            // Insertar usuario en la base de datos
            int filasAfectadas = usuariosModel.insertarUsuario(usuario);

            if (filasAfectadas > 0) {
                // Redirigir a la lista de usuarios
                response.sendRedirect(request.getContextPath() + "/UsuariosController?op=listar");
            } else {
                response.getWriter().write("No se pudo insertar el usuario.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error interno del servidor: " + e.getMessage());
        }
    }





    // Método para modificar un usuario
    private void modificarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
            usuario.setNombreUsuario(request.getParameter("nombre_usuario"));
            usuario.setApellidoPaterno(request.getParameter("apellido_paterno"));
            usuario.setApellidoMaterno(request.getParameter("apellido_materno"));
            usuario.setDni(request.getParameter("dni"));
            usuario.setCorreo(request.getParameter("correo"));
            usuario.setContrasena(request.getParameter("contrasena"));
            usuario.setSexo(request.getParameter("sexo"));
            usuario.setEdad(Integer.parseInt(request.getParameter("edad")));
            usuario.setRol(request.getParameter("rol"));
            usuario.setEstado(Integer.parseInt(request.getParameter("estado")));

            int filasAfectadas = usuariosModel.modificarUsuario(usuario);

            if (filasAfectadas > 0) {
                response.sendRedirect("UsuariosController");
            } else {
                response.getWriter().write("No se pudo modificar el usuario.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error interno del servidor.");
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
