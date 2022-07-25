<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Beans.ClientesBeans"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <style>
            body{
                background-image: url(../img/banner.jpg);
                background:linear-gradient (to right,#ffa751,#ffe259);
            }
            .bg{
                background: url(../img/about-main.jpg);
               
                
               background-position: center center;
               
            }
        </style>
    </head>
    <body>
        
        <!-- Encabezado -->
       
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class ="navbar-brand" href="#"><img src="../img/logo.png" alt="alt"/> </a>
            </div>
        </nav>
        
        <div class="container w-75 bg-primary mt-5 rounded shadow">
            <div class="row align-items-stretch ">
                <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">
                    
                 </div>
                
                <div class="col bg-white p-5 rounded-end">
                     <div class="text-end">
                        <img src="../img/logo.png" width="70" alt=""/>
                    </div>
                    <h2 class="fow-bold text-center py-5">Registrate</h2>
            
                    <form action="../ServletClientes" method="post">
                         <div class="mb-4">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" name="txtNom" placeholder="Ingrese su Nombre" class="form-control">
                        </div>
                        <div class="mb-4">
                            <label for="apellido" class="form-label">Apellido:</label>
                            <input type="text" name="txtApe" placeholder="Ingrese su Apellido" class="form-control">
                        </div>
                        <div class="mb-4">
                            <label for="apellido" class="form-label"> Correo Electronico:</label>
                            <input type="text" name="txtCo" placeholder="xxxxx@xxxxx.com" class="form-control">
                        </div>
                        <div class="mb-4">
                            <label for="password" class="form-label">Ingrese una Clave:</label>
                            <input type="password" name="txtPas" placeholder="**************" class="form-control"> 
                        </div>
                        
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary"> Registrar </button>
                        </div>
                                            
                    </form>
                    
              
                    <!-- Redes Sociales -->
                    <div class="container w-100 my-5">
                        <div class="row text-center">
                            <div class="col-12">Iniciar Sesión</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <button class="btn btn-outline-primary w-100 my-1">
                                    <div class="row align-items-center">
                                        <div class="col-2 d-none d-md-block">
                                            <img src="../img/fb.png" width="32"  alt="alt"/>    
                                     </div>  
                                   
                                    <div class="col-12 col-md-10 text-center">
                                        Facebook
                                    </div>
                                   </div> 
                                </button>
                            </div>
                            <div class="col">
                                <button class="btn btn-outline-danger w-100 my-1">
                                    <div class="row align-items-center">
                                        <div class="col-2 d-none d-md-block">
                                            <img src="../img/go.png" width="32"  alt="alt"/>    
                                     </div>  
                                   
                                    <div class="col-12 col-md-10 text-center">
                                        Google
                                    </div>
                                   </div> 
                                </button>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
             <%
            if(request.getAttribute("Error")!=null){
                String error=request.getAttribute("Error").toString();
                %>
                <div class="alert alert-danger" role="alert">
                    <%=error%>
                </div>
                    <%
            }
            
            %>
        </div>