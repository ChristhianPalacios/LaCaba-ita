<%@page import="java.util.ArrayList"%>

<%@page import="Beans.ClientesBeans" %>
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
 
%>
<!--Ademas restricciones para que no entren a la pagina defrente sin haber iniciado Sesion-->
<!--Fin de Session-Restricciones-Envio de Datos-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil 👫</title>
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
            p{
                color: red;
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
                    <h2 class="fow-bold text-center py-5">Actualización de tus Datos! 👤</h2>

                    <form  action="ServletClientes">
<!--                        inicio del Formulario-->
<!--                        Accion que se establecio en el Servlet-->
<!--                   formamos un ArrayList de los clientes, pero se mostrara los datos del cliente por el id-->
                        <%
                            ArrayList<ClientesBeans> lista
                                    = (ArrayList<ClientesBeans>) request.getAttribute("listaC");
                            for (int i = 0; i < lista.size(); i++) {
                                ClientesBeans em = lista.get(i);
                        %>
                        <table class="table">
                            <tr>
                                <td>Id </td> 
                                <td><input type="text" name="txtId" class="form-control" value="<%=em.getId()%>" readonly="readonly"></td>
                            </tr> <tr>
                                <td>Nombre: </td> 
                                <td><input type="text" name="txtNom" class="form-control" value="<%=em.getNombre()%>"></td>
                            </tr> <tr>
                                <td>Apellido: </td> 
                                <td><input type="text" name="txtApe" class="form-control" value="<%=em.getApellidos()%>" ></td>
                            </tr> <tr>
                                <td>Email</td> 
                                <td><input type="text" name="txtEmail" class="form-control" value="<%=em.getEmail()%>" id="correo" >
                                    <p id="Evalidacion"></p></td>
                            </tr>  <tr>
                                <td>Telefono</td> 
                                <td><input type="text" name="txtTelefono" class="validate form-control" value="<%=em.getTelefono()%>" id="telefono">
                                    <p id="Tvalidacion"></p></td>
                            </tr>   <tr>
                                <td>Dirección</td> 
                                <td><input type="text" name="txtDirec" class="form-control" value="<%=em.getDireccion()%>" ></td>
                            </tr> <tr>
                                <td>DNI:</td> 
                                <td><input type="text" name="txtDNI" class="validate form-control" value="<%=em.getDNI()%>" id="DNI" >
                                    <p id="validacion"></p></td>
                            </tr>  <tr>
                                <td>Contraseña</td> 
                                <td><input type="text" name="txtContra" class="form-control" value="<%=em.getClave()%>"></td>
                            </tr> <tr>
                                <td> <input type="Submit" name="btn" class="form-control btn btn-dark" value="Guardar datos"></td>

                            </tr>

                        </table>
<!--                            boton invicible para hacer la accion de editar Perfil-->
                        <input type="hidden" name="op" value="EditarPerfil">   

                        <%
                            }
                        %>
                    </form>
<!--                    Fin del Formulario-->
                </div>
            </div>
        </div>
<!--                    Link para la funcionalidad de los JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <!--Llamamos al JS "Restricciones" para la ccion de los input-->
        <script src="js/Restricciones.js" type="text/javascript"></script>
    </body>
</html>
