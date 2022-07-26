
<%@page import="dao.impl.ProductoDaoImpl"%>
<%@page import="dao.IProductoDao"%>
<%@page import="Beans.ProductosBeans"%>
<%@page import="Beans.DetallePedidoBeans"%>
<%@page import="Beans.Cesta"%>
<%@page import="Beans.PedidosBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
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
        <title>Listado de Administradores</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>


    </head>
    <body>

        <h2 align="center">Detalles</h2>
         <br>
        <div class="container">
            <center>
           <div>
<!--               Link para el direccionamiento para el PDF-->
               <a href="ListadoDetallePDF.jsp" class="btn btn-danger"> Generar PDF 📑</a></div></center><br>
            <table class="table">
                <tr bgcolor="lightgray">
<!--                    Estructura de la tabla-->
                    <td>Id</td>
                    <td>Id Pedido</td>
                    <td>Id Produco</td>
                    <td>Nombre Producto</td>
                    <td>Cantidad</td>
                    <td>Precio Unitario</td>
                    <td>Sub total</td
                </tr>

<!--ArrayList para mostrar los detalles de los pedidos-->
                <%

                    IProductoDao productoDao = new ProductoDaoImpl();
                    ArrayList<DetallePedidoBeans> listas
                            = (ArrayList<DetallePedidoBeans>) request.getAttribute("lista");
                    for (int i = 0; i < listas.size(); i++) {
                        DetallePedidoBeans dp = listas.get(i);
                        ProductosBeans p = productoDao.listarPorId(dp.getIdProducto());
                %>
                <tr>
<!--                    estructuramos los datos-->
                    <td><%=dp.getId()%></td>
                    <td><%=dp.getIdPedido()%></td>
                    <td><%=dp.getIdProducto()%></td>
                    <td><%=p.getNombre()%></td>   
                    <td><%=dp.getCantidad()%></td>
                    <td><%=dp.getPrecioUnitario()%></td>
                    <td><%=dp.getSubTotal()%></td>                 
                </tr>
                <%
                    }
                %>
            </table>
            <!--Fin de tabla-->
        </div>

    </body>
</html>
