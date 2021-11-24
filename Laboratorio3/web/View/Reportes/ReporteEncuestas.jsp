<%-- 
    Document   : ReporteEncuestas
    Created on : Nov 24, 2021, 11:37:00 AM
    Author     : bryan
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Conexion cn = new Conexion();
            Connection con = cn.Get();
            File fileReport = new File(application.getRealPath("/View/Reportes/Test.jasper"));
            Map<String,Object>parameter = new HashMap<String,Object>();
            byte[] bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), parameter, con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream salida = response.getOutputStream();
            salida.write(bytes,0,bytes.length);
            salida.flush();
            salida.close();
        %>
        <h1>Hello World!</h1>
    </body>
</html>
