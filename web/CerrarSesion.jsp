
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        Cerrar Sesion y direccionar a la pagina Principal-->
        <%
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("index.jsp");

        %>
    </body>
</html>
