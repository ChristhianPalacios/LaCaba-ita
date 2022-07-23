<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Beans.AdminiBeans" %>
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
        <h2 align="center">Editar Administrador</h2>
          <form  action="ServletAdmin">
           <%
                ArrayList<AdminiBeans> lista=
                        (ArrayList<AdminiBeans>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    AdminiBeans em=lista.get(i);
                    %>
            <table class="table">
           <tr>
               <td>CodEmp </td> 
               <td><input type="text" name="txtCodEmp" class="form-control" value="<%=em.getCodigo()%>" readonly="readonly"></td>
           </tr> <tr>
            <td>Nombre: </td> 
              <td><input type="text" name="txtNom" class="form-control" value="<%=em.getNombre()%>"></td>
           </tr> <tr>
              <td>Edad: </td> 
              <td><input type="text" name="txtEdad" class="form-control" value="<%=em.getEdad()%>" ></td>
           </tr> <tr>
              <td>Perfil</td> 
              <td><input type="text" name="txtPerfil" class="form-control" value="<%=em.getPerfil()%>" readonly="readonly" ></td>
           </tr>  <tr>
              <td>Contraseña</td> 
              <td><input type="text" name="txtContra" class="form-control" value="<%=em.getPas()%>"></td>
           </tr> 
           <tr>
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
