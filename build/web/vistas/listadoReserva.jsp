<%-- 
    Document   : listadoReserva
    Created on : 07/12/2021, 05:49:17 PM
    Author     : USER
--%>
<%@page import="java.util.*" %>
<%@page import="Beans.Beans_Reserva"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservas </title>
          <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

        <!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

        
    </head>
    <body>

        <h2 align="center"> Reservas </h2>
        <div class="container">
            
            <table class="table">
                <tr bgcolor="lightgray">
                    <td>Dni</td>
                    <td>Nombre</td>
                    <td># Personas</td>
                    <td>Fecha</td>
                    <td>Hora</td>
                    <td>comida</td>
                    <td>Ocasión</td>
                    <td>Eliminar</td>                  
                </tr>
             <%
                ArrayList<Beans_Reserva> lista=
                        (ArrayList<Beans_Reserva>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    Beans_Reserva fm=lista.get(i);
                    %>
                    <tr>
                        <td><%=fm.getDni() %></td>
                        <td><%=fm.getNombre() %></td>
                        <td><%=fm.getPers() %></td>
                        <td><%=fm.getFecha() %></td>
                        <td><%=fm.getHora() %></td>
                        <td><%=fm.getPlato() %></td>
                        <td><%=fm.getOcasion() %></td>
                        <td>
                            <a href="Servlet_Reserva?res=eliminar&dni=<%=fm.getDni()%>">
                            <i class='bx bxs-trash bx-sm bx-border-circle bx-burst-hover' style='color:#ff0000'></i> </a>
                           
                        </td> <td>
                          <a href="Servlet_Reserva?op=consultarId&dni=<%=fm.getDni()%>">  
                              <i class='bx bxs-pencil bx-sm bx-border-circle bx-burst-hover' style='color:#2ac903'></i></a>
                        
                        
                        </td>
                    </tr>
                    <%
                }
                %>
            </table>
            
        </div>
        
    </body>
</html>

