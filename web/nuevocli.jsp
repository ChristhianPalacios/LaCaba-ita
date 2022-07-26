<%@page import="java.util.ArrayList"%>
<%@page import="Beans.ClientesBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrate 📝</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/742049c140.js" crossorigin="anonymous"></script>
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

                <div class="col bg-white p-5 rounded-end">
                    <div class="text-end">
                        <img src="img/LOGOPRUEBA1.png" width="70" alt=""/>
                    </div>
                    <h2 class="fow-bold text-center py-5">Hola! Bienvenido Registrate</h2>

                    <form action="ServletClientes">
<!--                        Mensaje de restriccion-->
                        <h6>
                            <%
                                if (request.getAttribute("msge") != null) {
                                    String msg = request.getAttribute("msge").toString();
                            %>
                            <div class="alert alert-danger" role="alert">
                                <%=msg%>
                            </div>
                            <%
                                }
                            %>
                        </h6>
                        <table align="center" class="table">
<!--                            Estructura de formulario-->
                            <tr>
                                <td for="Nombre" class="form-label">Nombre: </td> 
                                <td><input type="text" name="txtNom" class="form-control" placeholder="Ingrese Nombre" required="requerid"></td>
                            </tr> <tr>
                                <td for="Apellido:" class="form-label">Apellido: </td> 
                                <td><input type="text" name="txtApe" class="form-control" placeholder="Ingrese Apellido" required="requerid"></td>
                            </tr> <tr>
                                <td for="Email" class="form-label">Email</td> 
                                <td><input type="email" name="txtEmail" class="form-control" placeholder="Ingrese Email" id="correo" required="requerid">
                                    <p id="Evalidacion" style="color: red;"></p></td>
                            </tr><tr>
                                <td for="telefono" >Telefono</td> 
                                <td ><input type="text" name="txtTelefono" class=" form-control" placeholder="Ingrese Telefono" id="telefono" required="requerid"> 
                                    <p id="Tvalidacion" style="color: red;"></p></td>
                            </tr><tr>
                                <td for="Dirección" class="form-label">Dirección</td> 
                                <td><input type="text" name="txtDirec" class="form-control" placeholder="Ingrese Dirección" required="requerid"></td>
                            </tr><tr>
                                <td for="DNI" class="form-label" >DNI:</td> 
                                <td><input type="text" name="txtDNI" class="form-control" placeholder="Ingrese DNI" id="DNI" required="requerid"><p id="validacion" style="color: red;"></p></td>

                            </tr><tr>
                                <td for="Contraseña" class="form-label">Contraseña</td> 
                                <td><input type="password" name="txtContra" class="form-control" placeholder="Ingrese Contraseña" required="requerid"></td>
                            </tr> <tr >
                                <td class="d-grid"> <input type="Submit" name="btn" class="btn btn-primary" value="Registrar"></td>
                            </tr>

                        </table>
<!--                        boton invisible para direccionar con la accion que se encuentra en el servlet-->
                        <input type="hidden" name="op" value="insertar">    

                    </form>

<!--Fin del formulario-->


                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="js/Restricciones.js" type="text/javascript"></script>

    </body>
</html>

