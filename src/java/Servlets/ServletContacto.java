package Servlets;

import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chris
 */
@WebServlet(name = "ServletContacto", urlPatterns = {"/ServletContacto"})
public class ServletContacto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
         String ct = request.getParameter("ct");
         if (ct.equals("insertar")) {
             try {
                 int id=0;
                 String nombre=request.getParameter("txtname");
                 String apellido=request.getParameter("txtApellido");
                 int telefono=Integer.parseInt(request.getParameter("txtFono"));
                 String correo=request.getParameter("txtCorreo");
                 String motivo=request.getParameter("txtMotivo");
                 String mensaje=request.getParameter("txtMnesaje");
                 PreparedStatement sta=ConexionDB.getConexion().prepareStatement("insert into contacto values(?,?,?,?,?,?,?)");
                 sta.setInt(1, id);
                 sta.setString(2, nombre);
                 sta.setString(3, apellido);
                 sta.setInt(4, telefono);
                 sta.setString(5, correo);
                 sta.setString(6, motivo);
                 sta.setString(7, mensaje);
                 sta.executeUpdate();
                 
                 request.getRequestDispatcher("MensajeC.jsp").forward(request, response);
             } catch (Exception e) {
                 System.out.println("Error:"+e);
             }
        }else if(ct.equals("insertar2")){
              try {
                int id=0;
                 String nombre=request.getParameter("txtname");
                 String apellido=request.getParameter("txtApellido");
                 int telefono=Integer.parseInt(request.getParameter("txtFono"));
                 String correo=request.getParameter("txtCorreo");
                 String motivo=request.getParameter("txtMotivo");
                 String mensaje=request.getParameter("txtMnesaje");
                 PreparedStatement sta=ConexionDB.getConexion().prepareStatement("insert into contacto values(?,?,?,?,?,?,?)");
                 sta.setInt(1, id);
                 sta.setString(2, nombre);
                 sta.setString(3, apellido);
                 sta.setInt(4, telefono);
                 sta.setString(5, correo);
                 sta.setString(6, motivo);
                 sta.setString(7, mensaje);
                 sta.executeUpdate();
               
                 request.getRequestDispatcher("MensajeC_1.jsp").forward(request, response);
             } catch (Exception e) {
                 System.out.println("Error:"+e);
             }
        }
    }

   
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

}
