<%@page import="Beans.PedidosBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.view.JasperDesignViewer" %>
<%@page import="javax.servlet.ServletResponse" %>
<%@page import="Utils.ConexionDB" %>
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

<script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <h2 align="center">Listado de Pedidos</h2>
         <br>
    <center>
<!--        Detallamos algunos datos de estados-->
        <div class="row align-items-start">

            <div class="col">
                1: Pendiente
            </div>
            <div class="col">
                2: Enviado
            </div>
            <div class="col">
                3: Finalizado
            </div>
            <div class="col">
                4: Cancelado
            </div>
          

        </div>
        <br>
        <div>
<!--            Direccionamiento para el PDF-->
            <a href="reportespdf.jsp" class="btn btn-danger"> Generar PDF 📑</a></div>
    </center>
    <br>
     
    <div class="container">

        <table class="table">
<!--            Estructura de la tabla-->
            <tr bgcolor="lightgray">
                <td>Id</td>
                <td>Nombre</td>
                <td>DNI</td>
                <td>direccion</td>
                <td>Total</td>
                <td>Estado</td>
                <td>Creado</td>
                <td>Detalle del Pedido</td>
                <td>Detalle Pago</td>
                <!--<td>Detalle Pedido</td>-->
                <td>Eliminar</td>
                <td>Editar</td>
            </tr>
<!--ArrayList que almacena los datos-->
            <%
                ArrayList<PedidosBeans> lista
                        = (ArrayList<PedidosBeans>) request.getAttribute("lista");
                for (int i = 0; i < lista.size(); i++) {
                    PedidosBeans em = lista.get(i);
            %>
            <tr>
<!--                Ordenamos los datos-->
                <td><%=em.getId()%></td>
                <td><%=em.getNombreCliente()%></td>
                <td><%=em.getDni() %></td>
                <td><%=em.getDireccion()%></td>
                <td><%=em.getTotal()%></td>
                <td><%=em.getIdEstado()%></td>
                <td><%=em.getCreado()%></td>
                <td><%=em.getDetalleAdicional() %></td>
                <td><%=em.getDetallePago()%></td>
                <!--<td></td>-->
                <td>
<!--                    Botones con sus respectivos acciones que estan en el servlet-->
                    <a href="ServletPedidos?op=eliminar&id=<%=em.getId()%>">
                        <i class='bx bxs-trash bx-sm bx-border-circle bx-burst-hover' style='color:#ff0000'></i> </a>

                </td> <td>
                    <a href="ServletPedidos?op=consultarId&id=<%=em.getId()%>">  
                        <i class='bx bxs-pencil bx-sm bx-border-circle bx-burst-hover' style='color:#2ac903'></i></a>


                </td>
            </tr>
            <%
                }
            %>
        </table>
<!--        Fin de la tabla-->

    </div>

</body>
</html>
