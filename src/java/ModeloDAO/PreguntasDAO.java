package ModeloDAO;

import Conexion.conexion;
import Modelo.VO.CategoriaVO;
import Modelo.VO.PreguntasVO;
import Modelo.VO.RespuestasVO;
import Modelo.VO.RondaVO;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class PreguntasDAO {

  
  public PreguntasVO Preguntas(int ronda) throws Exception {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
      
        PreguntasVO pregunta = new PreguntasVO();
        String sql = "SELECT  preg.preg_id,cate.cate_descripcion,preg.preg_descripcion,preg.preg_dificultad,rond.rond_premio,rond.rond_descripcion,\n"
                    + "resp.resp_descripcion,resp.resp_opc2,resp.resp_opc3,resp.resp_opc4,resp.resp_correcta\n"
                    + "FROM sofka_categoria cate\n"
                    + "INNER JOIN sofka_preguntas preg on preg.cate_id = cate.cate_id\n"
                    + "INNER JOIN sofka_ronda rond on rond.preg_id=preg.preg_id\n"
                    + "INNER JOIN sofka_respuestas resp  on resp.preg_id=preg.preg_id\n"
                    + "WHERE rond.rond_descripcion ='"+ronda+"'  \n"
                    + "GROUP BY RAND() LIMIT 1";
        con = new conexion();
        try {
            cn = con.connectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.isBeforeFirst()) {
           
                while (rs.next()) {
                    // se carga la lista o el objeto con los resltados de la consulta 
                    pregunta= new PreguntasVO();
                pregunta.setPreg_dificultad(rs.getString("preg_dificultad"));
                pregunta.setPreg_descripcion(rs.getString("preg_descripcion"));
                pregunta.setPreg_id(rs.getInt("preg_id"));
                pregunta.setCategoria(new CategoriaVO());
                pregunta.getCategoria().setCate_descripcion(rs.getString("cate_descripcion"));
                pregunta.setRonda(new RondaVO());
                pregunta.getRonda().setRond_premio(rs.getDouble("rond_premio"));
                pregunta.getRonda().setRond_descripcion(rs.getInt("rond_descripcion"));
                pregunta.setRespuestas(new RespuestasVO());
                pregunta.getRespuestas().setOpc2(rs.getString("resp_opc2"));
                pregunta.getRespuestas().setResp_descripcion(rs.getString("resp_descripcion"));
                pregunta.getRespuestas().setOpc3(rs.getString("resp_opc3"));
                pregunta.getRespuestas().setOpc4(rs.getString("resp_opc4"));
                pregunta.getRespuestas().setResp_correcta(rs.getString("resp_correcta"));
                  
                

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
        return pregunta;
    }
}
