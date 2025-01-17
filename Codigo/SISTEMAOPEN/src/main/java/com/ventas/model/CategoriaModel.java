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

public class CategoriaModel extends Conexion {

	public List<Categoria> listarCategorias() {
	    List<Categoria> listaCategorias = new ArrayList<>();
	    String sql = "CALL sp_listar_categorias()";

	    try (Connection conexion = this.abrirConexion();
	         CallableStatement cs = conexion.prepareCall(sql);
	         ResultSet rs = cs.executeQuery()) {

	        while (rs.next()) {
	            Categoria categoria = new Categoria();
	            categoria.setIdCategoria(rs.getInt("id_categoria"));
	            categoria.setNombreCategoria(rs.getString("nombre_categoria"));
	            categoria.setDescripcion(rs.getString("descripcion"));
	            categoria.setEstado(rs.getString("estado"));
	            categoria.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
	            categoria.setFechaModificacion(rs.getTimestamp("fecha_modificacion"));

	            listaCategorias.add(categoria);
	        }

	        Logger.getLogger(CategoriaModel.class.getName()).log(Level.INFO, "Categorías obtenidas: {0}", listaCategorias.size());

	    } catch (SQLException e) {
	        Logger.getLogger(CategoriaModel.class.getName()).log(Level.SEVERE, "Error al listar categorías", e);
	    }

	    return listaCategorias;
	}


    // Método para insertar una nueva categoría
    public int insertarCategoria(Categoria categoria) {
        String sql = "CALL sp_crear_categoria(?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            // Parámetros para el procedimiento almacenado
            cs.setString(1, categoria.getNombreCategoria());
            cs.setString(2, categoria.getDescripcion());
            cs.setString(3, categoria.getEstado());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(CategoriaModel.class.getName()).log(Level.SEVERE, "Error al insertar categoría", e);
            return 0;
        }
    }

    // Método para modificar una categoría
    public int modificarCategoria(Categoria categoria) {
        String sql = "CALL sp_modificar_categoria(?, ?, ?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, categoria.getIdCategoria());
            cs.setString(2, categoria.getNombreCategoria());
            cs.setString(3, categoria.getDescripcion());
            cs.setString(4, categoria.getEstado());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(CategoriaModel.class.getName()).log(Level.SEVERE, "Error al modificar categoría", e);
            return 0;
        }
    }

    // Método para actualizar el estado de una categoría
    public int actualizarEstadoCategoria(int idCategoria, String estado) {
        String sql = "CALL sp_actualizar_estado_categoria(?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idCategoria);
            cs.setString(2, estado);

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(CategoriaModel.class.getName()).log(Level.SEVERE, "Error al actualizar estado de la categoría", e);
            return 0;
        }
    }
}
