<%-- 
    Document   : quizzUser
    Created on : Nov 24, 2021, 8:01:29 AM
    Author     : bryan
--%>

<%@page import="Model.Respuesta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    ArrayList<Pregunta> preguntas = Pregunta.GetById(id);
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/main.css">
        <title>Document</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
             style="background: linear-gradient(to right, #00dbde, #fc00ff);">
            <a class="navbar-brand">Encuesta Resuelta</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../../index.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container" style="padding-top:25px;">
            <form action="${pageContext.request.contextPath}/RespuestaUsuarioServlet" method="post">
                <div class="card border-dark shadow">
                    <div class="card-header text-center">
                        <b>Encuesta 1</b>
                        <div class="text-center"></div>
                        <button type="button" class="btn btn-outline-primary"><a href="../../index.jsp"
                                                                                 style="text-decoration:none;">Volver</a></button>
                    </div>
                    <input type="hidden" name="encuestaId" value=<% out.println("\""+id+"\""); %>>
                    <div class="card-body" id="encuesta">
                        <div class="row" style="padding-left: 10px; padding-right: 10px;">
                            <!--Aqui es donde repetis en loop las preguntas-->
                            <%                                
                                for (int i = 0; i < preguntas.size(); i++) {
                                    out.println("<div class=\"col-xl-3 col-md-4 col-sm-12 mb-2\">");
                                    out.println("<label>" + (i + 1) + "-" + preguntas.get(i).pregunta + "</label>");
                                    out.println("</div>");
                                    ArrayList<Respuesta> respuestas = Respuesta.GetById(preguntas.get(i).preguntaId);
                                    for (int j = 0; j < respuestas.size(); j++) {
                                        out.println("<div class=\"col-sm-10\">");
                                        out.println("<div class=\"form-check\">");
                                        out.println("<input class=\"form-check-input\" name=\"resp-"+preguntas.get(i).preguntaId+"\" type=\"radio\" id=\"opcion1\" value=\""+respuestas.get(j).respuestaId+"\">");
                                        out.println("<label class=\"form-check-label\"  for=\"gridRadios1\">"+respuestas.get(j).respuesta+"</label>");
                                        out.println("</div>");
                                        out.println("</div>");
                                    }
                                    out.println("<br>");
                                }
                            %>
                        </div> <br>
                        <%
                        //Verificando inicio de sesión
                        if(null == session.getAttribute("usuarioId")){
                            out.println("<a href=\"/Laboratorio3/View/Login.jsp\" class=\"btn btn-outline-danger\" style=\"\" >Inicie sesión para responder esta encuesta</a>");       
                        }else{
                            out.println("<button type=\"submit\" class=\"btn btn-outline-primary\">Enviar respuestas</button>");         
                        }
                         %>
                    </div>
                </div>
            </form>
        </div>
    </body>

</html>

