package Controlador;

import Modelo.VO.JugadorVO;
import Modelo.VO.PreguntasVO;
import Modelo.VO.RespuestasVO;
import Modelo.VO.RondaVO;
import ModeloDAO.JugadorDAO;
import ModeloDAO.PreguntasDAO;
import ModeloDAO.RespuestasDAO;
import ModeloDAO.RondaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author deibyasierra
 */
@WebServlet(name = "ctr_challenge_sofka", urlPatterns = {"/ctr_challenge_sofka"})
public class ctr_challenge_sofka extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        try {
            if (accion != null) {
                switch (accion) {
                    case "Jugar":
                        Jugar(request, response,request.getParameter("nombre"),request.getParameter("opcion"));
                        break;
                   case "Rendirse":
                        Rendirse(request, response,request.getParameter("nombre"));
                        break;
                    case "Ronda_2":
                        Ronda_2(request, response, request.getParameter("respuesta"), request.getParameter("opcion"), request.getParameter("nombre"),request.getParameter("acumulado"));
                        break;
                    default:
                        response.sendRedirect("inicio.jsp");

                }
            } else {
                response.sendRedirect("inicio.jsp");
            }
        } catch (Exception e) {
            try {
                System.out.println("algo pasa : "+ e.getMessage());
                this.getServletConfig().getServletContext().getRequestDispatcher("/inicio.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
 Timestamp timestamp = new Timestamp(System.currentTimeMillis());
 JugadorDAO guardar = new JugadorDAO();
    int i = 1;
    double t =0;
    private void Jugar(HttpServletRequest request, HttpServletResponse response,String nombre,String opcion) {

        try {
            
            if (opcion.equals("premio")) {
                 ArrayList<RondaVO> premios = new RondaDAO().Listar_premios();
                 request.setAttribute("premios", premios);
                 this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Premios.jsp").forward(request, response);
            }if (opcion.equals("inicio")) {
                 PreguntasVO datos = new PreguntasDAO().Preguntas(i);
                 request.setAttribute("datos", datos);
                 request.setAttribute("nombre", nombre);
          
            this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Inicial.jsp").forward(request, response);
              }
            
            if (opcion.equals("listar")) {
                   ArrayList<JugadorVO> jugador = new JugadorDAO().Listar_jugadores();
                   request.setAttribute("jugador", jugador);
                   this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Jugadores.jsp").forward(request, response);
            }
                    
        } catch (Exception e) {
            request.setAttribute("x", "error" + e.getMessage());

        } finally {
           
            request.removeAttribute("datos");
            request.removeAttribute("jugador");
            request.removeAttribute("premios");
        }
    }

    private void Ronda_2(HttpServletRequest request, HttpServletResponse response, String respuesta, String opcion, String nombre,String acumulado) {
        int resp = Integer.parseInt(opcion);
        int acum = Integer.parseInt(acumulado);
        
        t=t+acum;
        double premioFinal = 1000000+t;
        System.out.println("acumulado" + t);
        
            try {
        request.setAttribute("nombre", nombre);
        request.setAttribute("acumulado", t);
        
            RespuestasVO validar = new RespuestasDAO().Respuesta(resp);
            if (respuesta.equals(validar.getResp_correcta())) {
                if(i==5){
                request.setAttribute("total", premioFinal);
                JugadorVO jugador = new JugadorVO(premioFinal,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                i=1;
                t=0;
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Ganador.jsp").forward(request, response);
                  
                }else{
                
                i++;
                this.Jugar(request, response, nombre, "inicio");            
                }
            } else {
              //INSERTAR JUGADOR
               
                JugadorVO jugador = new JugadorVO(0.0,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                 i=1;
                 t=0;
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Finaliza.jsp").forward(request, response);
            }

        } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
        }finally{
            request.removeAttribute("total");
            request.removeAttribute("acumulado");
            request.removeAttribute("nombre");
            }
    }
    private void Rendirse(HttpServletRequest request, HttpServletResponse response, String nombre) {          
        try {
             request.setAttribute("nombre", nombre); 
              //INSERTAR JUGADOR
                JugadorVO jugador = new JugadorVO(t,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                i=1;
                t=0;
                this.getServletConfig().getServletContext().getRequestDispatcher("/inicio.jsp").forward(request, response);           
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());       
        }finally{      
     
        
        }
    }


}

