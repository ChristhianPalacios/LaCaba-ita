<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Beans.ClientesBeans" %>
        <!--Verificacion de la sesion, ademas llamamos los datos de usuario(Administrador)-->
<%@page session="true" %>
<%
    String usuario = "";

    HttpSession sesionOk = request.getSession();

    if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="indexadmin.jsp">
    <jsp:param name="msg4" value="Debe Iniciar Sesión Obligatoriamente"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("usuario");

    }
%>
<!--Ademas restricciones para que no entren a la pagina defrente sin haber iniciado Sesion-->
<!--Fin de Session-Restricciones-Envio de Datos-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
          <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

        <!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

        
    </head>
    <body>

        <h2 align="center">Listado de Clientes</h2>
        <div class="container">
            
            <table class="table">
                <tr bgcolor="lightgray">
                    <td>Id</td>
                    <td>Nombre</td>
                    <td>Apellidos</td>
                    <td>DNI:</td>
                    <td>Email</td>
                    <td>Telefono</td>
                    <td>Dirección</td>
                    
                    <td>Eliminar</td>
                    <td>Editar</td>
                </tr>
            
            <%
                ArrayList<ClientesBeans> lista=
                        (ArrayList<ClientesBeans>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    ClientesBeans em=lista.get(i);
                    %>
                    <tr>
                        <td><%=em.getId()%></td>
                        <td><%=em.getNombre()%></td>
                        <td><%=em.getApellidos()%></td>
                        <td><%=em.getDNI() %></td>
                        <td><%=em.getEmail()%></td>
                        <td><%=em.getTelefono()%></td>
                        <td><%=em.getDireccion()%></td>
                      
                        <td>
                            <a href="ServletClientes?op=eliminar&id=<%=em.getId()%>">
                            <i class='bx bxs-trash bx-sm bx-border-circle bx-burst-hover' style='color:#ff0000'></i> </a>
                           
                        </td> <td>
                          <a href="ServletClientes?op=consultarId&id=<%=em.getId()%>">  
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
