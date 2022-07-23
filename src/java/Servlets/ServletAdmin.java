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
import java.util.ArrayList;
import Beans.*;
import Utils.ConexionDB;

/**
 *
 * @author Eduardo
 */
@WebServlet(name = "ServletAdmin", urlPatterns = {"/ServletAdmin"})
public class ServletAdmin extends HttpServlet {

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

        if (op.equals("listar")) {
            try {
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from admin");
                ResultSet rs = sta.executeQuery();

                ArrayList<AdminiBeans> lista = new ArrayList<AdminiBeans>();

                while (rs.next()) {
                    AdminiBeans em = new AdminiBeans(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/listadoAdmin.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String codigo = request.getParameter("codEmp");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("delete from admin where codEmp=?");
                sta.setString(1, codigo);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletAdmin?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {
                String codigo = request.getParameter("txtCodEmp");
                String nombre = request.getParameter("txtNom");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                String perfil = request.getParameter("txtPerfil");
                String pas = request.getParameter("txtContra");

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("insert into admin values(?,?,?,?,?)");
                sta.setString(1, codigo);
                sta.setString(2, nombre);
                sta.setInt(3, edad);
                sta.setString(4, perfil);
                sta.setString(5, pas);
                sta.executeUpdate();

                request.getRequestDispatcher("ServletAdmin?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("editar")) {
            try {
                String codigo = request.getParameter("txtCodEmp");
                String nombre = request.getParameter("txtNom");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                String perfil = request.getParameter("txtPerfil");
                String pas = request.getParameter("txtContra");

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update admin set nombre=?,edad=?, perfil=?, pass=? where codEmp=? ");

                sta.setString(1, nombre);
                sta.setInt(2, edad);
                sta.setString(3, perfil);
                sta.setString(4, pas);
                sta.setString(5, codigo);
                sta.executeUpdate();

                request.getRequestDispatcher("ServletAdmin?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("consultarcodEmp")) {

            try {
                String codigo = request.getParameter("codEmp");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from admin where codEmp=?");
                sta.setString(1, codigo);
                ResultSet rs = sta.executeQuery();

                ArrayList<AdminiBeans> lista = new ArrayList<AdminiBeans>();

                while (rs.next()) {
                    AdminiBeans em = new AdminiBeans(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/editarAdmin.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("ListarContactanos")) {
            try {
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from contacto");
                ResultSet rs = sta.executeQuery();

                ArrayList<ContactanosBeans> lista = new ArrayList<ContactanosBeans>();

                while (rs.next()) {
                    ContactanosBeans em = new ContactanosBeans(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/nuevoAdmin.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("EliminarContacto")) {
            try {
                String codigo = request.getParameter("id");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("delete from contacto where idContacto=?");
                sta.setString(1, codigo);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletAdmin?op=ListarContactanos").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
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
