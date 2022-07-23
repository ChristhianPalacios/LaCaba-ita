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

import Utils.ConexionDB;
import Beans.Beans_Reserva;
import java.sql.*;
import java.util.ArrayList;


@WebServlet(name = "Servlet_Reserva", urlPatterns = {"/Servlet_Reserva"})
public class Servlet_Reserva extends HttpServlet {

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
        
        
        //declaro una variable para que pueda obtener los datos
         String res= request.getParameter("res");
         if(res.equals("listar")){
             try{
                 java.sql.PreparedStatement sta= ConexionDB.getConexion().
                         prepareStatement("select *  from reservaas");
                 ResultSet rs=sta.executeQuery();
                 
               ArrayList<Beans_Reserva> lista = new  ArrayList<Beans_Reserva> ();
               while(rs.next()){
                   Beans_Reserva fm=new Beans_Reserva(rs.getInt(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4),rs.getString(6),rs.getString(7));
                   
                   lista.add(fm);
               }
               request.setAttribute("lista", lista);
               request.getRequestDispatcher("vistas/listadoReserva.jsp").forward(request, response);
             }catch(Exception e){
                  System.out.println("Error "+e);
             }
         }else if(res.equals("insertar")){
             try{
            int dni=Integer.parseInt(request.getParameter("txtDni"));
            String nom=request.getParameter("txtNom");
            String per=request.getParameter("selectPerso");
            String date=request.getParameter("txtDate");
            String hora=request.getParameter("txtHora");
            String plato=request.getParameter("selectPlato");
            String oca=request.getParameter("selectoccasion");
            
            PreparedStatement sta=ConexionDB.getConexion().
                prepareStatement("insert into reservaas values (?,?,?,?,?,?,?)");
        sta.setInt(1,dni);
        sta.setString(2,nom);
        sta.setString(3,per);
        sta.setString(4,date);
        sta.setString(5,hora);
        sta.setString(6,plato);
        sta.setString(7,oca);
        sta.executeUpdate();
        
            request.getRequestDispatcher("dashboardcliente.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println("Error "+e);
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
