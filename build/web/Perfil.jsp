<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControladorProductos"%>
<%@page import="Beans.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    String usuario = "";
    String email = "";
    String apellidos = "";
    String numero = "";
    String id = "";
    String direccion = "";
    String clave = "";
    String dni = "";
    HttpSession sesionOk = request.getSession();

    if (sesionOk.getAttribute("dni") == null) {

%>
<jsp:forward page="index.jsp">
    <jsp:param name="msg2" value="Debe Iniciar Sesión obligatoriamente!"/>
</jsp:forward>

<%    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
        email = (String) sesionOk.getAttribute("email");
        apellidos = (String) sesionOk.getAttribute("apellidos");
        numero = (String) sesionOk.getAttribute("numero");
        id = (String) sesionOk.getAttribute("id");
        direccion = (String) sesionOk.getAttribute("direccion");
        clave = (String) sesionOk.getAttribute("clave");
        dni = (String) sesionOk.getAttribute("dni");

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil 👫</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <style>
            body{
                background-image: url(img/banner.jpg);
                background:linear-gradient (to right,#ffa751,#ffe259);
            }
            .bg{
                background: url(img/fondo2.jpg);


                background-position: center center;

            }
        </style>
    </head>
    <body>

        <!-- Encabezado -->

        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class ="navbar-brand" href="dashboardcliente.jsp"><img src="img/LOGOPRUEBA1.png" alt="alt"/> </a>
            </div>
        </nav>

        <div class="container w-75 bg-primary mt-5 rounded shadow">
            <div class="row align-items-stretch ">
                <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

                </div>

                <div class="col bg-white p-5 rounded-end">
                    <div class="text-end">
                        <img src="img/LOGOPRUEBA1.png" width="70" alt=""/>
                    </div>
                    <h2 class="fow-bold text-center py-5">Hola! Bienvenido a tu Perfil</h2>

                    <form action="ServletClientes">
                        <h5>
                            <center>
                                <%                                if (request.getAttribute("msg22") != null) {
                                        String msg = request.getAttribute("msg22").toString();
                                %>
                                <div class="alert alert-info" role="alert">
                                    <%=msg%>
                                </div>
                                <%
                                    }
                                %>
                            </center>
                        </h5>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">ID:</label>
                            <input type="text" name="txtId" value="<%=id%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">Nombre:</label>
                            <input type="text" name="txtNom" value="<%=usuario%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">Apellido:</label>
                            <input type="text" name="txtApellido" value="<%=apellidos%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">Correo:</label>
                            <input type="text" name="txtCorreo" value="<%=email%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">Telefono:</label>
                            <input type="text" name="txtFono" value="<%=numero%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">Dirección:</label>
                            <input type="text" name="txtDirec" value="<%=direccion%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">DNI:</label>
                            <input type="text" name="txtDNI" value="<%=dni%>" class="form-control" readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label for="usuario" class="form-label">Password:</label>
                            <input type="password" name="txtContra" value="<%=clave%>" class="form-control" readonly="readonly">
                        </div>
                        <!--                        <div class="mb-4">
                                                    <input type="checkbox" name="connected" class="form-check-input">
                                                    <label for="connected" class="form-check-label">Mantenerme Conectado</label>
                                                </div>-->

                        <div class="mb-4">

                            <button class="btn btn-dark"><a href="ServletClientes?op=ConsultaPerfil&id=<%=id%>" style="color: #FFFFFF;"> 
                                    Editar Perfil</a></button> 
                        </div>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
