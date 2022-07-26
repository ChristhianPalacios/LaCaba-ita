<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos/dashboard.css">
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <style>
            #content {
                clear: both;
                background: #e5e5e5;
                padding: 0;
                overflow-y: scroll;
                width: 1265px;
                height: 1000px;
                border: 0;
            }
        </style>

    </head>
    <!--Encabesado-->
    <body>
        <div class="container-fluid">
            <div class="row justify-content-center align-content-center">
                <div class="col-8 barra">
                    <h4 class="text-light"><img src="img/LOGOPRUEBA1.png" alt="LOGO"/> </h4>

                </div>
                <div class="col-4 text-right barra">
                    <ul class="navbar-nav mr-auto">
                        <li>
                            <a href="#" class="px-3 text-light perfil dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido <%=usuario%><i class="fas fa-user-circle user"></i></a>

                            <div class="dropdown-menu" aria-labelledby="navbar-dropdown">
                                <a class="dropdown-item menuperfil cerrar" href="CerrarSesion.jsp"><i class="fas fa-sign-out-alt m-1"></i>Salir
                                </a>
                            </div>
                            </div>
                            </div>
                            </div>
                            <!--Fin encabezado-->
                            <div class="container-fluid">
                                <div class="row">

                                    <div class="barra-lateral col col-sm-auto">
                                        <nav class="menu d-flex d-sm-block justify-content-center flex-wrap">
                                            <a href="#"><i class="fas fa-home"></i><span>Inicio</span></a>
<!--                                            Vistas del dashboard-->
                                            <div id="menu5" class="menu">  <a href="#"> <i class="fas fa-clipboard"></i><span>Perfil</span></a></div>
                                            <div id="menu9" class="menu"><a href="#"><i class="fas fa-solid fa-phone"></i><span>Contactanos</span></a></div>
                                            <div id="menu4" class="menu">  <a href="#"> <i class="fas fa-users-cog"></i><span>Administrar Clientes</span></a></div>
                                            
                                            <div id="menu2" class="menu"> <a href="#"> <i class="fas fa-clipboard"></i><span>Registro de de Productos</span></a></div>
                                            <div id="menu3" class="menu"><a href="#"><i class="fas fa-tasks"></i><span>Administrar Productos</span></a></div>
                                            <div id="menu6" class="menu"><a href="#"><i class="fas fa-file-medical-alt"></i><span>Listado de Pedidos</span></a></div>
                                            <div id="menu7" class="menu"><a href="#"><i class="fas fa-file-medical-alt"></i><span>Detalles de Pedidos</span></a></div>


                                        </nav>
                                    </div>
                                    <iframe id="content" src=""></iframe>
                                </div>
                            </div>
<!--                            Inicio de JS para las direcciones y acciones para las paginas-->
                            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
                            <script>
                                $(document).ready(function (e) {
                                    $('#menu1').on('click', function () {

                                        $('#content').attr('src', 'ServletProd?op=listar');
                                    });
                                    $('#menu2').on('click', function () {
                                        $('#content').attr('src', 'vistas/nuevoprod.jsp');

                                    });
                                    $('#menu3').on('click', function () {
                                        $('#content').attr('src', 'ServletProd?op=listar');
                                    });

                                    $('#menu4').on('click', function () {
                                        $('#content').attr('src', 'ServletClientes?op=listar');

                                    });
                                    $('#menu5').on('click', function () {
                                        $('#content').attr('src', 'ServletAdmin?op=listar');
                                    });
                                    $('#menu6').on('click', function () {
                                        $('#content').attr('src', 'ServletPedidos?op=listar');
                                    });
                                    $('#menu7').on('click', function () {
                                        $('#content').attr('src', 'ServletDetalle?op=listar');
                                    });
                                    $('#menu9').on('click', function () {

                                        $('#content').attr('src', 'ServletAdmin?op=ListarContactanos');
                                    });
                                });

                            </script>
<!--                            Fin de JS-->
                            </body>
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
                            <script src="https://kit.fontawesome.com/646c794df3.js"></script>
                            </body>

                            </html>