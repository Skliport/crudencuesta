<%-- 
    Document   : index
    Created on : Nov 19, 2021, 11:55:37 AM
    Author     : bryan
--%>

<%@page import="Servlets.EncuestaServlet"%>
<%@page import="Model.clsEncuesta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<clsEncuesta> encuestas = clsEncuesta.GetAll();%>
<% if (request.getParameter("btnCerrar") != null) {session.setAttribute("usuarioId", null); } %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/main.css">
        <title>Document</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: linear-gradient(to right, #00dbde, #fc00ff);">
            <a class="navbar-brand" >Encuestas</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <%  //Verificando inicio de sesión
                        if(null == session.getAttribute("usuarioId")){
                    %>
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit">
                            <a href="View/Login.jsp" style="color: white;">Iniciar sesión</a>
                        </button>
                    <% } else{ %>
                        <form action="" method="post">
                            <button name="btnCerrar" type="submit" class="btn btn-danger">Cerrar Sesión</button>
                        </form>
                    <% } %>
                </form>
            </div>
        </nav>
        <div class="container" style="padding-top:25px;">
            <%
                for (int i = 0; i < encuestas.size(); i++) {
                    out.println("<div class=\"card border-dark shadow\">");
                    out.println("<div class=\"card-header text-center\">");
                    out.println("<b>"+encuestas.get(i).nombre+"</b>");
                    out.println("<div class=\"text-center\"></div>");
                    out.println("<form action=\"View/Encuesta/quizzUser.jsp?id="+encuestas.get(i).id+"\" method=\"post\">");
                    out.println("<button type=\"submit\" class=\"btn btn-outline-primary\" style=\"\" >Responder encuesta</button>");
                    out.println("</form>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("<br>");
                }
            %>
        </div>
    </body>

</html>