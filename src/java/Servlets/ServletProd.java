/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Cesta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;
import Beans.ProductosBeans;
import Utils.ConexionDB;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
@WebServlet(name = "ServletProd", urlPatterns = {"/ServletProd"})
public class ServletProd extends HttpServlet {

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
                        prepareStatement("select * from productos");
                ResultSet rs = sta.executeQuery();

                ArrayList<ProductosBeans> lista = new ArrayList<ProductosBeans>();

                while (rs.next()) {
                    ProductosBeans em = new ProductosBeans(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getInt(8), rs.getInt(9));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/listadoprod.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("delete from productos where id=?");
                sta.setInt(1, id);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProd?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {
                int id = Integer.parseInt(request.getParameter("txtId"));
                String nombre = request.getParameter("txtNom");
                String codigo = request.getParameter("txtCod");
                String descripcion = request.getParameter("txtDes");
                String imagen = request.getParameter("txtImg");
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                int id_categoria = Integer.parseInt(request.getParameter("txtCategoria"));
                int id_unidad = Integer.parseInt(request.getParameter("txtUnidad"));

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("insert into productos values(?,?,?,?,?,?,?,?,?)");
                sta.setInt(1, id);
                sta.setString(2, nombre);
                sta.setString(3, codigo);
                sta.setString(4, descripcion);
                sta.setString(5, imagen);
                sta.setInt(6, stock);
                sta.setDouble(7, precio);
                sta.setInt(8, id_categoria);
                sta.setInt(9, id_unidad);
                sta.executeUpdate();

                request.getRequestDispatcher("ServletProd?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("editar")) {
            try {
                int id = Integer.parseInt(request.getParameter("txtId"));
                String nombre = request.getParameter("txtNom");
                String codigo = request.getParameter("txtCod");
                String descripcion = request.getParameter("txtDes");
                String imagen = request.getParameter("txtImg");
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                int id_categoria = Integer.parseInt(request.getParameter("txtCategoria"));
                int id_unidad = Integer.parseInt(request.getParameter("txtUnidad"));

                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update productos set nombre=?,codigo=?, descripcion=?, imagen=?, stock=?, precio=?, id_categoria=?, id_unidad=? where id=? ");

                sta.setString(1, nombre);
                sta.setString(2, codigo);
                sta.setString(3, descripcion);
                sta.setString(4, imagen);
                sta.setInt(5, stock);
                sta.setDouble(6, precio);
                sta.setInt(7, id_categoria);
                sta.setInt(8, id_unidad);
                sta.setInt(9, id);
                sta.executeUpdate();

                request.getRequestDispatcher("ServletProd?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("consultarId")) {

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("select * from productos where id=?");
                sta.setInt(1, id);
                ResultSet rs = sta.executeQuery();

                ArrayList<ProductosBeans> lista = new ArrayList<ProductosBeans>();

                while (rs.next()) {
                    ProductosBeans em = new ProductosBeans(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getInt(8), rs.getInt(9));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/editarprod.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("anadir")) {
            HttpSession sesion = request.getSession();
            ArrayList<Cesta> carrito;

            if (sesion.getAttribute("carrito") == null) {
                carrito = new ArrayList<Cesta>();
            } else {
                carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            }

            int cod = Integer.parseInt(request.getParameter("cod"));
            String des = request.getParameter("des");
            double pre = Double.parseDouble(request.getParameter("pre"));

            int indice = -1;
            int can = 0;

            for (int i = 0; i < carrito.size(); i++) {
                Cesta c2 = carrito.get(i);
                if (c2.getId() == cod) {
                    indice = i;
                    can = c2.getCan();
                    break;
                }
            }

            if (indice == -1) {
                Cesta c = new Cesta(cod, des, pre, 1);
                carrito.add(c);
            } else {
                int can2 = can + 1;
                Cesta c3 = new Cesta(cod, des, pre, can2);
                carrito.set(indice, c3);
            }
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("Cesta.jsp");
        } else if (op.equals("menos")) {
            HttpSession sesion = request.getSession();
            ArrayList<Cesta> carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            int cod = Integer.parseInt(request.getParameter("cod"));
            String des = request.getParameter("des");
            double pre = Double.parseDouble(request.getParameter("pre"));

            for (int i = 0; i < carrito.size(); i++) {
                Cesta c2 = carrito.get(i);
                if (c2.getId() == cod) {
                    if (c2.getCan() > 1) {
                        int can2 = c2.getCan() - 1;
                        Cesta c3 = new Cesta(cod, des, pre, can2);
                        carrito.set(i, c3);
                    }

                    break;
                }
            }

            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("Cesta.jsp");
        } else if (op.equals("mas")) {
            HttpSession sesion = request.getSession();
            ArrayList<Cesta> carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            int cod = Integer.parseInt(request.getParameter("cod"));
            String des = request.getParameter("des");
            double pre = Double.parseDouble(request.getParameter("pre"));

            int indice = -1;
            int can = 0;

            for (int i = 0; i < carrito.size(); i++) {
                Cesta c2 = carrito.get(i);
                if (c2.getId() == cod) {
                    indice = i;
                    can = c2.getCan();
                    break;
                }
            }

            if (indice == -1) {
                Cesta c = new Cesta(cod, des, pre, 1);
                carrito.add(c);
            } else {
                int can2 = can + 1;
                Cesta c3;
                if (can2>10) {
                    c3 = new Cesta(cod, des, pre, 10);
                    
                }else{
                     c3 = new Cesta(cod, des, pre, can2);
                     
                }
               
               carrito.set(indice, c3);
            }
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("Cesta.jsp");
        }else if(op.equals("Delete")){
            HttpSession sesion = request.getSession();
            int idproducto=Integer.parseInt(request.getParameter("idp"));
             ArrayList<Cesta> carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            for (int i = 0; i < carrito.size(); i++) {
                if (carrito.get(i).getId()== idproducto) {
                    carrito.remove(i);
                }
                
            }
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("Cesta.jsp");
            
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
