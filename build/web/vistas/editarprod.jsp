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
        <title>JSP Page</title>
  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container">
        <h2 align="center"> Editar Producto </h2>
          <form  action="ServletProd">
           <%
                ArrayList<ProductosBeans> lista=
                        (ArrayList<ProductosBeans>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    ProductosBeans em=lista.get(i);
                    %>
            <table class="table">
           <tr>
               <td>Id </td> 
               <td><input type="number" name="txtId" class="form-control" value="<%=em.getId()%>" readonly="readonly"></td>
           </tr> <tr>
            <td>Nombre: </td> 
              <td><input type="text" name="txtNom" class="form-control" value="<%=em.getNombre()%>"></td>
           </tr> <tr>
              <td>Codigo: </td> 
              <td><input type="text" name="txtCod" class="form-control" value="<%=em.getCodigo()%>" ></td>
           </tr> <tr>
              <td>Descripción: </td> 
              <td><input type="text" name="txtDes" class="form-control" value="<%=em.getDescripcion()%>" ></td>
           </tr>  <tr>
              <td>Imagen: </td> 
              <td><input type="file" name="txtImg" class="form-control" value="<%=em.getImagen()%>"></td>
           </tr>   <tr>
              <td>Stock: </td> 
              <td><input type="text" name="txtStock" class="form-control" value="<%=em.getStock()%>" ></td>
           </tr> <tr>
              <td>Precio: </td> 
              <td><input type="text" name="txtPrecio" class="form-control" value="<%=em.getPrecio()%>"></td>
           </tr> <tr>
              <td>Categoria</td> 
              <td><input type="text" name="txtCategoria" class="form-control" value="<%=em.getCategoria()%>"></td>
           </tr> <tr>
              <td>Unidad</td> 
              <td><input type="text" name="txtUnidad" class="form-control" value="<%=em.getUnidad()%>"></td>
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
