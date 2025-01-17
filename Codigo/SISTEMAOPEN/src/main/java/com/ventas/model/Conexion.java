package com.ventas.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    protected Connection conexion;

    // Método para abrir conexión que devuelve el objeto Connection
    public Connection abrirConexion() throws SQLException {
        if (conexion == null || conexion.isClosed()) {
            String url = "jdbc:mysql://localhost:3306/bd_open";
            String usuario = "root";
            String contrasena = "123456";
            conexion = DriverManager.getConnection(url, usuario, contrasena);
        }
        return conexion;
    }

    // Método para cerrar la conexión
    public void cerrarConexion() throws SQLException {
        if (conexion != null && !conexion.isClosed()) {
            conexion.close();
        }
    }

    // Método estático para obtener una nueva conexión directa
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/bd_open";
        String usuario = "root";
        String contrasena = "123456";
        return DriverManager.getConnection(url, usuario, contrasena);
    }
}
