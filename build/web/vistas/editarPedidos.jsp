<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Beans.PedidosBeans" %>
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
        <h2 align="center">Editar Pedidos</h2>
          <form  action="ServletPedidos">
           <%
                ArrayList<PedidosBeans> lista=
                        (ArrayList<PedidosBeans>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){
                    PedidosBeans em=lista.get(i);
                    %>
            <table class="table">
           <tr>
               <td>Id: </td> 
               <td><input type="text" name="txtId" class="form-control" value="<%=em.getId()%>" readonly="readonly"></td>
           </tr> <tr>
            <td>Nombre:</td> 
              <td><input type="text" name="txtNombre" readonly="readonly" class="form-control" value="<%=em.getNombreCliente()%>"></td>
           </tr> <tr>
            <td>DNI: </td> 
              <td><input type="text" name="txtDNI" readonly="readonly" class="form-control" value="<%=em.getDni() %>"></td>
           </tr> <tr>
              <td>Direccion: </td> 
              <td><input type="text" name="txtDire" class="form-control" value="<%=em.getDireccion()%>" ></td>
           </tr> <tr>
              <td>Total</td> 
              <td><input type="text" name="txtTotal" class="form-control" value="<%=em.getTotal()%>" readonly="readonly" ></td>
           </tr>  <tr>
              <td>Estado</td> 
              <td><input type="text" name="txtEstado" class="form-control" value="<%=em.getIdEstado()%>"></td>
           </tr> 
           <td>Creado: </td> 
           <td><input type="datetime" name="txtFecha" readonly="readonly" class="form-control" value="<%=em.getCreado()%>"></td>
           </tr> <tr>
              <td>Metodo de Pago: </td> 
              <td><input type="text" name="txtMetodoP" class="form-control" value="<%=em.getMetodoPago()%>" ></td>
           </tr> <tr>
              <td>Detalle de Pago</td> 
              <td><input type="text" name="txtDetalleP" class="form-control" value="<%=em.getDetallePago()%>" ></td>
           </tr>  
           <!--<tr>
              <td>Detalle de Pedido</td> 
              <td><input type="text" name="txtpedido" class="form-control"></td>
           </tr> -->
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
