<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion 🔒</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper yes -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <style>
            body{
                background-image: url(img/banner.jpg);
                background:linear-gradient (to right,#ffa751,#ffe259);
            }
            .bg{
                background: url(img/about-main.jpg);


                background-position: center center;

            }
            p{
                color: red;
            }
        </style>
    </head>
    <body>

        <!-- Encabezado -->

        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class ="navbar-brand" href="index.html"><img src="img/LOGOPRUEBA1.png" alt="alt"/> </a>
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
                    <h2 class="fow-bold text-center py-5">Hola! Bienvenido</h2>
                    <form action="ServletCientes">
                        <h5>
                            <%
                                if (request.getAttribute("msg6") != null) {
                                    String msg = request.getAttribute("msg6").toString();
                            %>
                            <div class="alert alert-info" role="alert">
                                <i class="fa-solid fa-check-to-slot"></i> <%=msg%>
                            </div>
                            <%
                                }
                            %>
                        </h5>
                    </form>
                    <form action="ServletLogin">

                        <div class="mb-4">
                            <label for="usuario" class="form-label">DNI:</label>
                            <input type="text" name="txtDNI" class=" form-control"  placeholder="Ingrese DNI" id="DNI">
                            <p id="validacion"></p>
                        </div>
                        <div class="mb-4">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" name="txtContra" placeholder="**************" class="form-control" required="required">
                        </div>
                        <!--                        <div class="mb-4">
                                                    <input type="checkbox" name="connected" class="form-check-input">
                                                    <label for="connected" class="form-check-label">Mantenerme Conectado</label>
                                                </div>-->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                        </div>
                        <br>
                        <h5>
                            <%
                                if (request.getAttribute("msg") != null) {
                                    String msg = request.getAttribute("msg").toString();
                            %>
                            <div class="alert alert-danger" role="alert">
                                <i class="fa-solid fa-triangle-exclamation"></i> <%=msg%>
                            </div>
                            <%
                                }
                            %>
                        </h5>

                        <h6>
                            <center>
                                <%
                                    if (request.getParameter("msg2") != null) {
                                        String msg = request.getParameter("msg2").toString();
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <i class="fa-solid fa-triangle-exclamation"></i> <%=msg%>
                                </div>
                                <%
                                    }
                                %>
                            </center>
                        </h6>

                        <div class="my-3">
                            <span>No tienes cuenta?<a href="nuevocli.jsp">Regístrate</a></span><br>
                            <br>
                            <span>¿Eres administrador?<a href="indexadmin.jsp">Ingresa</a></span><br>

                        </div>
                        <input type="hidden" name="op" value="login"/>

                    </form>


                    <!-- Redes Sociales -->
                    <div class="container w-100 my-5">
                        <div class="row text-center">
                            <div class="col-12">Siguenos en nuestras Redes!!</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <button class="btn btn-outline-primary w-100 my-1">
                                    <div class="row align-items-center">
                                        <div class="col-2 d-none d-md-block">

                                            <img src="img/fb.png" width="32"  alt="alt"/>
                                        </div>
                                        <div class="col-12 col-md-10 text-center">
                                            <a href="https://es-la.facebook.com/pollosalabrasaLaCabanita/">Facebook</a>
                                        </div>
                                    </div>
                                </button>
                            </div>
                            <div class="col">
                                <button class="btn btn-outline-danger w-100 my-1">
                                    <div class="row align-items-center">
                                        <div class="col-2 d-none d-md-block">
                                            <img src="img/insta.png" width="32"  alt="alt"/>
                                        </div>
                                        <div class="col-12 col-md-10 text-center">
                                            <a href="https://www.instagram.com/pardoschicken/">Instagram</a>
                                        </div>
                                    </div>
                                </button>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
 <script src="js/Restricciones.js" type="text/javascript"></script>
      
    </body>
</html>
