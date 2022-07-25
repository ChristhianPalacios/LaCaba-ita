/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Cesta;
import Beans.DetallePedidoBeans;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;
import Beans.PedidosBeans;
import Beans.ProductosBeans;
import Utils.ConexionDB;
import dao.IDetallePedidoDao;
import dao.IPedidoDao;
import dao.IProductoDao;
import dao.impl.DetallePedidoDaoImpl;
import dao.impl.PedidoDaoImpl;
import dao.impl.ProductoDaoImpl;
import java.util.List;
import javax.servlet.http.HttpSession;
//import java.io.*;
//import net.sf.jasperreports.engine.*;
//import net.sf.jasperreports.view.JasperViewer;
//import javax.servlet.ServletResponse;

/**
 *
 * @author Adriana
 */
    @WebServlet(name = "ServletPedidos", urlPatterns = {"/ServletPedidos"})
public class ServletPedidos extends HttpServlet {

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
        IPedidoDao pedidoDao = new PedidoDaoImpl();

        if (op.equals("listar")) {
            try {
                List<PedidosBeans> lista = pedidoDao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("listadoPedidos.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String codigo = request.getParameter("id");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("delete from pedido where id=?");
                sta.setString(1, codigo);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletPedidos?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {

            try {
                //int codigo = 0; // autoincrementable
                   
                IDetallePedidoDao detallePedidoDao = new DetallePedidoDaoImpl();
                IProductoDao productoDao = new ProductoDaoImpl();
                
                int idcliente = Integer.parseInt(request.getParameter("txtId"));
                String cliente = request.getParameter("txtNombre");
                String detalleAdicional = request.getParameter("txtDetalleA");
                String direccion = request.getParameter("txtDire");
                int dni=Integer.parseInt(request.getParameter("txtDNI"));
                String metodo = request.getParameter("txtMetodoP");
                String detalleP = request.getParameter("txtDetalleP");
                String fecha = request.getParameter("txtFecha");
                Double total = Double.parseDouble(request.getParameter("total"));
                int estado = 1;
                
                PedidosBeans pedidosBeans = new PedidosBeans(idcliente, cliente, dni,  detalleAdicional, direccion, total, estado, fecha, metodo,  detalleP);
                
                pedidosBeans = pedidoDao.registrar(pedidosBeans);
                //Detalle de pedido
                
                HttpSession session= (HttpSession) request.getSession();
                ArrayList<Cesta> listaCesta = (ArrayList<Cesta>) session.getAttribute("carrito");
                
                for(Cesta cesta : listaCesta){
                    DetallePedidoBeans detallePedidoBeans = new DetallePedidoBeans(pedidosBeans.getId(), cesta.getId(), cesta.getCan(), cesta.getPrecio(), cesta.getCan()*cesta.getPrecio() );
                    
                    detallePedidoDao.registrar(detallePedidoBeans);
                    
                    //restar stock
                    ProductosBeans productoEncontrado = productoDao.listarPorId(cesta.getId());
                    int stockActual = productoEncontrado.getStock();
                    int cantidadPedido = cesta.getCan();
                    
                    int stockDespues = stockActual-cantidadPedido;
                    productoEncontrado.setStock(stockDespues);
                    productoDao.editar(productoEncontrado);
                    
                }
                
                request.setAttribute("msg4", "COMPRA EXITOSAMENTE! ");
                request.setAttribute("msg5", "En unos momentos nos comunicaremos con usted para confirmar el pedido");
                request.setAttribute("idcliente", Integer.parseInt(request.getParameter("txtId")));
                request.getRequestDispatcher("mispedidos.jsp").forward(request, response);
 

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("editar")) {
            try {
                int codigo = Integer.parseInt(request.getParameter("txtId"));
                String cliente = request.getParameter("txtNombre");
                String direccion = request.getParameter("txtDire");
                Double total = Double.parseDouble(request.getParameter("txtTotal"));
                int estado = Integer.parseInt(request.getParameter("txtEstado"));
                String fecha = request.getParameter("txtFecha");
                String metodo = request.getParameter("txtMetodoP");
                String detalleP = request.getParameter("txtDetalleP");
                int dni = Integer.parseInt(request.getParameter("txtDNI"));
             
                PedidosBeans pedidosBeans = new PedidosBeans();
                pedidosBeans.setNombreCliente(cliente);
                pedidosBeans.setDni(dni);
                pedidosBeans.setDireccion(direccion);
                pedidosBeans.setTotal(total);
                pedidosBeans.setIdEstado(estado);
                pedidosBeans.setCreado(fecha);
                pedidosBeans.setMetodoPago(metodo);
                pedidosBeans.setDetallePago(detalleP);
                pedidosBeans.setId(codigo); 
            
                pedidosBeans = pedidoDao.editar(pedidosBeans);

                request.getRequestDispatcher("ServletPedidos?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("consultarId")) {

            try {
                int codigo = Integer.parseInt(request.getParameter("id"));
                List<PedidosBeans> lista = pedidoDao.listarPorId(codigo);
               
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/editarPedidos.jsp").forward(request, response);

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
