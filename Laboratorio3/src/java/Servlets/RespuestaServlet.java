package Servlets;

import Model.Pregunta;
import Model.Respuesta;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RespuestaServlet", urlPatterns = {"/RespuestaServlet"})
public class RespuestaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> 
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.lang.InstantiationException
     * @throws java.lang.IllegalAccessException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, 
            IllegalAccessException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String[] values = request.getParameter("btnActionRespuesta").split("-");
        int action = Integer.parseInt(values[0]);
        int id = Integer.parseInt(values[1]);
        
        switch (action) {
            
            // Insert
            case 1:
                   
                // Si ya existen 3 respuestas registradas entonces no se registrarán más
                ArrayList<Respuesta> lRespuestas = Respuesta.GetById(id);
                if (lRespuestas.size() < 4) { 
                    
                    // Obteniendo pregunta para determinar si pueden insertarse respuestas o no
                    Pregunta pregunta = Pregunta.GetPreguntaById(id);
                    // Si es tipo de pregunta 2 (Opcion multiple) entonces si se pueden registrar respuestas
                    if (Integer.parseInt(pregunta.preguntaTipo) == 2) {
                        Respuesta respuesta = new Respuesta();
                        respuesta.preguntaId = id;
                        respuesta.respuesta = request.getParameter("txtRespuesta");
                        Respuesta.Insert(respuesta);
                    }
                }

                response.sendRedirect("/Laboratorio3/View/Admin/answerCrud.jsp?id="+id);
                break;
            
            // Delete
            case 2:
                Respuesta respuestaTemp = Respuesta.GetRespuestaById(id);
                int preguntaId = respuestaTemp.preguntaId;
                
                Respuesta.Remove(id);
                response.sendRedirect("/Laboratorio3/View/Admin/answerCrud.jsp?id="+preguntaId);
                break;
                
            // Update - Texto de respuesta
            case 3:
                String textoRespuesta = request.getParameter("txtUpdateTextoRespuesta");                
                Respuesta.Update(id, textoRespuesta);
                
                response.sendRedirect("/Laboratorio3/...");
                break;
                
            default:
                throw new AssertionError();
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(RespuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(RespuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

}
