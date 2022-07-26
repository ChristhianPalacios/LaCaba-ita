<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControladorProductos"%>
<%@page import="Beans.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Verificacion de la sesion, ademas llamamos los datos de usuario(Cliente)-->
<%@page session="true"%>
<%
    String usuario = "";
    String email = "";
    String apellidos = "";
    String numero = "";
    String id = "";
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
        dni = (String) sesionOk.getAttribute("dni");
    }
    Controlador.ControladorProductos cp = new ControladorProductos();
%>
<!--Ademas restricciones para que no entren a la pagina defrente sin haber iniciado Sesion-->
<!--Fin de Session-Restricciones-Envio de Datos-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> 🥤 La Cabañita 🍗</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <!-- Llamar a los estilos -->
        <script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>

        <link href="estilos/estilos1.css" rel="stylesheet">
    </head>
    <body>
        <!-- ======= Encabezamiento ======= -->
        <header id="header" class="fixed-top d-flex align-items-cente">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href=""> <img src="img/LOGOPRUEBA1.png" alt="LOGO"/> </a></h1>


                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="#header">Inicio</a></li>
                        <li><a class="nav-link scrollto" href="#about">Nosotros</a></li>
                        <li><a class="nav-link scrollto" href="#menu">Menu</a></li>
                        <li><a class="nav-link scrollto" href="#chefs">Nuestro Equipo</a></li>
                        <li><a class="nav-link scrollto" href="#contact">Contáctanos</a></li>
                     
                     
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Bienvenido <%=usuario%>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="Perfil.jsp">Perfil<i class="fa-solid fa-id-badge"></i></a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="CerrarSesion.jsp">Cerrar Sesion<i class="fa-solid fa-door-open"></i></a></li>
                            </ul>
                        </li>

                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->
                <a href="Cesta.jsp"> <img class="nav-item"src="img/cart.png" alt="carrito"> </a>


            </div>
        </header>
        <!-- FIN ENCABEZAMIENTO -->
        <!-- ======= imagenen de presentación ======= -->

        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/ESLOGAN LA CABAÑITAAA.gif" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h1 id="titulo">BIENVENIDO A  <span> POLLOS Y PARRILAS "LA CABAÑITA"🍗</span></h1>
                        <h2> 🥰 ¡Cena con tus familiares!❤️</h2>
                    </div>
                </div>
            </div>
        </div>
        <!--FIN presentacion -->


        <!-- ======= Acerca de la polleria ======= -->

        <section id="about" class="d-flex align-items-center">
            <div class="container position-relative text-center text-lg-start">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        <h1>ACERCA DE  <span> NOSOTROS </span></h1>

                        <p>Una sociedad Con fines de lucro fundada en el año 2015, a través de la experiencia de muchos años de trabajo, esfuerzo y dedicación. Sin embargo, sus orígenes provienen de unas recetas familiares que dejaron su legado en sus más preciados tesoros. </p>
                        <p>Desde entonces, sus fundadores y trabajadores se propusieron la firme tarea de hacer de 'LA CABAÑITA' el mejor restaurante 🍽️ de pollos del país.
                            Muy pronto, el público  fue identificando a 'LA CABAÑITA' por su ambiente acogedor, su eficiente servicio y, sobre todo, la exquisitez y calidad del sabor de todos sus productos. 
                        </p>
                        <p>'LA CABAÑITA' sigue manteniendo esa filosofía de satisfacer plenamente a sus clientes(incluso en estos tiempos de cuarentena) con exquisitos platos en base a pollos,que se
                            complementan con deliciosos postres 🍨 y exquisitas bebidas 🥤.</p>

                        <div class="btns" >
                            <a href="#why-us" class="btn-why animated fadeInUp scrollto">¿PORQUE NOSOTROS ?</a>
                            <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">FORMULARIO DE RESERVA</a>
                        </div>
                    </div>
                    <div class="col-lg-6  col-sm-12 col-xs-12" >
                        <div class="about-video" >
                            <iframe src="https://www.facebook.com/plugins/video.php?height=314&href=https%3A%2F%2Fwww.facebook.com%2FpollosalabrasaLaCabanita%2Fvideos%2F976380112996488%2F&show_text=false&width=560&t=0" width="560" height="360"
                                    style="border:none;overflow:hidden; max-width: 100%;" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share" allowFullScreen="true"></iframe>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- FIN ACERCA DE  -->

        <!-- ======= SECCIÓN por qué nosotros  ======= -->

        <section id="why-us" class="why-us">
            <div class="container">

                <div class="section-title">
                    <h2>¿Porque nosotros?</h2>
                    <p>¿Porque elegir nuestro restaurante?</p>
                </div>

                <div class="row">

                    <div class="col-lg-4">
                        <div class="box" >
                            <img src="img/pollo_gaseosa.jpg" alt="picarones"/>
                            <span>01</span>
                            <h4>⭐GRAN SAZON !!⭐</h4>
                            <p>Más de 2️⃣0️⃣ años de experiencia en el arte culinario🍽️. </p>
                        </div>
                    </div>

                    <div class="col-lg-4 mt-4 mt-lg-0">
                        <div class="box" >
                            <img src="img/pollo_anticucho.jpg" alt="menu2"/>
                            <span>02</span>
                            <h4>⭐VARIEDAD DE PLATOS⭐</h4>
                            <p>Desde nuestro clasico y delicioso, Pollo a la Brasa 🤤, hasta nuestra gran carta de parrillas 🥩 y ricos postres 🍰.</p>
                        </div>
                    </div>

                    <div class="col-lg-4 mt-4 mt-lg-0">
                        <div class="box">
                            <img src="img/trabajador.jpg" alt="menu4"/>
                            <span>03</span>
                            <h4> ⭐GRAN ATENCION AL CLIENTE⭐</h4>
                            <p>Trato cordial desde el primer contacto con nosotros 🤗.</p>
                        </div>
                    </div>

                </div>

            </div>
        </section>
        <!-- FIN POR QUE NOSOTROS-->

        <!-- ======= Sección Menu  ======= -->
        <style>
            .filterDiv {
                display: none;
            }
            .show {
                display: block;
            }
        </style>
        <section id="menu" class="menu section-bg">
            <div class="container" data-aos="fade-up">
                <div class="section-title">
                    <h2>Menu</h2>
                    <p>Platos deliciosos </p>
                </div>

                <div class="row">
                    <div class="col-lg-12 d-flex justify-content-center">
                        <div id="menu-flters">

                            <button class="btn active" onclick="filterSelection('all')"> Todo</button>
                            <button class="btn" onclick="filterSelection('10')"> Criollos</button>
                            <button class="btn" onclick="filterSelection('9')"> Parrillitas</button>
                            <button class="btn" onclick="filterSelection('7')"> Pollos</button>
                            <button class="btn" onclick="filterSelection('8')"> Ensaladas</button> 
                            <button class="btn" onclick="filterSelection('11')"> Cerdo-res-pollo</button>
                            <button class="btn" onclick="filterSelection('3')"> Bebidas</button>
                            <button class="btn" onclick="filterSelection('5')"> Postres</button>
                            <button class="btn" onclick="filterSelection('12')"> Guarniciones</button>
                            <br>
                            <br>
                            <p style="color: red;"><strong>🔔 Estimado Cliente, Para las Seccion "Parrillitas" hay un Stock Limitado</strong></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row menu-container">
                <%= cp.getProductosWithPrecio()%>
            </div>
            <!--            Implemetnamos JS para direccionar las secciones del menu-->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
            <script>
                $( document ).ready(function() {
                    filterSelection("all");
                });
                
                function filterSelection(c) {
                    var x, i;
                    x = document.getElementsByClassName("filterDiv");
                    if (c === "all")
                        c = "";
                    for (i = 0; i < x.length; i++) {
                        w3RemoveClass(x[i], "show");
                        if (x[i].className.indexOf(c) > -1)
                            w3AddClass(x[i], "show");
                    }
                }

                function w3AddClass(element, name) {
                    var i, arr1, arr2;
                    arr1 = element.className.split(" ");
                    arr2 = name.split(" ");
                    for (i = 0; i < arr2.length; i++) {
                        if (arr1.indexOf(arr2[i]) === -1) {
                            element.className += " " + arr2[i];
                        }
                    }
                }

                function w3RemoveClass(element, name) {
                    var i, arr1, arr2;
                    arr1 = element.className.split(" ");
                    arr2 = name.split(" ");
                    for (i = 0; i < arr2.length; i++) {
                        while (arr1.indexOf(arr2[i]) > -1) {
                            arr1.splice(arr1.indexOf(arr2[i]), 1);
                        }
                    }
                    element.className = arr1.join(" ");
                }

                // Add active class to the current button (highlight it)
                var btnContainer = document.getElementById("menu-flters");
                var btns = btnContainer.getElementsByClassName("btn");
                for (var i = 0; i < btns.length; i++) {
                    btns[i].addEventListener("click", function () {
                        var current = document.getElementsByClassName("active");
                        current[0].className = current[0].className.replace(" active", "");
                        this.className += " active";
                    });
                }
            </script>
        </div>
    </section>
    <!-- FIN MENU -->

    <!-- ======= Seccion chefs ======= -->
    <section id="chefs" class="chefs">
        <div class="container">

            <div class="section-title">
                <h2>Chefs </h2>
                <p>Nuestros Chefs Profesionales 👩🏻‍🍳</p>
            </div>

            <div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="member">
                        <img src="img/chef1.jpg" class="img-fluid" alt="">
                        <div class="member-info">
                            <div class="member-info-content">
                                <h4>NIcole Cahuana</h4>
                            </div>
                        </div>
                    </div>
                    <div class="member-info-content">
                        <span>Chef Pasteler</span>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member">
                        <img src="img/chef2.jpg" class="img-fluid" alt="">

                        <div class="member-info">
                            <div class="member-info-content">
                                <h4>Christhian Palacios</h4>

                            </div>
                        </div>
                    </div>
                    <div class="member-info-content">
                        <span>Jefe De Cocina</span>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member">
                        <img src="img/chef3.jpg" class="img-fluid" alt="">

                        <div class="member-info">
                            <div class="member-info-content">
                                <h4>Kevin Lima</h4>

                            </div>
                        </div>
                    </div>
                    <div class="member-info-content">

                        <span>Cocinero</span>
                    </div>
                </div>
                <center>
                    <div class="col-lg-4 col-md-6">
                        <div class="member">

                            <img src="img/ROSMERY.webp" class="img-fluid" alt="">

                            <div class="member-info">
                                <div class="member-info-content">
                                    <h4>Rosmery Fabian</h4>

                                </div>
                            </div>
                        </div>
                        <div class="member-info-content">
                            <span>Jefe De Cocina</span>
                        </div>
                    </div>
                </center>
            </div>

        </div>
    </section>
    <!--FIN CHEFS -->

    <!-- ======= Seccion contacto======= -->

    <section id="contact" class="contact">
        <div class="container">

            <div class="section-title">
                <h2>Contacto</h2>
                <p>Contactános ☎️</p>
            </div>
        </div>

        <div>
            <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3899.292864390176!2d-76.9269813!3d-12.2284388!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105bb0d4d2d1f15%3A0x66c46acd62f48639!2sPolleria%20Caba%C3%B1ita!5e0!3m2!1ses-419!2spe!4v1656015116693!5m2!1ses-419!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> 
        </div>

        <div class="container">

            <div class="row mt-5">


                <div class="col-lg-4">
                    <div class="info">
                        <div class="address">
                            <i class="bi bi-geo-alt"></i>
                            <h4>Locación:</h4>
                            <p>AV. 200 MILLAS 1RA ETAPA MZA. N1 LOTE. 10 AGRU PACHACAMAC SECT 4 (OVALO LAS PALOMAS ESQUINA PARQUE HUASCAR)</p>
                        </div>

                        <div class="open-hours">
                            <i class="bi bi-clock"></i>
                            <h4>Horario de Atención:</h4>
                            <p>
                                Lunes-Domingo<br>
                                9:00 AM - 11:30 PM
                            </p>
                        </div>

                        <div class="email">
                            <i class="bi bi-envelope"></i>
                            <h4>Email:</h4>
                            <p>polleriasyparrillaslacabañita10@hotmail.com</p>
                        </div>

                        <div class="phone">
                            <i class="bi bi-phone"></i>
                            <h4>Números de contacto </h4>
                            <p>960309336  </p>
                            <p>(01)2632825 & (01)2639014 </p>
                        </div>

                    </div>

                </div>

                <div class="col-lg-8 mt-5 mt-lg-0">

                    <form id="contact2" action="ServletContacto" method="get" class="php-email-form">

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input type="text" name="txtname"  readonly="readonly" class="form-control" id="name" value="<%=usuario%>" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="text" class="form-control"  readonly="readonly" name="txtApellido" id="email" value="<%=apellidos%>" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="text" class="form-control"  readonly="readonly" name="txtFono" id="email" value="<%=numero%>" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="email" class="form-control "  readonly="readonly" name="txtCorreo" id="email" value="<%=email%>" required>
                            </div>
                            <label class="col-md-6 form-group mt-3 mt-md-0">Motivos de Contacto</label> <br>
                            <select name="txtMotivo" id="" required> 
                                <option value="">--Selecione--</option>
                                <option selected">Reclamos</option>
                                <option selected">Sugerencias</option>
                                <option selected">Solicitudes</option>
                            </select>
                        </div>
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="txtMnesaje" rows="8" placeholder="Mensaje" required></textarea>
                        </div>
                        <input type="submit" name="btn" value="Enviar Mensaje" class="btn btn-dark"/>
                        <input type="hidden" name="ct" value="insertar2"/>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- FIN CONTACTO -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-info">
                            <h3>ENCUENTRANOS EN 📍: </h3>

                            <h4> AV. 200 MILLAS 1RA ETAPA MZA. N1 LOTE. 10 AGRU PACHACAMAC SECT 4<br>
                                (OVALO LAS PALOMAS ESQUINA PARQUE HUASCAR) <br><br>  </h4>


                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-info">
                            <h3> 📞CONTACTÁNOS:</h3>
                            <p>
                                <strong>Números de contacto:</strong> 957 351 983
                            <p> (01)2632825 & (01)2639014 </p>
                            <br>
                            <strong>Email:</strong> polleriasyparrillaslacabañita@hotmail.com<br>

                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-info">
                            <h3> ⏲️HORARIOS DE ATENCIÓN: </h3>
                            <p>
                            <h4> Lunes-Domingo   <br>
                                9:00 AM - 11:30 PM <br><br> </h4>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-info">
                            <h3>REDES SOCIALES: </h3>

                            <li><a href="https://www.facebook.com/Pollerias-y-Parrilladas-San-Martin-146274185455949/?ref=page_internal">
                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAA/ElEQVRIS+2W3Q2CQAzHW8IeOoIU3tUNXMFJxEl0A+ME6juUGwE2cABCzRk/CFGPU9AQucdL09/1348rwo8O/ogL3QUno9FQEAdX5VAk85RKTUq+HXESBBMpihUADCuQAzFPWgEnvj8Tkc0T5+2BmUhLeZP3KxFfJN5VYQKw13cOQOoxrxuX+oHMGTFX82zi2rdTTBQiwKLkuVZOqy+xrur/ADORLpyxMXHaAHFLcTwz2daS2gYsAEufOfw6GAHmjbWTTcToOFMvis49/erUkrrs4D+quo+4H5l1No7+k+jOANHrLLjufePI86OnlDKNyI9zbAt4Zm8tdefBJ0qwjR+3S7WZAAAAAElFTkSuQmCC"/> </a>
                                Pollerias y Parrilladas LA CABAÑITA </li>
                            <li><a href="https://www.instagram.com/polleriasanm/">
                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACdElEQVRIS9WWTVLbQBCFXzfsIScInABp5H1wpZIsY04AN4g5QcgNzAkCJ4izTeWH7NFI3MD7LGLvTXeqpySVbEuxDKkymZXL6pmvu+dNdxO2tGhLXDxtcBZF+0p01CU7pHoX5/l0nW1rxFkUHQjzewKOARysO2jp+0SBGxb5EOf5pGlvIziLokiZfwDYLzbNAOQd4RGAvcJ2SiL9OM9X9q6ALVJlzgKU6DPd3w/bvG5zJJyxszOC6lsABo+Xz1gB+zi+AtGpQV2aDjpGWZnlSdIXEXZZ9s0nyTjAVa9dlp3Vz1oFO2d38pxEDjeNNEBVvxuAmF9jPv9VZG/ivD9sBQf1Mv8GcOe8t7taWXb/YD5V1fCdiHKIXJqTPo5fguir/c9Eb6I0/eKd02An8qyu9oWIs17vWEVMVD+d96bmhZU6NyLgXYtKR7H351mv94pUyaBm550zYR0Rcz++vb0p93YGL0BVr4l5bIeoyCBown4Dl4n3w7pj3jmDvXgQuHhepnRL7UmcpgFarixJBqr6qUjpgjYeBa6ibVBnCS9fw3LUjwJXmxuiraJ27kyBj8v6+D/BW0v11sRl91h/TgpcsUhQtjAPCAjl8J8/p1JAfysgTdDuBaQsmUS5S9O4pWRanx4SEEqmAjmLjNrqeqeSWXj44Cax7GhNGzPnfdnbg1lrW1RgnHh/0hR11/82aovFIGCFfc/gLHK+aXu0SIuxyfr5jESitYOARVOkyIp7NcJAtdvoQ2R3X41MxDyod6XG7rRQ+G18IboAkXldOtA1yzOojkn1YqNhr0EkB9jd7TZpzufTpuFu+cynPdB3ze8mdluL+A8vKtguJE1b4AAAAABJRU5ErkJggg=="/></a>
                                @pollerialacabañita</li>
                        </div>
                    </div>
                </div>
            </div>


    </footer>
    <!-- FIN FOOTER -->
        <center>
            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><span>LA CABAÑITA</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                </div>
            </div>
        </center>


</body>
</html>
