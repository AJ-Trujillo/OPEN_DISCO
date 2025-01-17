package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    protected Connection conexion;

    public Connection abrirConexion() throws SQLException {
        if (conexion == null || conexion.isClosed()) {
            try {
                String url = "jdbc:mysql://localhost:3306/bd_open";
                String usuario = "root";
                String contrasena = "123456";
                conexion = DriverManager.getConnection(url, usuario, contrasena);
            } catch (SQLException e) {
                e.printStackTrace();
                throw e; // Propaga la excepción para que sea manejada en el nivel superior
            }
        }
        return conexion;
    }

    public void cerrarConexion() throws SQLException {
        if (conexion != null && !conexion.isClosed()) {
            conexion.close();
        }
    }
}
