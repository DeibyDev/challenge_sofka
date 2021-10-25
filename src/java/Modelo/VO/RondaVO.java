
package Modelo.VO;


public class RondaVO extends JugadorVO{
      private int rond_descripcion ;
    private double rond_premio;
    private int rond_id;
    private PreguntasVO pregunta;

    public RondaVO() {
    }

    public PreguntasVO getPregunta() {
        return pregunta;
    }

    public void setPregunta(PreguntasVO respuesta) {
        this.pregunta = respuesta;
    }

    @Override
    public String toString() {
        return "RondaVO{" + "rond_descripcion=" + rond_descripcion + '}';
    }

    public RondaVO(int rond_descripcion) {
        this.rond_descripcion = rond_descripcion;
    }

    public int getRond_descripcion() {
        return rond_descripcion;
    }

    public void setRond_descripcion(int rond_descripcion) {
        this.rond_descripcion = rond_descripcion;
    }

    public double getRond_premio() {
        return rond_premio;
    }

    public void setRond_premio(double rond_premio) {
        this.rond_premio = rond_premio;
    }

    public int getRond_id() {
        return rond_id;
    }

    public void setRond_id(int rond_id) {
        this.rond_id = rond_id;
    }
    
}
