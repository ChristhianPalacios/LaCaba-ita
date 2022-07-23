

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CATALOGO</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/LOGOTIPO.png" type="png" />
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    </head>

    <style>
        body{
            background: #000000;
        }

        h2 {
            height: 100px;
            margin-top: 50px;
            color: #ce3232;
            font-size: 36px;
            font-weight: 700;
            font-family: "Playfair Display", serif;
            color: #ce3232;

        }
        img{
            border-radius: 50%;

        }
        center{
            color: #fff;
        }

    </style>
    <body>


        <h2 align="center">NUESTROS PRODUCTOS</h2>

        <table border="0" align="center" width="1000">      
            <%
                ArrayList<Producto> lista = ProductoDB.obtenerProducto();
                int salto = 0;
                for (Producto p : lista) {
            %>
            <th> <center><img src="img/<%=p.getImagen()%>" width="160" height="160" ></center><p>
            <center>  <%= p.getNombre()%><br></center>
            <center> S/. <%= p.getPrecio()%><p></center>
            <center> <a href="">Modificar</a> || <a href="">Añadir</a> </center>
            <p>       </p>
        </th>              
        <%
            salto++;
            if (salto == 4) {
        %>
        <tr>
            <%
                        salto = 0;
                    }
                }
            %>
    </table>

</body>
</html> 