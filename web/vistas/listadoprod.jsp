<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Beans.ProductosBeans" %>
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
        <title>Listado de Productos</title>
          <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

        <!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

        
    </head>
    <body>

        <h2 align="center"> Listado de Productos</h2>
        <div class="container">
            
            <table class="table">
                <tr bgcolor="lightgray">
                    <td>Id</td>
                    <td>Nombre</td>
                    <td>Codigo</td>
                    <td>Descripcion</td>
                    <td>Imagen</td>
                    <td>Stock</td>
                    <td>Precio</td>
                    <td>Categoria</td>
                    <td>Unidad</td>
                    <td>Eliminar</td>                    
                    <td>Editar</td>
                </tr>
            
            <%
                ArrayList<ProductosBeans> lista=
                        (ArrayList<ProductosBeans>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    ProductosBeans em=lista.get(i);
                    %>
                    <tr>
                        <td><%=em.getId()%></td>
                        <td><%=em.getNombre()%></td>
                        <td><%=em.getCodigo()%></td>
                        <td><%=em.getDescripcion()%></td>
                        <td><img src="img/<%=em.getImagen()%>" width="90" height="90"></td>
                        <td><%=em.getStock()%></td>
                        <td><%=em.getPrecio()%></td>
                        <td><%=em.getCategoria()%></td>
                        <td><%=em.getUnidad()%></td>
                        <td>
                            <a href="ServletProd?op=eliminar&id=<%=em.getId()%>">
                            <i class='bx bxs-trash bx-sm bx-border-circle bx-burst-hover' style='color:#ff0000'></i> </a>
                           
                        </td> <td>
                          <a href="ServletProd?op=consultarId&id=<%=em.getId()%>">  
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

