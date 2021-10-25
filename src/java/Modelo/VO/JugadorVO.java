
package Modelo.VO;

import java.sql.*;

/**
 *
 * @author deibyasierra
 */
public class JugadorVO {
    
    protected String alias;
    protected double acumulado;
    private Timestamp fecha_registro;
    private int codigo_usuario;

    
    public double getAcumulado() {
        return acumulado;
    }

    public void setAcumulado(double acumulado) {
        this.acumulado = acumulado;
    }
    
    

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }
  
    public Timestamp getFecha_registro() {
        return fecha_registro;
    }
    public void setFecha_registro(Timestamp fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    public int getCodigo_usuario() {
        return codigo_usuario;
    }
    public void setCodigo_usuario(int codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    public JugadorVO(String alias, int identificacion, Timestamp fecha_registro) {
        this.alias = alias;
        
        this.fecha_registro = fecha_registro;
    }

    public JugadorVO() {
    }

    public JugadorVO(double acumulado, Timestamp fecha_registro,String alias) {
        this.alias = alias;
        this.acumulado = acumulado;
        this.fecha_registro = fecha_registro;
    }

   
   
    
    
}
