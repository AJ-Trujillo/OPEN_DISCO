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
        try {
            if (op == null || op.isEmpty()) {
                listarVentas(request, response);
            } else {
                switch (op) {
                    case "eliminar":
                        eliminarVenta(request, response);
                        break;
                    case "obtener":
                        obtenerVenta(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Operación no válida.");
                        break;
                }
            }
        } catch (Exception e) {
            manejarError(response, "Error al procesar la solicitud", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        try {
            if ("insertar".equals(op)) {
                insertarVenta(request, response);
            } else if ("actualizar".equals(op)) {
                actualizarVenta(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Operación no válida.");
            }
        } catch (Exception e) {
            manejarError(response, "Error al procesar la solicitud", e);
        }
    }

    private void listarVentas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Venta> listaVentas = ventasModel.listarVentas();
        request.setAttribute("listaVentas", listaVentas);
        request.getRequestDispatcher("Ventas/listaVentas.jsp").forward(request, response);
    }

    private void obtenerVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idVenta = Integer.parseInt(request.getParameter("id"));
        Venta venta = ventasModel.obtenerVentaPorId(idVenta);
        if (venta != null) {
            request.setAttribute("venta", venta);
            request.getRequestDispatcher("Ventas/detalleVenta.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Venta no encontrada.");
        }
    }

    private void eliminarVenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idVenta = Integer.parseInt(request.getParameter("id"));
        int filasAfectadas = ventasModel.eliminarVenta(idVenta);

        if (filasAfectadas > 0) {
            request.getSession().setAttribute("mensaje", "Venta eliminada exitosamente.");
            request.getSession().setAttribute("tipoMensaje", "success");
        } else {
            request.getSession().setAttribute("mensaje", "No se pudo eliminar la venta.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("VentasController");
    }

    private void insertarVenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Venta venta = new Venta();
        venta.setIdCliente(Integer.parseInt(request.getParameter("id_cliente")));
        venta.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        venta.setFechaVenta(request.getParameter("fecha_venta"));
        venta.setTotal(Double.parseDouble(request.getParameter("total")));
        venta.setMetodoPago(request.getParameter("metodo_pago"));
        venta.setEstado(request.getParameter("estado"));
        venta.setObservaciones(request.getParameter("observaciones"));

        int filasAfectadas = ventasModel.insertarVenta(venta);

        if (filasAfectadas > 0) {
            request.getSession().setAttribute("mensaje", "Venta registrada exitosamente.");
            request.getSession().setAttribute("tipoMensaje", "success");
        } else {
            request.getSession().setAttribute("mensaje", "No se pudo registrar la venta.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("VentasController");
    }

    private void actualizarVenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Venta venta = new Venta();
        venta.setIdVenta(Integer.parseInt(request.getParameter("id_venta")));
        venta.setIdCliente(Integer.parseInt(request.getParameter("id_cliente")));
        venta.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        venta.setFechaVenta(request.getParameter("fecha_venta"));
        venta.setTotal(Double.parseDouble(request.getParameter("total")));
        venta.setMetodoPago(request.getParameter("metodo_pago"));
        venta.setEstado(request.getParameter("estado"));
        venta.setObservaciones(request.getParameter("observaciones"));

        int filasAfectadas = ventasModel.actualizarVenta(venta);

        if (filasAfectadas > 0) {
            request.getSession().setAttribute("mensaje", "Venta actualizada exitosamente.");
            request.getSession().setAttribute("tipoMensaje", "success");
        } else {
            request.getSession().setAttribute("mensaje", "No se pudo actualizar la venta.");
            request.getSession().setAttribute("tipoMensaje", "error");
        }
        response.sendRedirect("VentasController");
    }

    private void manejarError(HttpServletResponse response, String mensaje, Exception e) throws IOException {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, mensaje);
    }
}
