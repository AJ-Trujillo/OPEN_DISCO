package com.ventas.controllers;

import com.ventas.beans.Producto;
import com.ventas.beans.Categoria;
import com.ventas.model.ProductosModel;
import com.ventas.model.CategoriaModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductosController", urlPatterns = {"/ProductosController"})
public class ProductosController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductosModel productosModel;
    private CategoriaModel categoriaModel;

    public ProductosController() {
        this.productosModel = new ProductosModel();
        this.categoriaModel = new CategoriaModel(); // Instancia del modelo de categorías
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if (op == null || op.isEmpty()) {
            listarProductos(request, response);
        } else if ("eliminar".equals(op)) {
            eliminarProducto(request, response);
        } else if ("obtener".equals(op)) {
            obtenerProducto(request, response);
        } else if ("crear".equals(op)) {
            cargarFormularioCrear(request, response);
        }
    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Producto> listaProductos = productosModel.listarProductos(); // Carga los productos desde el modelo
            request.setAttribute("listaProductos", listaProductos); // Pasa la lista al JSP
            request.getRequestDispatcher("Productos/listaProductos.jsp").forward(request, response); // Reenvía al JSP
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar productos.");
        }
    }

    private void cargarFormularioCrear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Llama al modelo para obtener las categorías
            List<Categoria> listaCategorias = categoriaModel.listarCategorias();

            // Pasa la lista de categorías al JSP
            request.setAttribute("listaCategorias", listaCategorias);
            
            System.out.println("Categorías cargadas: " + listaCategorias.size());
            for (Categoria categoria : listaCategorias) {
                System.out.println("ID: " + categoria.getIdCategoria() + ", Nombre: " + categoria.getNombreCategoria());
            }


            // Redirige al JSP que contiene el modal
            request.getRequestDispatcher("Modals/modalNuevoProducto.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar las categorías para el formulario.");
        }
    }



    private void obtenerProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int idProducto = Integer.parseInt(request.getParameter("id"));
            Producto producto = productosModel.obtenerProductoPorId(idProducto);

            // Obtener la lista de categorías
            List<Categoria> listaCategorias = categoriaModel.listarCategorias();

            // Enviar datos al JSP
            request.setAttribute("producto", producto);
            request.setAttribute("listaCategorias", listaCategorias);

            request.getRequestDispatcher("Productos/editarProducto.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener producto.");
        }
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idProducto = Integer.parseInt(request.getParameter("id"));
            int filasAfectadas = productosModel.eliminarProducto(idProducto);

            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Producto eliminado exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo eliminar el producto.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("ProductosController");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if ("insertar".equals(op)) {
            insertarProducto(request, response);
        } else if ("modificar".equals(op)) {
            modificarProducto(request, response);
        }
    }

    private void insertarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Producto producto = new Producto();
        producto.setNombreProducto(request.getParameter("nombre_producto"));
        producto.setDescripcion(request.getParameter("descripcion_producto"));
        producto.setPrecio(Double.parseDouble(request.getParameter("precio_producto")));
        producto.setStock(Integer.parseInt(request.getParameter("cantidad_producto")));
        producto.setCategoriaId(Integer.parseInt(request.getParameter("categoria_producto")));

        try {
            int filasAfectadas = productosModel.insertarProducto(producto);
            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Producto insertado exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo insertar el producto.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("ProductosController");
    }

    private void modificarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Producto producto = new Producto();
        try {
            producto.setIdProducto(Integer.parseInt(request.getParameter("id")));
            producto.setNombreProducto(request.getParameter("nombre_producto"));
            producto.setDescripcion(request.getParameter("descripcion_producto"));
            producto.setPrecio(Double.parseDouble(request.getParameter("precio_producto")));
            producto.setStock(Integer.parseInt(request.getParameter("cantidad_producto")));
            producto.setCategoriaId(Integer.parseInt(request.getParameter("categoria_producto")));

            int filasAfectadas = productosModel.actualizarProducto(producto);
            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Producto modificado exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo modificar el producto.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("ProductosController");
    }
    
    
}
