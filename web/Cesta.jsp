<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Beans.*" %>
<%@page session="true" %>
<%
    String usuario = "";
    String email = "";
    String apellidos = "";
    HttpSession sesionOk = request.getSession();

    if (sesionOk.getAttribute("usuario") == null) {

%>
<jsp:forward page="index.jsp">
    <jsp:param name="msg2" value="Debe Iniciar Sesión obligatoriamente!"/>
</jsp:forward>

<%    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
        email = (String) sesionOk.getAttribute("email");

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cesta 💰</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- Llamar a los estilos -->
        <script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>
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
                <h1 class="logo me-auto me-lg-0"><a href="dashboardcliente.jsp"> <img src="img/LOGOPRUEBA1.png" alt="LOGO"/> </a></h1>
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
                <img class="nav-item"src="img/cart.png" alt="carrito">


            </div>
        </header>
        <div class="container align-items-center ">
            <h2 align="center">Mi Carrito de Compras</h2>
            <div class="container">
                <table class="table table-dark table-striped">
                    <tr bgcolor="white">
                        <th colspan="6">Cesta de Productos</th>
                    </tr>
                    <tr bgcolor="orange">
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Precio</td>
                        <td>Cantidad</td>
                        <td>Monto</td>
                        <td>Eliminar</td>
                    </tr>

                    <%                        double total = 0;
                        ArrayList<Cesta> lista = (ArrayList<Cesta>) session.getAttribute("carrito");
                        if (lista != null) {
                            for (Cesta d : lista) {
                    %>
                    <tr>
                        <td><%=d.getId()%></td>
                        <td><%=d.getNombre()%></td>
                        <td><%=d.getPrecio()%></td>
                        <td><a href="ServletProd?op=menos&cod=<%=d.getId()%>&des=<%=d.getNombre()%>&pre=<%=d.getPrecio()%>" class="btn btn-danger">-</a>
                            <%=d.getCan()%>
                            <a href="ServletProd?op=mas&cod=<%=d.getId()%>&des=<%=d.getNombre()%>&pre=<%=d.getPrecio()%>" class="btn btn-primary">+</a> </td>
                        <td><%=d.getCan() * d.getPrecio()%></td>
                        <td class="text-center">
                            <input type="hidden" id="idp" value="<%=d.getId()%>">
                            <a href="ServletProd?op=Delete&idp=<%=d.getId()%>" class="btn btn-danger" id="btnDelete"><i class="fa-solid fa-trash"></i></a>

                        </td>
                    </tr>
                    <%

                                total = total + (d.getPrecio() * d.getCan());
                            }
                        }
                    %>
                    <tr>
                        <td align="right" colspan="5">Total</td>
                        <td><%=total%></td>
                    </tr>
                </table>

            </div> 
            <div class="container">
                <h4 align="center"><a href="dashboardcliente.jsp#menu" class="btn btn-success">
                        Seguir Comprando
                    </a> <a href="Compra.jsp" class="btn btn-primary">
                        Solicitar Por Delivery
                    </a></h4>    
            </div>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
