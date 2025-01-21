package com.ventas.controllers;

import com.ventas.beans.Venta;
import com.ventas.model.VentasModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "VentasController", urlPatterns = {"/VentasController"})
public class VentasController extends HttpServlet {

    private VentasModel ventasModel;

    public VentasController() {
        this.ventasModel = new VentasModel();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if (op == null || op.isEmpty()) {
            listarVentas(request, response);
        } else if ("eliminar".equals(op)) {
            eliminarVenta(request, response);
        } else if ("obtener".equals(op)) {
            obtenerVenta(request, response);
        }
    }

    private void listarVentas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Venta> listaVentas = ventasModel.listarVentas();
            request.setAttribute("listaVentas", listaVentas);
            request.getRequestDispatcher("Ventas/listaVentas.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar ventas.");
        }
    }

    private void obtenerVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int idVenta = Integer.parseInt(request.getParameter("id"));
            Venta venta = ventasModel.obtenerVentaPorId(idVenta);
            request.setAttribute("venta", venta);
            request.getRequestDispatcher("Ventas/detalleVenta.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener venta.");
        }
    }

    private void eliminarVenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idVenta = Integer.parseInt(request.getParameter("id"));
            int filasAfectadas = ventasModel.eliminarVenta(idVenta);

            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Venta eliminada exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo eliminar la venta.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("VentasController");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if ("insertar".equals(op)) {
            insertarVenta(request, response);
        }
    }

    private void insertarVenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Venta venta = new Venta();
        venta.setIdCliente(Integer.parseInt(request.getParameter("id_cliente")));
        venta.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        venta.setFechaVenta(request.getParameter("fecha_venta"));
        venta.setTotal(Double.parseDouble(request.getParameter("total")));
        venta.setMetodoPago(request.getParameter("metodo_pago"));
        venta.setObservaciones(request.getParameter("observaciones"));

        try {
            int filasAfectadas = ventasModel.insertarVenta(venta);
            if (filasAfectadas > 0) {
                request.getSession().setAttribute("mensaje", "Venta registrada exitosamente.");
                request.getSession().setAttribute("tipoMensaje", "success");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo registrar la venta.");
                request.getSession().setAttribute("tipoMensaje", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error interno del servidor.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("VentasController");
    }
}
