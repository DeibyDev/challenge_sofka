
package Modelo.VO;


public class PreguntasVO {
    
    private String preg_descripcion;
    private String preg_dificultad;
    private int preg_id ;
    private CategoriaVO categoria;
    private JugadorVO jugador;
    private RespuestasVO respuestas;
    private RondaVO ronda;
    private Ronda_JugadorVO rondajugador;

    public PreguntasVO() {
   
    }

    public CategoriaVO getCategoria() {
        return categoria;
    }

    public void setCategoria(CategoriaVO categoria) {
        this.categoria = categoria;
    }

    public JugadorVO getJugador() {
        return jugador;
    }

    public void setJugador(JugadorVO jugador) {
        this.jugador = jugador;
    }

    public RespuestasVO getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(RespuestasVO respuestas) {
        this.respuestas = respuestas;
    }

    public RondaVO getRonda() {
        return ronda;
    }

    public void setRonda(RondaVO ronda) {
        this.ronda = ronda;
    }

    public Ronda_JugadorVO getRondajugador() {
        return rondajugador;
    }

    public void setRondajugador(Ronda_JugadorVO rondajugador) {
        this.rondajugador = rondajugador;
    }


    

    public String getPreg_descripcion() {
        return preg_descripcion;
    }

    public void setPreg_descripcion(String preg_descripcion) {
        this.preg_descripcion = preg_descripcion;
    }

    public String getPreg_dificultad() {
        return preg_dificultad;
    }

    public void setPreg_dificultad(String preg_dificultad) {
        this.preg_dificultad = preg_dificultad;
    }

    public int getPreg_id() {
        return preg_id;
    }

    public void setPreg_id(int preg_id) {
        this.preg_id = preg_id;
    }
    
    
    
    
    
}
