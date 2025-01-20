package com.ventas.controllers;

import com.ventas.beans.Categoria;
import com.ventas.model.CategoriaModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/CategoriaController")
public class CategoriaController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoriaModel categoriaModel;

    public CategoriaController() {
        this.categoriaModel = new CategoriaModel();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if (op == null || op.isEmpty() || "listar".equals(op)) {
            listarCategorias(request, response);
        }
    }

    // Método para listar categorías
    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categoria> listaCategorias = categoriaModel.listarCategorias();
        request.setAttribute("listaCategorias", listaCategorias);
        request.getRequestDispatcher("Categorias/listaCategorias.jsp").forward(request, response);
    }

    // Método para validar los campos de categoría
    private String validarCategoria(HttpServletRequest request) {
        String nombreCategoria = request.getParameter("nombre_categoria");
        String descripcion = request.getParameter("descripcion");
        String estado = request.getParameter("estado");

        if (nombreCategoria == null || nombreCategoria.trim().isEmpty()) {
            return "El nombre de la categoría es obligatorio.";
        }
        if (descripcion == null || descripcion.trim().isEmpty()) {
            return "La descripción de la categoría es obligatoria.";
        }
        if (estado == null || (!estado.equals("activo") && !estado.equals("inactivo"))) {
            return "El estado de la categoría debe ser 'activo' o 'inactivo'.";
        }
        return null;
    }

    // Método para insertar una nueva categoría
    private void insertarCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String error = validarCategoria(request);
        if (error != null) {
            request.getSession().setAttribute("mensaje", error);
            request.getSession().setAttribute("tipoMensaje", "error");
            response.sendRedirect("CategoriaController?op=insertar");
            return;
        }

        Categoria categoria = new Categoria();
        categoria.setNombreCategoria(request.getParameter("nombre_categoria"));
        categoria.setDescripcion(request.getParameter("descripcion"));
        categoria.setEstado(request.getParameter("estado"));

        try {
            int filasAfectadas = categoriaModel.insertarCategoria(categoria);
            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Categoría creada exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo crear la categoría.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("CategoriaController");
    }

    // Método para modificar una categoría
    private void modificarCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String error = validarCategoria(request);
        if (error != null) {
            request.getSession().setAttribute("mensaje", error);
            request.getSession().setAttribute("tipoMensaje", "error");
            response.sendRedirect("CategoriaController?op=modificar&id_categoria=" + request.getParameter("id_categoria"));
            return;
        }

        Categoria categoria = new Categoria();
        try {
            categoria.setIdCategoria(Integer.parseInt(request.getParameter("id_categoria")));
            categoria.setNombreCategoria(request.getParameter("nombre_categoria"));
            categoria.setDescripcion(request.getParameter("descripcion"));
            categoria.setEstado(request.getParameter("estado"));

            int filasAfectadas = categoriaModel.modificarCategoria(categoria);
            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Categoría modificada exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo modificar la categoría.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("CategoriaController");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if ("insertar".equals(op)) {
            insertarCategoria(request, response);
        } else if ("modificar".equals(op)) {
            modificarCategoria(request, response);
        }
    }
}
