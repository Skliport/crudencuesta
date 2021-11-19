package Servlets;

import Model.Respuesta;
import java.io.IOException;
import java.sql.SQLException;
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
                Respuesta respuesta = new Respuesta();
                respuesta.preguntaId = Integer.parseInt(request.getParameter("txtPreguntaId"));
                respuesta.respuesta = request.getParameter("txtRespuesta");
                Respuesta.Insert(respuesta);
                
                response.sendRedirect("/Laboratorio3/...");
                break;
            
            // Delete
            case 2:
                Respuesta.Remove(id);
                response.sendRedirect("/Laboratorio3/...");
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
