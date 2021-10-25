/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Conexion.conexion;
import Modelo.VO.PreguntasVO;
import Modelo.VO.RespuestasVO;
import Modelo.VO.RondaVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author deibyasierra
 */
public class RondaDAO {

    public ArrayList<RondaVO> Listar_premios() throws Exception {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<RondaVO> listaPremios = null;
        RondaVO ronda;
        String sql = "SELECT DISTINCT rond.rond_descripcion, rond.rond_premio ,preg.preg_dificultad\n"
                + "FROM sofka_ronda rond\n"
                + "INNER JOIN sofka_preguntas preg on rond.preg_id=preg.preg_id\n"
                + "ORDER by (rond.rond_premio)";
        con = new conexion();
        try {
            cn = con.connectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.isBeforeFirst()) {
                listaPremios = new ArrayList();
                while (rs.next()) {
                    // se carga la lista o el objeto con los resltados de la consulta 
                    ronda = new RondaVO();
                    ronda.setRond_descripcion(rs.getInt("rond_descripcion"));
                    ronda.setRond_premio(rs.getDouble("rond_premio"));
                    ronda.setPregunta(new PreguntasVO());
                    ronda.getPregunta().setPreg_dificultad(rs.getString("preg_dificultad"));

                    listaPremios.add(ronda);

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
        return listaPremios;
    }
}
