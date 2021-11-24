<%-- 
    Document   : questionCrud
    Created on : Nov 24, 2021, 10:17:05 AM
    Author     : bryan
--%>

<%@page import="Model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.clsEncuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int id = Integer.parseInt(request.getParameter("id")); 
    clsEncuesta encuesta = clsEncuesta.GetById(id);
    ArrayList<Pregunta> lPreguntas = Pregunta.GetAll();
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: linear-gradient(to right, #00dbde, #fc00ff);">
            <a class="navbar-brand" >Questions Panel</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../../adminIndex.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a class="btn btn-secondary my-2 my-sm-0" href="index.jsp" 
                    style="color: white;">Salir</a>
                </form>
            </div>
        </nav>
        
        <div class="container" style="padding-top:25px;">
            <div class="card border-dark shadow">
                <div class="card-header text-center">
                    <b>Modificar encuesta</b>
                    <div class="text-center"></div>
                    <form action="${pageContext.request.contextPath}/EncuestaServlet" method="post">
                        <div class="card-body">
                            <div class="row" style="padding-left: 10px; padding-right: 10px;">

                                <div class="col-xl-12 col-md-4 col-sm-12 mb-2">
                                    <label>Nombre de encuesta:</label>
                                    <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" value=<% out.println("\""+encuesta.nombre+"\""); %> type="text" name="txtNombreEdit" minlength="4" size="10" required>
                                </div>

                            </div>   
                                <button type="submit" name="btnAction" value=<% out.println("\"4-"+id+"\""); %> 
                                class="btn btn-outline-primary" style="" >Actualizar</button>
                        </div>
                    </form> 
                </div>
            </div>

        </div>

        <div class="container" style="padding-top:25px;">
            <div class="card border-dark shadow">
                <div class="card-header text-center">
                    <b>Crear Preguntas</b>
                    <div class="text-center"></div>
                    <form action="${pageContext.request.contextPath}/PreguntasServlet" method="post">
                        <div class="card-body">
                            <div class="row" style="padding-left: 10px; padding-right: 10px;">
                                <div class="col-xl-12 col-md-4 col-sm-12 mb-2">
                                    <label>Pregunta:*</label>
                                    <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" 
                                    name="txtPregunta" minlength="4" size="10" required>
                                </div>
                            </div>
                            <div class="row" style="padding-left: 10px; padding-right: 10px;">
                                <div class="col-xl-12 col-md-4 col-sm-12 mb-2">
                                    <label>Tipo:</label>
                                    <select class="form-select" name="txtPreguntaTipo" aria-label="Default select example">
                                        <option value="1">Verdadero/Falso</option>
                                        <option value="2">Opcion Multiple</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" name="btnActionPregunta" value=<% out.println("\"1-"+id+"\""); %>  class="btn btn-outline-primary" 
                            style="" >Agregar</button>
                        </div>
                    </form> 
                </div>
            </div>

        </div>
        <div class="container" style="padding-top:25px;">
            <div class="card border-dark shadow">
                <div class="card-header text-center">
                    <b>Encuestas Registradas</b>
                    <div class="text-center"></div>
                     <form action="${pageContext.request.contextPath}/PreguntasServlet" method="post">
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">ID Pregunta</th>
                                        <th scope="col">Pregunta</th>
                                        <th scope="col">Tipo de Pregunta</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for (int i = 0; i < lPreguntas.size(); i++) {
                                        if (lPreguntas.get(i).encuestaId == id) {
                                            out.println("<tr>");
                                            out.println("<th scope=\"row\">"+lPreguntas.get(i).preguntaId+"</th>");
                                            out.println("<td>"+lPreguntas.get(i).pregunta+"</td>");
                                            if (Integer.parseInt(lPreguntas.get(i).preguntaTipo) == 1) { out.println("<td>Verdadero/Falso</td>");}
                                            else { out.println("<td>Opcion Multiple</td>");}

                                            out.println("<td>");
                                                out.println("<a href=\"/Laboratorio3/View/Admin/answerCrud.jsp?id="+lPreguntas.get(i).preguntaId+"\" class=\"btn btn-outline-primary\" style=\"text-decoration:none;\">Editar</a>");
                                                out.println("<a href=\"quizzViewSpecific.html\" style=\"text-decoration:none;\"><button type=\"submit\" name=\"btnActionPregunta\" value=\"2-"+lPreguntas.get(i).preguntaId+"\" class=\"btn btn-outline-danger\">Eliminar</button></a>");
                                             out.println("</td>");
                                             out.println("</tr>");
                                        }  
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </form>       
                </div>
            </div>
        </div>
    </body>

</html>