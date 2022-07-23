<%-- 
    Document   : principal
    Created on : 05/10/2021, 08:06:49 PM
    Author     : Nataly Cuyate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
String usuario="";
HttpSession sesionOk= request.getSession();
usuario =(String)sesionOk.getAttribute("usuario");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-white bg-white">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">UTP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Listado</a>
        </li>
        <li class="nav-item">
          <%if(usuario.equals("Victoria")){%>   <a class="nav-link" href="#">Mantenimientos</a>
        </li>
        <li class="nav-item">
           <a class="nav-link" href="#">Ventas </a><% }%>
          
        </li>
        <li class="nav-item">
          <a class="nav-link " href="ServletLoginAdmin">Cerrar Sesion</a>
        </li>
         <li class="nav-item">
             <a class="nav-link active">
                 <div class="nombre">
            Bienvenido <%=usuario%>
        </div>
             </a>
        </li>
      </ul>
        
    </div>
  </div>
</nav>
        <h2 align="center">Pagina Principal</h2>
        
        
                <header id="header" class="fixed-top d-flex align-items-cente">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="dashboard.html"> <img src="img/logo.png" alt="LOGO"/> </a></h1>


                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="#">Inicio</a></li>
                        <li><a class="nav-link scrollto" href="#about">Nosotros</a></li>
                        <li><a class="nav-link scrollto" href="#menu">Menu</a></li>
                        <li><a class="nav-link scrollto" href="#chefs">Nuestro Equipo</a></li>
                        <li><a class="nav-link scrollto" href="#contact">Contáctanos</a></li>
                    </ul>
                    
                    
        <li class="nav-item">
           <a class="nav-link" href="#">Ventas </a><% }%>
          
        </li>
                <!-- .navbar -->
                 <a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">RESERVA</a>
                 <a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">DELIVERY</a>

            </div>
        </header>
    </body>
</html>
