<%@page import="Servlets.ServletPedidos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.PedidosBeans"%>
<%@page import="Utils.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Verificacion de la sesion, ademas llamamos los datos de usuario(Cliente)-->

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
<!--Ademas restricciones para que no entren a la pagina defrente sin haber iniciado Sesion-->
<!--Fin de Session-Restricciones-Envio de Datos-->
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
<!--Mensaje de confirmacion-->
        <h1>

            <%      if (request.getAttribute("msg4") != null) {
                    String msg = request.getAttribute("msg4").toString();
            %>
            <center>
                <div class="alert alert-secondary" role="alert">
                    <i class="fa-solid fa-circle-check"></i> <%=msg%>
                </div>
            </center>
            <%
                }
            %>
        </h1>
<!--        Mensaje de confirmacion-->
        <h2>
            <%
                if (request.getAttribute("msg5") != null) {
                    String msg = request.getAttribute("msg5").toString();
            %>
            <div class="alert" role="alert">
                👨‍💻 <%=msg%>
            </div>
            <%
                }
            %>
        </h2>

        <div class=" container align-items-center">
            <h2 align="center">Mis Pedidos</h2
<!--           Se muestra su lista con el pedido agregado reciente mente por el cliente-->
            <%
                PreparedStatement ps;
                int idclienten = Integer.parseInt(id);
                ResultSet rs;
//                ps = ConexionDB.getConexion().prepareStatement("Select * from pedidos where id_cliente like " + "'%" + request.getAttribute("idcliente") + "%'");
                ps = ConexionDB.getConexion().prepareStatement("Select * from pedido where id_cliente like " + "'%" + idclienten + "%'");
                rs = ps.executeQuery();
            %>
            <div class="container">
                <table class="table table-dark table-striped">
<!--                    ordenamos la tabla-->
                    <tr bgcolor="lightgray">
                        <td>Id</td>
                        <td>IdCliente</td>
                        <td>direccion</td>
                        <td>Total</td>
                        <td>Estado</td>
                        <td>Creado</td>
                        <td>Metodo Pago</td>
                        <td>Detalle Pago</td>
                        <td>Acción</td>
                    </tr>
<!--                    Damos restricciones para los estado del pedido-->
                    <%
                        while (rs.next()) {
                            int estado = rs.getInt("id_estado");
                            String estadoTexto = "SIN ESTADO";
                            if (estado == 1) {
                                estadoTexto = "PENDIENTE";
                            } else if (estado == 2) {
                                estadoTexto = "ENVIADO";
                            } else if (estado == 3) {
                                estadoTexto = "FINALIZADO";
                            } else {
                                estadoTexto = "CANCELADO";
                            }
                            
                    %>  
<!--                    Ordenamos los datos-->
                    <tr>
                        
                        <td><%=rs.getInt("id")%></td>
                        <td><%=rs.getInt("id_cliente")%></td>
                        <td><%=rs.getString("direccion")%></td>
                        <td><%=rs.getDouble("total")%></td>
                        <td><%= estadoTexto%></td>


                        <td><%=rs.getString("creado")%></td>
                        <td><%=rs.getString("metodo_pago")%></td>
                        <td><%=rs.getString("detalle_pago")%></td>
<!--                        Direccionamiento de para ver el detalle del pedido-->
                        <td><a class="botona" href="ServletDetallePedido?idPedido=<%=rs.getInt("id")%>">Ver detalle</a></td>
                    </tr>
                    <%}%>

                </table>  
<!--                    Fin-->
            </div>
        </div>
    </body>
</html>
