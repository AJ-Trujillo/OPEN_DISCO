package com.ventas.model;

import com.ventas.beans.Venta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class VentasModel extends Conexion {

    // Método para listar todas las ventas
    public List<Venta> listarVentas() {
        List<Venta> listaVentas = new ArrayList<>();
        String sql = "CALL sp_listarVentas()";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setIdCliente(rs.getInt("id_cliente"));
                venta.setIdUsuario(rs.getInt("id_usuario"));
                venta.setFechaVenta(rs.getString("fecha_venta"));
                venta.setTotal(rs.getDouble("total"));
                venta.setMetodoPago(rs.getString("metodo_pago"));
                venta.setEstado(rs.getString("estado"));
                venta.setObservaciones(rs.getString("observaciones"));
                listaVentas.add(venta);
            }
        } catch (SQLException e) {
            Logger.getLogger(VentasModel.class.getName()).log(Level.SEVERE, "Error al listar ventas", e);
        }

        return listaVentas;
    }

    // Método para insertar una nueva venta
    public int insertarVenta(Venta venta) {
        String sql = "CALL sp_ingresarVenta(?, ?, ?, ?, ?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, venta.getIdCliente());
            cs.setInt(2, venta.getIdUsuario());
            cs.setString(3, venta.getFechaVenta());
            cs.setDouble(4, venta.getTotal());
            cs.setString(5, venta.getMetodoPago());
            cs.setString(6, venta.getEstado());
            cs.setString(7, venta.getObservaciones());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(VentasModel.class.getName()).log(Level.SEVERE, "Error al insertar venta", e);
            return 0;
        }
    }

    // Método para actualizar una venta existente
    public int actualizarVenta(Venta venta) {
        String sql = "CALL sp_actualizarVenta(?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, venta.getIdVenta());
            cs.setInt(2, venta.getIdCliente());
            cs.setInt(3, venta.getIdUsuario());
            cs.setString(4, venta.getFechaVenta());
            cs.setDouble(5, venta.getTotal());
            cs.setString(6, venta.getMetodoPago());
            cs.setString(7, venta.getEstado());
            cs.setString(8, venta.getObservaciones());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(VentasModel.class.getName()).log(Level.SEVERE, "Error al actualizar venta", e);
            return 0;
        }
    }

    // Método para obtener una venta por su ID
    public Venta obtenerVentaPorId(int idVenta) {
        Venta venta = null;
        String sql = "CALL sp_obtenerVentaPorId(?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idVenta);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    venta = new Venta();
                    venta.setIdVenta(rs.getInt("id_venta"));
                    venta.setIdCliente(rs.getInt("id_cliente"));
                    venta.setIdUsuario(rs.getInt("id_usuario"));
                    venta.setFechaVenta(rs.getString("fecha_venta"));
                    venta.setTotal(rs.getDouble("total"));
                    venta.setMetodoPago(rs.getString("metodo_pago"));
                    venta.setEstado(rs.getString("estado"));
                    venta.setObservaciones(rs.getString("observaciones"));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(VentasModel.class.getName()).log(Level.SEVERE, "Error al obtener venta por ID", e);
        }

        return venta;
    }

    // Método para eliminar una venta por su ID
    public int eliminarVenta(int idVenta) {
        String sql = "CALL sp_eliminarVenta(?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idVenta);
            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(VentasModel.class.getName()).log(Level.SEVERE, "Error al eliminar venta", e);
            return 0;
        }
    }

    // Método para buscar ventas por ID o rango de fechas
    public List<Venta> buscarVentas(int idVenta, String fechaInicio, String fechaFin) {
        List<Venta> listaVentas = new ArrayList<>();
        String sql = "CALL sp_buscarVenta(?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idVenta);
            cs.setString(2, fechaInicio);
            cs.setString(3, fechaFin);

            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Venta venta = new Venta();
                    venta.setIdVenta(rs.getInt("id_venta"));
                    venta.setIdCliente(rs.getInt("id_cliente"));
                    venta.setIdUsuario(rs.getInt("id_usuario"));
                    venta.setFechaVenta(rs.getString("fecha_venta"));
                    venta.setTotal(rs.getDouble("total"));
                    venta.setMetodoPago(rs.getString("metodo_pago"));
                    venta.setEstado(rs.getString("estado"));
                    venta.setObservaciones(rs.getString("observaciones"));
                    listaVentas.add(venta);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(VentasModel.class.getName()).log(Level.SEVERE, "Error al buscar ventas", e);
        }

        return listaVentas;
    }
}
