
package Modelo.VO;


public class RespuestasVO {
     private String resp_descripcion;
     private String opc2;
     private String opc3;
     private String opc4;
    private String resp_correcta;
    private int resp_id;

    public RespuestasVO() {
    }

    public String getOpc2() {
        return opc2;
    }

    public void setOpc2(String opc2) {
        this.opc2 = opc2;
    }

    public String getOpc3() {
        return opc3;
    }

    public void setOpc3(String opc3) {
        this.opc3 = opc3;
    }

    public String getOpc4() {
        return opc4;
    }

    public void setOpc4(String opc4) {
        this.opc4 = opc4;
    }

    public String getResp_descripcion() {
        return resp_descripcion;
    }

    public void setResp_descripcion(String resp_descripcion) {
        this.resp_descripcion = resp_descripcion;
    }

    public String getResp_correcta() {
        return resp_correcta;
    }

    public void setResp_correcta(String resp_correcta) {
        this.resp_correcta = resp_correcta;
    }

    public int getResp_id() {
        return resp_id;
    }

    public void setResp_id(int resp_id) {
        this.resp_id = resp_id;
    }
    
    
}
