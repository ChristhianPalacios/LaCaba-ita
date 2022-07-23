<%@page import="java.util.List"%>
<%@page import="Beans.DetallePedidoBeans"%>
<%@page import="Servlets.ServletPedidos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.PedidosBeans"%>
<%@page import="Utils.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String usuario = "";
    String email = "";
    String apellidos = "";
    String id = "";
    HttpSession sesionOk = request.getSession();

    if (sesionOk.getAttribute("usuario") == null) {

%>
<jsp:forward page="index.jsp">
    <jsp:param name="msg2" value="Debe Iniciar Sesión obligatoriamente!"/>
</jsp:forward>

<%    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
        email = (String) sesionOk.getAttribute("email");
         id = (String) sesionOk.getAttribute("id");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis Pedidos 🛒</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <!-- Llamar a los estilos -->
        <link href="estilos/estilos1.css" rel="stylesheet">
    </head>
    <body >
        
        <style>
            body{
                background-image: url(img/banner.jpg);
                background-repeat: no-repeat;
            }

        </style>
        <!-- ======= Encabezamiento ======= -->
        <header id="header" class="d-flex align-items-cente">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
                <h1 class="logo me-auto me-lg-0"><a href="#"> <img src="img/LOGOPRUEBA1.png" alt="LOGO"/> </a></h1>
                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="dashboardcliente.jsp">Inicio</a></li>
                        <li><a class="nav-link scrollto" href="mispedidos.jsp">Mis pedidos</a></li>
                        <li><a class="nav-link scrollto" href="dashboardcliente.jsp#menu">Menu</a></li>

                        <li class="nav-item">
                            <a class="nav-link " href="CerrarSesion.jsp">Cerrar Sesion</a>
                        </li>

                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->
                <a href="dashboardcliente.jsp#menu" class="book-a-table-btn scrollto d-none d-lg-flex">PEDIR</a>
                <a href="Cesta.jsp"> <img  class="nav-item"src="img/cart.png" alt="carrito"> </a>


            </div>
        </header>
           
        <div class=" container align-items-center">
            <h2 align="center" style="margin-top: 40px">Mis Detalles de pedidos</h2>
              <div class="container" style="margin-top: 60px">
                <table class="table table-dark table-striped">
                    
                    <thead>
                        <tr bgcolor="lightgray">
                            <th>Id</td>
                            <th>Id Pedido</th>
                            <th>Nombre de producto</th>
                            <th>Cantidad</th>
                            <th>Precio unitario</th>
                            <th>Sub total</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    List<DetallePedidoBeans> listaDetallePedido = (ArrayList<DetallePedidoBeans>)request.getAttribute("listaDetallePedido");
                    for(int i=0;i<listaDetallePedido.size();i++){
                        DetallePedidoBeans em=listaDetallePedido.get(i);
                    %>
          
                        <tr>
                            <td><%=em.getId()%></td>
                            <td><%=em.getIdPedido()%></td>
                            <td><%=em.getNombreProducto()%></td>
                            <td><%=em.getCantidad()%></td>
                            <td><%=em.getPrecioUnitario()%></td>
                            <td><%=em.getSubTotal()%></td>
                        </tr>
                    <%}%>
                    </tbody>
                </table>            
            </div>
        
        
    </body>
</html>
