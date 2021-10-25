/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Conexion.conexion;
import Modelo.VO.CategoriaVO;
import Modelo.VO.PreguntasVO;
import Modelo.VO.RespuestasVO;
import Modelo.VO.RondaVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author deibyasierra
 */
public class RespuestasDAO {

    public RespuestasVO Respuesta(int id) throws Exception {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        RespuestasVO respuesta = new RespuestasVO();
        String sql = "SELECT resp_correcta\n"
                + "FROM sofka_preguntas preg\n"
                + "INNER JOIN sofka_respuestas resp on preg.preg_id=resp.preg_id\n"
                + "where preg.preg_id='"+id+"' ";
        con = new conexion();
        try {
            cn = con.connectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.isBeforeFirst()) {

                while (rs.next()) {
                    // se carga la lista o el objeto con los resltados de la consul
                    respuesta.setResp_correcta(rs.getString("resp_correcta"));
                   

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
        return respuesta;
    }
}
