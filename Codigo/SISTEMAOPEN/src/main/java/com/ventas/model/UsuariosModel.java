package com.ventas.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ventas.beans.Usuario;

public class UsuariosModel extends Conexion {

    // Método para listar usuarios
    public List<Usuario> listarUsuarios() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "CALL sp_listarUsuarios()";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNombreUsuario(rs.getString("nombre_usuario"));
                usuario.setApellidoPaterno(rs.getString("apellido_paterno"));
                usuario.setApellidoMaterno(rs.getString("apellido_materno"));
                usuario.setDni(rs.getString("dni"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setSexo(rs.getString("sexo"));
                usuario.setEdad(rs.getInt("edad"));
                usuario.setRol(rs.getString("rol"));
                usuario.setFechaRegistro(rs.getTimestamp("fecha_registro").toLocalDateTime());
                usuario.setEstado(rs.getInt("estado"));

                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, "Error al listar usuarios", e);
        }
        return listaUsuarios;
    }

    // Método para verificar si un usuario ya existe por nombre de usuario
    public boolean usuarioExiste(String nombreUsuario) {
        String sql = "CALL sp_verificarUsuario(?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setString(1, nombreUsuario);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }

        } catch (SQLException e) {
            Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, "Error al verificar existencia de usuario", e);
        }
        return false;
    }

    // Método para insertar un usuario
    public int insertarUsuario(Usuario usuario) {
        String sql = "CALL sp_insertarUsuario(?,?,?,?,?,?,?,?,?,?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            // Asegurarse de que el orden de los parámetros coincida con el procedimiento almacenado
            cs.setString(1, usuario.getNombreUsuario());
            cs.setString(2, usuario.getApellidoPaterno());
            cs.setString(3, usuario.getApellidoMaterno());
            cs.setInt(4, usuario.getEdad());
            cs.setString(5, usuario.getSexo());
            cs.setString(6, usuario.getCorreo());
            cs.setString(7, usuario.getDni());
            cs.setString(8, usuario.getContrasena());
            cs.setString(9, usuario.getRol());
            cs.setInt(10, usuario.getEstado());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, "Error al insertar usuario", e);
            return 0;
        }
    }

    // Método para modificar un usuario
    public int modificarUsuario(Usuario usuario) {
        String sql = "CALL sp_modificarUsuario(?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, usuario.getIdUsuario());
            cs.setString(2, usuario.getNombreUsuario());
            cs.setString(3, usuario.getApellidoPaterno());
            cs.setString(4, usuario.getApellidoMaterno());
            cs.setInt(5, usuario.getEdad());
            cs.setString(6, usuario.getSexo());
            cs.setString(7, usuario.getCorreo());
            cs.setString(8, usuario.getDni());
            cs.setString(9, usuario.getContrasena());
            cs.setString(10, usuario.getRol());
            cs.setInt(11, usuario.getEstado());

            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, "Error al modificar usuario", e);
            return 0;
        }
    }

    // Método para autenticar un usuario
    public Usuario autenticarUsuario(String correo, String contrasena) {
        Usuario usuario = null;
        String sql = "CALL sp_autenticarUsuario(?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setString(1, correo);
            cs.setString(2, contrasena);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setIdUsuario(rs.getInt("id_usuario"));
                    usuario.setNombreUsuario(rs.getString("nombre_usuario"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setContrasena(rs.getString("contrasena"));
                    usuario.setRol(rs.getString("rol"));
                    usuario.setEstado(rs.getInt("estado"));
                    usuario.setDni(rs.getString("dni"));
                    usuario.setApellidoPaterno(rs.getString("apellido_paterno"));
                    usuario.setApellidoMaterno(rs.getString("apellido_materno"));
                    usuario.setEdad(rs.getInt("edad"));
                    usuario.setSexo(rs.getString("sexo"));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, "Error al autenticar usuario", e);
        }
        return usuario;
    }

    // Método para actualizar el estado de un usuario
    public int actualizarEstado(int idUsuario, int estado) {
        String sql = "CALL actualizar_estado_usuario(?, ?)";

        try (Connection conexion = this.abrirConexion();
             CallableStatement cs = conexion.prepareCall(sql)) {

            cs.setInt(1, idUsuario);
            cs.setInt(2, estado);
            return cs.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, "Error al actualizar estado del usuario", e);
            return 0;
        }
    }
}
