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
import Beans.ClientesBeans;
import Utils.ConexionDB;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nataly Cuyate
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String op = request.getParameter("op");
        if (op.equalsIgnoreCase("login")) {
            int dni=Integer.parseInt(request.getParameter("txtDNI"));
            String Contraseña = request.getParameter("txtContra");

            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from clientes where dni=? and clave=?");
                psta.setInt(1, dni);
                psta.setString(2, Contraseña);
                ResultSet rs = psta.executeQuery();
                if (rs.next()) {

                    HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("usuario", rs.getString(2).toString());
                    sesionOk.setAttribute("apellidos", rs.getString(3).toString());
                    sesionOk.setAttribute("email", rs.getString(4).toString());
                    sesionOk.setAttribute("id", rs.getString(1).toString());
                    sesionOk.setAttribute("direccion", rs.getString(6).toString());
                    sesionOk.setAttribute("dni", rs.getString(7).toString());
                    sesionOk.setAttribute("numero", rs.getString(5).toString());
                   sesionOk.setAttribute("clave", rs.getString(8).toString());

                    

                    request.getRequestDispatcher("dashboardcliente.jsp").forward(request, response);

                } else {
                    request.setAttribute("msg", "Nombre o contraseña Incorrectos!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            } catch (Exception e) {
            }
        }

//        String nombre = request.getParameter("txtNom");
//        String contraseña = request.getParameter("txtContra");
//        try {
//            PreparedStatement psta = ConexionDB.getConexion().
//                    prepareStatement("select * from clientes where nombre=? and clave=?");
//            psta.setString(1, nombre);
//            psta.setString(2, contraseña);
//            ResultSet rs = psta.executeQuery();
//
//            if (rs.next()) {
//                HttpSession sesionOk = request.getSession();
//                //Se da la bienvenidad al usuario
//                sesionOk.setAttribute("usuario", rs.getString(2).toString());
//                request.setAttribute("perfil", rs.getString(4).toString());
//                request.getRequestDispatcher("dashboardcliente.jsp").forward(request, response);
//            } else {
//                request.setAttribute("msg", "Usuario o Contraseña Incorrectas!");
//                request.getRequestDispatcher("Login.jsp").forward(request, response);
//            }
//        } catch (Exception e) {
//            System.out.println("Error:" + e);
//        }
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

}
