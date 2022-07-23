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
import Beans.DetallePedidoBeans;
import Utils.ConexionDB;

/**
 *
 * @author Adriana
 */
@WebServlet(name = "ServletDetalle", urlPatterns = {"/ServletDetalle"})
public class ServletDetalle extends HttpServlet {

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
                        prepareStatement("select * from detalle_pedido");
                ResultSet rs = sta.executeQuery();

                ArrayList<DetallePedidoBeans> lista = new ArrayList<DetallePedidoBeans>();
                while (rs.next()) {
                    DetallePedidoBeans em = new DetallePedidoBeans(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getFloat(5), rs.getFloat(6));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/listadoDetalles.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String codigo = request.getParameter("id");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("delete from detalle_pedido where id=?");
                sta.setString(1, codigo);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletDetalle?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {

            try {
                int codigo = 0;
                int compra = Integer.parseInt(request.getParameter("txtId"));
                int producto = Integer.parseInt(request.getParameter("txtId"));
                int cantidad = Integer.parseInt(request.getParameter("txtId"));

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("insert into detalle_pedido values(?,?,?,?)");
                sta.setInt(1, codigo);
                sta.setInt(2, compra);
                sta.setInt(3, producto);
                sta.setInt(4, cantidad);
                sta.executeUpdate();
                request.setAttribute("idcompra", compra);
                request.getRequestDispatcher("mispedidos.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("editar")) {
            try {
                int codigo = 0;
                int compra = Integer.parseInt(request.getParameter("txtId"));
                int producto = Integer.parseInt(request.getParameter("txtId"));
                int cantidad = Integer.parseInt(request.getParameter("txtId"));

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update detalle_pedido set id=?, buy_id=?, product_id=?, q=? where id=? ");

                sta.setInt(1, codigo);
                sta.setInt(2, compra);
                sta.setInt(3, producto);
                sta.setInt(4, cantidad);
                sta.executeUpdate();

                request.getRequestDispatcher("ServletDetalle?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("consultarId")) {

            try {
                int codigo = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from detalle_pedido where id=?");
                sta.setInt(1, codigo);
                ResultSet rs = sta.executeQuery();

                ArrayList<DetallePedidoBeans> lista = new ArrayList<DetallePedidoBeans>();

                while (rs.next()) {
                    DetallePedidoBeans em = new DetallePedidoBeans(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getFloat(5), rs.getFloat(6));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/editarDetalles.jsp").forward(request, response);

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
