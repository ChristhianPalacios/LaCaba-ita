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
        <title>JSP Page</title>
  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container">
        <h2 align="center">Editar Cliente</h2>
          <form  action="ServletClientes">
           <%
                ArrayList<ClientesBeans> lista=
                        (ArrayList<ClientesBeans>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    ClientesBeans em=lista.get(i);
                    %>
            <table class="table">
           <tr>
               <td>Id </td> 
               <td><input type="text" name="txtId" class="form-control" value="<%=em.getId()%>" readonly="readonly"></td>
           </tr> <tr>
            <td>Nombre: </td> 
              <td><input type="text" name="txtNom" class="form-control" value="<%=em.getNombre()%>"></td>
           </tr> <tr>
              <td>Apellido: </td> 
              <td><input type="text" name="txtApe" class="form-control" value="<%=em.getApellidos()%>" ></td>
           </tr> <tr>
              <td>Email</td> 
              <td><input type="text" name="txtEmail" class="form-control" value="<%=em.getEmail()%>" ></td>
           </tr>  <tr>
              <td>Telefono</td> 
              <td><input type="text" name="txtTelefono" class="form-control" value="<%=em.getTelefono()%>"></td>
           </tr>   <tr>
              <td>Dirección</td> 
              <td><input type="text" name="txtDirec" class="form-control" value="<%=em.getDireccion()%>" ></td>
           </tr><tr>
              <td>DNI:</td> 
              <td><input type="text" name="txtDNI" class="form-control" value="<%=em.getDNI() %>" ></td>
           </tr>  <tr>
              <td>Contraseña</td> 
              <td><input type="text" name="txtContra" class="form-control" value="<%=em.getClave()%>"></td>
           </tr> <tr>
               <td> <input type="Submit" name="btn" class="form-control btn btn-dark" value="Grabar datos"></td>

           </tr>

            </table>
               <input type="hidden" name="op" value="editar">   

              <%
                }
%>
        </form>
        </div>
        
    </body>
</html>
