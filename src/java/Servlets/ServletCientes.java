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
import Beans.ClientesBeans;
import Utils.ConexionDB;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
@WebServlet(name = "ServletClientes", urlPatterns = {"/ServletClientes"})
public class ServletCientes extends HttpServlet {

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
                        prepareStatement("select * from clientes");
                ResultSet rs = sta.executeQuery();

                ArrayList<ClientesBeans> lista = new ArrayList<ClientesBeans>();

                while (rs.next()) {
                    ClientesBeans em = new ClientesBeans(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/listado.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("delete from clientes where id=?");
                sta.setInt(1, id);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletClientes?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {

                String nom = request.getParameter("txtNom");
                String ape = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String telefono = request.getParameter("txtTelefono");
                String direccion = request.getParameter("txtDirec");
                String dni = request.getParameter("txtDNI");
                String clave = request.getParameter("txtContra");

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from clientes");
                ResultSet rs = sta.executeQuery();
                boolean corroboraremail = true;
                boolean corroborardni = true;
                String msg = "";
                while (rs.next()) {

                    if (rs.getString("email").equalsIgnoreCase(email)) {
                        corroboraremail = false;

                    }
                    if (rs.getString("DNI").equalsIgnoreCase(dni)) {
                        corroborardni = false;
                    }
                }
                if (corroboraremail && corroborardni) {
                    sta = ConexionDB.getConexion().
                            prepareStatement("insert into clientes (nombre, apellidos, email, telefono, direccion, DNI, clave) "
                                    + "values(?,?,?,?,?,?,?)");

                    sta.setString(1, nom);
                    sta.setString(2, ape);
                    sta.setString(3, email);
                    sta.setString(4, telefono);
                    sta.setString(5, direccion);
                    sta.setString(6, dni);
                    sta.setString(7, clave);
                    sta.executeUpdate();
                    msg = "Resgistro Completo ✔️";
                    request.setAttribute("msg6", msg);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    if (corroborardni == false) {
                        msg += "⚠️ El DNI YA SE ENCUENTRA REGISTRADO";
                    }
                    if (corroboraremail == false) {
                        msg += "⚠️ El EMAIL YA SE ENCUENTRA REGISTRADO";
                    }
                    request.setAttribute("msge", msg);
                    request.getRequestDispatcher("nuevocli.jsp").forward(request, response);


                }

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("editar")) {
            try {
                int id = Integer.parseInt(request.getParameter("txtId"));
                String nombre = request.getParameter("txtNom");
                String apellidos = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String telefono = request.getParameter("txtTelefono");
                String direccion = request.getParameter("txtDirec");
                int dni = Integer.parseInt(request.getParameter("txtDNI"));
                String clave = request.getParameter("txtContra");

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update clientes set nombre=?,apellidos=?, email=?, telefono=?, direccion=?, dni=? , clave=? where id=? ");

                sta.setString(1, nombre);
                sta.setString(2, apellidos);
                sta.setString(3, email);
                sta.setString(4, telefono);
                sta.setString(5, direccion);
                sta.setInt(6, dni);
                sta.setString(7, clave);
                sta.setInt(8, id);
                sta.executeUpdate();

                request.getRequestDispatcher("ServletClientes?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("consultarId")) {

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from clientes where id=?");
                sta.setInt(1, id);
                ResultSet rs = sta.executeQuery();

                ArrayList<ClientesBeans> lista = new ArrayList<ClientesBeans>();

                while (rs.next()) {
                    ClientesBeans em = new ClientesBeans(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/editar.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("ConsultaPerfil")) {

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from clientes where id=?");
                sta.setInt(1, id);
                ResultSet rs = sta.executeQuery();

                ArrayList<ClientesBeans> lista = new ArrayList<ClientesBeans>();

                while (rs.next()) {
                    ClientesBeans em = new ClientesBeans(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                    lista.add(em);
                }
                request.setAttribute("listaC", lista);
                request.getRequestDispatcher("EditarPerfil.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("EditarPerfil")) {
            int id = Integer.parseInt(request.getParameter("txtId"));
            try {

                String nombre = request.getParameter("txtNom");
                String apellidos = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String telefono = request.getParameter("txtTelefono");
                String direccion = request.getParameter("txtDirec");
                String dni = request.getParameter("txtDNI");
                String clave = request.getParameter("txtContra");

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update clientes set nombre=?, apellidos=?, email=?, telefono=?, direccion=?, dni=?, clave=? where id=? ");

                sta.setString(1, nombre);
                sta.setString(2, apellidos);
                sta.setString(3, email);
                sta.setString(4, telefono);
                sta.setString(5, direccion);
                sta.setString(6, dni);
                sta.setString(7, clave);
                sta.setInt(8, id);
                sta.executeUpdate();
                request.setAttribute("msg22", "Actualización Completo ! ✔️");

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from clientes where id='" + id + "' ");

                ResultSet rs = psta.executeQuery();
                if (rs.next()) {

                    HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("usuario", rs.getString(2).toString());
                    sesionOk.setAttribute("apellidos", rs.getString(3).toString());
                    sesionOk.setAttribute("email", rs.getString(4).toString());
                    sesionOk.setAttribute("direccion", rs.getString(6).toString());
                    sesionOk.setAttribute("numero", rs.getString(5).toString());
                    sesionOk.setAttribute("clave", rs.getString(8).toString());
                    sesionOk.setAttribute("dni", rs.getString(7).toString());

                }
            } catch (Exception e) {
            }
            request.getRequestDispatcher("Perfil.jsp").forward(request, response);
        } else if (op.equals("ActualizarDatos")) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from clientes where id='" + id + "' ");

                ResultSet rs = psta.executeQuery();
                if (rs.next()) {

                    HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("usuario", rs.getString(2).toString());
                    sesionOk.setAttribute("apellidos", rs.getString(3).toString());
                    sesionOk.setAttribute("email", rs.getString(4).toString());
                    sesionOk.setAttribute("direccion", rs.getString(6).toString());
                    sesionOk.setAttribute("numero", rs.getString(5).toString());
                    sesionOk.setAttribute("clave", rs.getString(8).toString());
                    sesionOk.setAttribute("dni", rs.getString(7).toString());

                    request.getRequestDispatcher("Perfil.jsp").forward(request, response);

                }
            } catch (Exception e) {
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
