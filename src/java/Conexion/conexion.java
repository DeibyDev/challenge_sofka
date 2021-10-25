package Conexion;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {

    private final String baseDatos = "challenge-sofka";
    private final String url = "jdbc:mysql://localhost/" + baseDatos;
    private final String usuario = "root";
    private final String clave = "";
    Connection cn = null;

    public Connection connectar() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = (Connection) DriverManager.getConnection(url, usuario, clave);
        } catch (Exception e) {
            System.out.println("Error al Conectar " + e.getMessage());

        }
        return cn;

    }

    public void cerrarConexion() {
        try {
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
