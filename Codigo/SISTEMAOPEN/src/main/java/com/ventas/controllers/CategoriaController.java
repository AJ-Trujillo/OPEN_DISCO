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


    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categoria> listaCategorias = categoriaModel.listarCategorias();
        request.setAttribute("listaCategorias", listaCategorias); 
        request.getRequestDispatcher("Categorias/listaCategorias.jsp").forward(request, response);
    }


    private void actualizarEstado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String idCategoriaParam = request.getParameter("id");
            String estadoParam = request.getParameter("estado");

            if (idCategoriaParam == null || estadoParam == null) {
                response.getWriter().write("{\"success\": false, \"message\": \"Parámetros faltantes.\"}");
                return;
            }

            int idCategoria = Integer.parseInt(idCategoriaParam);
            String estado = estadoParam;
            int filasAfectadas = categoriaModel.actualizarEstadoCategoria(idCategoria, estado);

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if ("insertar".equals(op)) {
            insertarCategoria(request, response);
        } else if ("modificar".equals(op)) {
            modificarCategoria(request, response);
        }
    }

    private void insertarCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

    private void modificarCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
}
