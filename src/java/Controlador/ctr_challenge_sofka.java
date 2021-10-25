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
                        Rendirse(request, response,request.getParameter("nombre"),request.getParameter("acumulado"));
                        break;
                    case "Ronda_2":
                        Ronda_2(request, response, request.getParameter("respuesta"), request.getParameter("opcion"), request.getParameter("nombre"),request.getParameter("acumulado"));
                        break;

                    case "Ronda_3":
                        Ronda_3(request, response, request.getParameter("respuesta"), request.getParameter("opcion"), request.getParameter("nombre"),request.getParameter("acumulado"),request.getParameter("premio"));
                        break;
                    case "Ronda_4":
                        Ronda_4(request, response, request.getParameter("respuesta"), request.getParameter("opcion"), request.getParameter("nombre"),request.getParameter("acumulado"),request.getParameter("premio"));
                        break;
                    case "Ronda_5":
                        Ronda_5(request, response, request.getParameter("respuesta"), request.getParameter("opcion"), request.getParameter("nombre"),request.getParameter("acumulado"),request.getParameter("premio"));
                        break;

                    default:
                        response.sendRedirect("identificar.jsp");

                }
            } else {
                response.sendRedirect("identificar.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);

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
    private void Jugar(HttpServletRequest request, HttpServletResponse response,String nombre,String opcion) {
   
        try {
            
            if (opcion.equals("premio")) {
                 ArrayList<RondaVO> premios = new RondaDAO().Listar_premios();
                 request.setAttribute("premios", premios);
                 this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Premios.jsp").forward(request, response);
            }if (opcion.equals("inicio")) {
                 PreguntasVO datos = new PreguntasDAO().Preguntas(1);
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
        
            try {
        request.setAttribute("nombre", nombre);
        request.setAttribute("acumulado", acumulado);
            RespuestasVO validar = new RespuestasDAO().Respuesta(resp);
            if (respuesta.equals(validar.getResp_correcta())) {
                PreguntasVO datos = new PreguntasDAO().Preguntas(2);
                request.setAttribute("datos", datos);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Ronda.jsp").forward(request, response);

            } else {
              //INSERTAR JUGADOR
                JugadorVO jugador = new JugadorVO(0.0,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Finaliza.jsp").forward(request, response);
            }

        } catch (Exception e) {
        }
    }

    private void Ronda_3(HttpServletRequest request, HttpServletResponse response, String respuesta, String opcion, String nombre ,String acumulado,String premio) {
        int resp = Integer.parseInt(opcion);
        int acum = Integer.parseInt(acumulado);
        int acu = Integer.parseInt(premio);
   
        try {
                 
            request.setAttribute("nombre", nombre);
            request.setAttribute("acumulado", acu+acum);
            RespuestasVO validar = new RespuestasDAO().Respuesta(resp);
            if (respuesta.equals(validar.getResp_correcta())) {
                PreguntasVO datos = new PreguntasDAO().Preguntas(3);
                request.setAttribute("datos", datos);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Ronda_3.jsp").forward(request, response);

            } else {
                //INSERTAR JUGADOR
                JugadorVO jugador = new JugadorVO(0.0,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Finaliza.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("x", "error " + e.getMessage());

        } finally {
            request.removeAttribute("datos");

        }
    }

    private void Ronda_4(HttpServletRequest request, HttpServletResponse response, String respuesta, String opcion, String nombre ,String acumulado,String premio) {
          int resp = Integer.parseInt(opcion);
        int acum = Integer.parseInt(acumulado);
        int acu = Integer.parseInt(premio);
        try {
            request.setAttribute("nombre", nombre);
            request.setAttribute("acumulado", acu+acum);
            RespuestasVO validar = new RespuestasDAO().Respuesta(resp);
            if (respuesta.equals(validar.getResp_correcta())) {
                PreguntasVO datos = new PreguntasDAO().Preguntas(4);
                request.setAttribute("datos", datos);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Ronda_4.jsp").forward(request, response);

            } else {
                //INSERTAR JUGADOR
                JugadorVO jugador = new JugadorVO(0.0,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Finaliza.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("x","Error"+ e.getMessage());

        } finally {
            request.removeAttribute("datos");
        }
    }

    private void Ronda_5(HttpServletRequest request, HttpServletResponse response, String respuesta, String opcion, String nombre ,String acumulado ,String premio) {
             int resp = Integer.parseInt(opcion);
        int acum = Integer.parseInt(acumulado);
        int acu = Integer.parseInt(premio);
        int premioFinal=1000000;
        
        try {
             request.setAttribute("nombre", nombre);
            request.setAttribute("acumulado", acu+acum);
            request.setAttribute("total", acu+acum+premioFinal);
            RespuestasVO validar = new RespuestasDAO().Respuesta(resp);
            if (respuesta.equals(validar.getResp_correcta())) {
                PreguntasVO datos = new PreguntasDAO().Preguntas(5);
                request.setAttribute("datos", datos);
                JugadorVO jugador = new JugadorVO(acu+acum+premioFinal,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Ganador.jsp").forward(request, response);

            } else {
                //INSERTAR JUGADOR
                JugadorVO jugador = new JugadorVO(0.0,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                this.getServletConfig().getServletContext().getRequestDispatcher("/Vista/Sofka_Vista_Finaliza.jsp").forward(request, response);
              
            }

        } catch (Exception e) {
            request.setAttribute("x", "Error" + e.getMessage());

        } finally {
            request.removeAttribute("datos");
        }
    }

    private void Rendirse(HttpServletRequest request, HttpServletResponse response, String nombre, String acumulado) {
         int acum = Integer.parseInt(acumulado);
         
        try {
             request.setAttribute("nombre", nombre);
             
              //INSERTAR JUGADOR
                JugadorVO jugador = new JugadorVO(acum,timestamp,nombre);
                guardar.Guardar_Jugador(jugador);
                this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            
            
        }finally{
        
        
        
        }
    }


}
