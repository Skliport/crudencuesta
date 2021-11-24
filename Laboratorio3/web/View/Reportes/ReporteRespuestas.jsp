<%-- 
    Document   : ReporteRespuestas
    Created on : Nov 24, 2021, 3:48:01 PM
    Author     : bryan
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="Model.Conexion"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String id = request.getParameter("id"); 
           Conexion cn = new Conexion();
            Connection con = cn.Get();
            File fileReport = new File(application.getRealPath("/View/Reportes/ReportePreguntasRespuestas.jasper"));
            Map<String,Object>parameter = new HashMap<String,Object>();
            parameter.put("id",id);
            byte[] bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), parameter, con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream salida = response.getOutputStream();
            salida.write(bytes,0,bytes.length);
            salida.flush();
            salida.close();
        %>
    </body>
</html>
