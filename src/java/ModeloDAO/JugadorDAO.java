/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Conexion.conexion;
import Modelo.VO.JugadorVO;
import Modelo.VO.PreguntasVO;
import Modelo.VO.RondaVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;

public class JugadorDAO {

    public boolean Guardar_Jugador(JugadorVO jugador) throws SQLException, Exception {
        boolean guardado = false;
        CallableStatement cs = null;
        conexion c = new conexion();
        Connection cn = c.connectar();
        try {
            cs = cn.prepareCall("{CALL GUADAR_JUGADOR(?,?,?)}");
            cs.setDouble(1, jugador.getAcumulado());
            cs.setTimestamp(2, jugador.getFecha_registro());
            cs.setString(3, jugador.getAlias());
            cs.executeUpdate();
            c.cerrarConexion();
        } catch (SQLException e) {
            guardado = false;
            e.getMessage();

        }
        return guardado;
    }
    public ArrayList<JugadorVO> Listar_jugadores() throws Exception {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<JugadorVO> listaJugadores = null;
        JugadorVO jugador;
        String sql = "SELECT juga_nombre,juga_fechaRegistro,juga_acumulado \n"
                + "FROM sofka_jugador\n"
                + "WHERE juga_acumulado>0\n"
                + "ORDER BY (juga_acumulado) DESC";
        con = new conexion();
        try {
            cn = con.connectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.isBeforeFirst()) {
                listaJugadores = new ArrayList();
                while (rs.next()) {
                    // se carga la lista o el objeto con los resltados de la consulta 
                    jugador = new JugadorVO();
                     jugador.setAlias(rs.getString("juga_nombre"));
                     jugador.setAcumulado(rs.getInt("juga_acumulado"));
                     jugador.setFecha_registro(rs.getTimestamp("juga_fechaRegistro"));
                    listaJugadores.add(jugador);

                }
            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (st != null && st.isClosed() == false) {
                st.close();

            }
            st = null;
            if (cn != null & cn.isClosed() == false) {
                cn.close();

            }
            cn = null;
        }
        return listaJugadores;
    }
}
