
package Servlets;

import Beans.ClientesBeans;
import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletEditacion", urlPatterns = {"/ServletEditacion"})
public class ServletEditacion extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         String op = request.getParameter("op");
         if (op.equals("ConsultaPerfil")) {
               try {
                int id = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from clientes where id=?");
                sta.setInt(1, id);
                ResultSet rs = sta.executeQuery();

                ArrayList<ClientesBeans> lista = new ArrayList<ClientesBeans>();

                while (rs.next()) {
                    ClientesBeans em = new ClientesBeans(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7), rs.getString(8));
                    lista.add(em);
                }
                request.setAttribute("listaC", lista);
                request.getRequestDispatcher("EditarPerfil.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
         }else if(op.equals("ListarClietnes")){
             
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
