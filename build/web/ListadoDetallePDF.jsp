<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.view.JasperDesignViewer" %>
<%@page import="javax.servlet.ServletResponse" %>
<%@page import="Utils.ConexionDB" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
//            Establecemos la ruta donde se encuentra el reporte
            File reportfile = new File(application.getRealPath("detallePDF.jasper"));
//            Crearemos un objeto en la cual almacenara datos tipo String y Object
            Map<String, Object> parameter = new HashMap<String, Object>();
//            creamos un arreglo de bytes
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, ConexionDB.getConexion());
//            Indicaremos la salida que sera PDF
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
//            creamos un objeto output que viene ser la salida para el reporte pdf
            ServletOutputStream outputStream = response.getOutputStream();
//           dibujara el reporte con todos los datos que tiene los bytes 
            outputStream.write(bytes, 0, bytes.length);
//           Limpiar los flujos de salida, para que no este abierto inecesariamente
            outputStream.flush();
            outputStream.close();
//            fin
        %>
    </body>
</html>
