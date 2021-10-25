
package Conexion;

public class comprobar {

    public static void main(String[] args) {

        conexion con = new conexion();
        if (con.connectar() != null) {
            System.out.println("Conectado");

        } else {
            System.out.println("no hay conexion");
        }
    }

}
