<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuestras Reservas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
     <style>
            body{
                background-image: url(../img/anticuchos_1.jpg);
                background:linear-gradient (to right,#ffa751,#ffe259);
            }
            h1{
                color: #6666ff;
                size: 35%; 
            }
          </style>
    </head>
    <body>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="../img/logo.png" width="120" alt="alt"/></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link active" href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Listado</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Mantenimiento</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="../index.html">Cerrar Sesión</a>
        </li>
       
      </ul>
        
    </div>
  </div>
</nav>
        <div class="container">
            <h1 align="center" >Registra tu Reserva</h1>
            <p align="center">POR FAVOR LLENE TODOS LOS CAMPOS REQUERIDOS. ¡Gracias!</p>
            <form  action="../Servlet_Reserva" >
                <table class="table" border="5">
                      <tr>
                    <td><input type="number" name="txtDni" class="form-control" placeholder="Ingrese su DNI"></td>
                </tr>
                <tr>
                    <td><input type="text" name="txtNom" class="form-control" placeholder="Ingrese Nombre"></td>
                </tr>
                <tr>
                    <td>  <select name="selectPerso" " class="form-control">
                                        <option>Nro. de personas</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select></td>
                </tr>
                 <tr>
                    <td><input type="text" name="txtDate" class="form-control" placeholder="DD/MM/AA"></td>
                </tr>  
                <tr>
                    <td><input type="text" name="txtHora" class="form-control" placeholder="00:00:00"></td>
                </tr>
                <tr>
                    <td>
                        <select name="selectPlato"  class="form-control">
                                        <option>Comida preferida</option>
                                        <option>1 Pollo a la brasa + 1/4 + 1 1/2 Lts.</option>
                                        <option>1 Pollo a la brasa  + 1/4</option>
                                        <option>1 Pollo a la brasa</option>
                                        <option>1/2 Pollo a la brasa</option>
                                        <option>1/4 Pollo a la brasa</option>
                                        <option>Parrilla de San Martin</option>
                                        <option>Anticuchos</option>
                                        <option>Rachi</option>
                                        <option>Corazoncitos</option>
                                        <option>Riñoncitos</option>
                                        <option>Mollejitas</option>
                                        <option>Mixto</option>
                                        <option>Pancita</option>
                                        <option>Choncholí</option>
                                        <option>Matucha</option>
                                        <option>Pechuga de Pollo</option>
                                        <option>Pierna de Pollo a la Parrilla</option>
                                        <option>Lomo Fino</option>
                                        <option>Ensalada clásica</option>
                                        <option>Ensalada delicia</option>
                                        <option>Ensalada fresca</option>
                                        <option>Ensalada cocida</option>
                        </select> </td>
                </tr>         
                   <tr>
                       <td>
                           <select name="selectoccasion" class="form-control">
                                        <option selected disabled>Ocasión</option>
                                        <option>Reunión</option>
                                        <option>Cumpleaños</option>
                                        <option>Aniversario</option>
                                    </select></td> 
                   </tr>                 
                   <tr>
                    <td><input type="Submit" name="btn" class="form-control btn btn-primary" value="Grabar Datos" </td>
                </tr>
            </table>           
                                    
                 <input type="hidden" name="res" value="insertar">       
                
            </form>
        </div>
    </body>
</html>
