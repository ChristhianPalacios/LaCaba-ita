<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Beans.*" %>
<!--Verificacion de la sesion, ademas llamamos los datos de usuario(Cliente)-->
<%@page session="true" %>
<%
    String usuario = "";
    String email = "";
    String apellidos = "";
    String id = "";
    String direccion = "";
    String dni = "";
    HttpSession sesionOk = request.getSession();

    if (sesionOk.getAttribute("usuario") == null) {

%>
<jsp:forward page="index.jsp">
    <jsp:param name="msg2" value="Debe Iniciar Sesión obligatoriamente!"/>
</jsp:forward>

<%    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
        email = (String) sesionOk.getAttribute("email");
        apellidos = (String) sesionOk.getAttribute("apellidos");
        id = (String) sesionOk.getAttribute("id");
        direccion = (String) sesionOk.getAttribute("direccion");
        dni = (String) sesionOk.getAttribute("dni");
    }

%>
<!--Ademas restricciones para que no entren a la pagina defrente sin haber iniciado Sesion-->
<!--Fin de Session-Restricciones-Envio de Datos-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- Llamar a los estilos -->
        <link href="estilos/estilos1.css" rel="stylesheet">
    </head>

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
                    <li><a class="nav-link scrollto active" href="#header">Inicio</a></li>
                    <li><a class="nav-link scrollto" href="mispedidos.jsp">Mis pedidos</a></li>
                    <li><a class="nav-link scrollto" href="#menu">Menu</a></li>

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
        <!--Inicio de la Tabla y formulario de solicitar por delivery-->
        <h2 align="center">Solicitar Pedido Por Delivery</h2>
        <div class="container">
            <table class="table table-dark table-striped">
                <tr bgcolor="white">
                    <th colspan="5">Cesta de Productos</th>
                </tr>
                <tr bgcolor="orange">
                    <!--Estructura de la tabla -->
                    <td>Codigo</td><td>Nombre</td><td>Precio</td>
                    <td>Cantidad</td><td>Monto</td>
                </tr>
                <!--Datos dentro de la tabla: Creamos un Array List en el cual tendra los platillos seleccionados-->

                <%                        double total = 0;
                    ArrayList<Cesta> lista = (ArrayList<Cesta>) session.getAttribute("carrito");
                    if (lista != null) {
                        for (Cesta d : lista) {
                %>
                <tr>
                    <!--Ordenamos los datos que seran mostrados en la tabla-->
                    <td><%=d.getId()%></td>
                    <td><%=d.getNombre()%></td>
                    <td><%=d.getPrecio()%></td>
                    <!--En los botones direccionamos la accion en el servelt-->
                    <!--Boton de "-", con su accion que esta dentro del servlet-->
                    <td><a href="ServletProd?op=menos&cod=<%=d.getId()%>&des=<%=d.getNombre()%>&pre=<%=d.getPrecio()%>" class="btn btn-danger">-</a>
                        <%=d.getCan()%>
                        <!--Boton de "+", con su accion que esta dentro del servlet-->
                        <a href="ServletProd?op=mas&cod=<%=d.getId()%>&des=<%=d.getNombre()%>&pre=<%=d.getPrecio()%>" class="btn btn-primary">+</a> </td>
                    <!--Calcular el precio multiplicado con la nueva cantidad-->
                    <td><%=d.getCan() * d.getPrecio()%></td>
                </tr>
                <!--Cuando la direccion del "+" y "-" Cambien , se cambiara el precio-->
                <%
                            total = total + (d.getPrecio() * d.getCan());
                        }
                    }
                %>
                <!--Se Muestra el monto total ya con los calculos establecidos-->
                <tr>
                    <td align="right" colspan="4">Total</td>
                    <td><%=total%></td>
                </tr>
            </table>
                <!--Fin de la tabla-->
        </div> 
        <div class="container">
<!--            Inicio del Formulario-->
<!--            Codigo para establecer la hora y la fecha del dia-->
            <% LocalDateTime hora = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String fecha = (hora.format(formatter));%>
            <form  action="ServletPedidos">
<!--                Estructura del formulario-->
                <table class="table table-dark">
                    <tr>
                        <td>ID Cliente: </td> 
                        <td><input type="text" readonly="readonly" name="txtId" class="form-control" value="<%=id%>"></td>
                    </tr> 
                    <tr>
                        <td>Nombre y Apellido: </td> 
                        <td><input type="text" readonly="readonly" name="txtNombre" class="form-control" value="<%=usuario%> <%=apellidos%>"></td>
                    </tr> 
                    <tr>
                        <td>DNI:</td> 
                        <td><input type="text" readonly="readonly" name="txtDNI" class="form-control" value="<%=dni%>"></td>
                    </tr>
                    <tr>
                        <td>Detalle Adicional del Pedido: </td> 
                        <td><textarea type="text"  name="txtDetalleA" class="form-control" placeholder="Parte pecho/Gaseosa helada/etc"></textarea>
                    </tr> 
                    <tr>
                        <td>Direccion: </td> 
                        <td><input type="text" readonly="readonly" name="txtDire" class="form-control" value="<%=direccion%>"></td>
                    </tr> 
                    <tr>
                        <td>Metodo de Pago: </td> 
                        <td><input type="text" readonly="readonly"  name="txtMetodoP" class="form-control" Value="Efectivo"></td>
                    </tr> <tr>
                        <td>Detalle de pago: </td> 
                        <td><input type="text" name="txtDetalleP" class="form-control" placeholder="Detalle el metodo de pago"></td>
                    </tr>
                    <tr>
                        <td>Fecha de Pedido: </td> 
                        <td><input type="datetime" readonly="readonly" name="txtFecha" class="form-control" value="<%=fecha%>"></td>
                    </tr>
                    <tr>
                        <td><input type="Submit" name="btn" class="form-control btn-why"  value="Terminar Solicitud"></td>
                    </tr>
                </table> 
<!--                    botones invicibles para enviar el monto total y para laaccion "insertar" que estara en el servlet-->
                <input type="hidden" name="total" value="<%=total%>">

                <input type="hidden" name="op" value="insertar">  
<!--                Fin de formulario -->
            </form> 
<!--                direccionamiento de volver a la cesta para seguir comprando platillos-->
            <h4 align="center"><a href="Cesta.jsp" class="btn btn-success">
                    Volver a Cesta
            </h4>    
        </div>

</html>
