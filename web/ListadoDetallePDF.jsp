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
            File reportfile = new File(application.getRealPath("detallePDF.jasper"));
            Map<String, Object> parameter = new HashMap<String, Object>();
            byte[] bytes=JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, ConexionDB.getConexion());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream=response.getOutputStream();
            outputStream.write(bytes,0,bytes.length);
            
            outputStream.flush();
            outputStream.close();
        %>
    </body>
</html>
