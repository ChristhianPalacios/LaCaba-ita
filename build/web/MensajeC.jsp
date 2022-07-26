<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Envio de Mensaje 💬</title>
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
                background: url(img/LOGOTIPO.png);


                background-position: center center;

            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class ="navbar-brand" href="index.html"><img src="img/LOGOPRUEBA1.png" alt="alt"/> </a>
            </div>
        </nav>

        <div class="container w-75 bg-primary mt-5 rounded shadow">
            <div class="row align-items-stretch ">
                <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

                </div>
                <!--Imagen del Mnesaje de confirmacion-->
                <div class="col bg-white p-5 rounded-end">
                    <div class="text-end">
                        <img src="img/LOGOPRUEBA1.png" width="70" alt=""/>
                    </div>
                    <h2 class="fow-bold text-center py-5">Gracias Por el Mensaje! 💪🏼</h2>

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <a href="index.html" type="button" class="btn btn-outline-warning"><i class="fa-solid fa-arrow-left"></i> Pagina Principal</a>
                        
                    </div>


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


    </body>
</html>
