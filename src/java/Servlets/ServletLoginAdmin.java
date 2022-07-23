/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import Beans.AdminiBeans;
import Utils.ConexionDB;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nataly Cuyate
 */
@WebServlet(name = "ServletLoginAdmin", urlPatterns = {"/ServletLoginAdmin"})
public class ServletLoginAdmin extends HttpServlet {

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
        String op = request.getParameter("op");
        if (op.equalsIgnoreCase("loginadmin")) {
            String usuario = request.getParameter("txtUsu");
            String Contraseña = request.getParameter("txtPas");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from admin where codEmp=? and pass=?");
                psta.setString(1, usuario);
                psta.setString(2, Contraseña);
                ResultSet rs = psta.executeQuery();
                if (rs.next()) {
                    HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("usuario", rs.getString(2).toString());
                    request.setAttribute("perfil", rs.getString(4).toString());

                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg3", "Usuario o contraseña Incorrectos!");
                    request.getRequestDispatcher("indexadmin.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        }
//          String usu=request.getParameter("txtUsu");
//        String pas=request.getParameter("txtPas");
//          try{
//              PreparedStatement psta= ConexionDB.getConexion().
//                      prepareStatement("select * from admin where codEmp=? and pass=?");
//              psta.setString(1,usu);
//               psta.setString(2,pas);
//               ResultSet rs=psta.executeQuery();
//               
//               if(rs.next()){
//                   HttpSession sesionOk= request.getSession();
//                //Se da la bienvenidad al usuario
//                   sesionOk.setAttribute("usuario", rs.getString(2).toString());
//                   request.setAttribute("perfil", rs.getString(4).toString());
//                   request.getRequestDispatcher("dashboard.jsp").forward(request, response);
//               }else{
//                   request.setAttribute("Error", "usuario o pass incorrectos");
//                   request.getRequestDispatcher("indexadmin.jsp").forward(request, response);
//               }
//          }catch(Exception e){
//              
//          }

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
