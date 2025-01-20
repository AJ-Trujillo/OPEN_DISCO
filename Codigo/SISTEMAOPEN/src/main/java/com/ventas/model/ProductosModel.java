package com.ventas.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ventas.beans.Categoria;
import com.ventas.beans.Producto;

public class ProductosModel extends Conexion {

    public List<Producto> listarProductos() {
        List<Producto> listaProductos = new ArrayList<>();
        String sql = "CALL sp_listarProductos()";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("id_producto"));
                producto.setNombreProducto(rs.getString("nombre_producto"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setCategoriaId(rs.getInt("categoria"));
                listaProductos.add(producto);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al listar productos", e);
        }

        return listaProductos;
    }

    public int insertarProducto(Producto producto) {
        String sql = "CALL sp_ingresarProducto(?, ?, ?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setString(1, producto.getNombreProducto());
            cs.setString(2, producto.getDescripcion());
            cs.setDouble(3, producto.getPrecio());
            cs.setInt(4, producto.getStock());
            cs.setInt(5, producto.getCategoriaId());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al insertar producto", e);
            return 0;
        }
    }

    public int actualizarProducto(Producto producto) {
        String sql = "CALL sp_actualizarProducto(?, ?, ?, ?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, producto.getIdProducto());
            cs.setString(2, producto.getNombreProducto());
            cs.setString(3, producto.getDescripcion());
            cs.setDouble(4, producto.getPrecio());
            cs.setInt(5, producto.getStock());
            cs.setInt(6, producto.getCategoriaId());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al actualizar producto", e);
            return 0;
        }
    }

    public int eliminarProducto(int idProducto) {
        String sql = "CALL sp_eliminarProducto(?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idProducto);
            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al eliminar producto", e);
            return 0;
        }
    }

    public Producto buscarProductoPorIdONombre(int idProducto, String nombreProducto) {
        Producto producto = null;
        String sql = "CALL sp_buscarProducto(?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idProducto);
            cs.setString(2, nombreProducto);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    producto = new Producto();
                    producto.setIdProducto(rs.getInt("id_producto"));
                    producto.setNombreProducto(rs.getString("nombre_producto"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getDouble("precio"));
                    producto.setStock(rs.getInt("stock"));
                    producto.setCategoriaId(rs.getInt("categoria"));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al buscar producto", e);
        }
        return producto;
    }

    public Producto obtenerProductoPorId(int idProducto) {
        Producto producto = null;
        String sql = "CALL sp_obtenerProductoPorId(?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idProducto);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    producto = new Producto();
                    producto.setIdProducto(rs.getInt("id_producto"));
                    producto.setNombreProducto(rs.getString("nombre_producto"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getDouble("precio"));
                    producto.setStock(rs.getInt("stock"));
                    producto.setCategoriaId(rs.getInt("categoria"));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al obtener producto por ID", e);
        }

        return producto;
    }

    public List<Categoria> obtenerCategorias() {
        List<Categoria> listaCategorias = new ArrayList<>();
        String sql = "CALL sp_obtenerNombresCategorias()";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("id_categoria"));
                categoria.setNombreCategoria(rs.getString("nombre_categoria"));
                listaCategorias.add(categoria);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductosModel.class.getName()).log(Level.SEVERE, "Error al obtener categorías", e);
        }

        return listaCategorias;
    }
}
