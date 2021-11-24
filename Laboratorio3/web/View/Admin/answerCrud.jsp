<%-- 
    Document   : answerCrud
    Created on : Nov 24, 2021, 10:48:05 AM
    Author     : bryan
--%>

<%@page import="Model.Pregunta"%>
<%@page import="Model.Respuesta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = Integer.parseInt(request.getParameter("id")); 
    ArrayList<Respuesta> lRespuestas = Respuesta.GetAll();
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
    <a class="navbar-brand" >Admin Panel</a>
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
        <b>Agregar respuestas posibles</b>
        <div class="text-center"></div>
        <form action="${pageContext.request.contextPath}/RespuestaServlet" method="post">
            <div class="card-body">
                <div class="row" style="padding-left: 10px; padding-right: 10px;">
                    
                    <div class="col-xl-12 col-md-12 col-sm-12 mb-2">
                        <label>Enunciado de respuesta:</label>
                        <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" 
                        type="text" name="txtRespuesta" minlength="4" size="10" required>
                     </div>
                </div>   
                <button type="submit" name="btnActionRespuesta" value=<% out.println("\"1-"+id+"\""); %>  class="btn btn-outline-primary" style="" >Agregar</button>
            </div>
        </form> 
      </div>
    </div>
    
  </div>
  <div class="container" style="padding-top:25px;">
    <div class="card border-dark shadow">
      <div class="card-header text-center">
        <b>Respuestas Registradas</b>
        <div class="text-center"></div>
        <form action="${pageContext.request.contextPath}/RespuestaServlet" method="post">
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">ID Respuesta</th>
                        <th scope="col">Respuesta</th>
                        <th scope="col">Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                        for (int i = 0; i < lRespuestas.size(); i++) {
                            if (lRespuestas.get(i).preguntaId == id) {
                                out.println("<tr>");
                                out.println("<th scope=\"row\">"+lRespuestas.get(i).respuestaId+"</th>");
                                out.println("<td>"+lRespuestas.get(i).respuesta+"</td>");
                                
                                Pregunta pregunta = Pregunta.GetPreguntaById(id);
                                // Si es tipo de pregunta falso/verdadero entonces no se pueden borrar
                                if (Integer.parseInt(pregunta.preguntaTipo) == 2) {
                                    out.println("<td>");
                                    out.println("<a href=\"quizzViewSpecific.html\" style=\"text-decoration:none;\"><button type=\"submit\" name=\"btnActionRespuesta\" value=\"2-"+lRespuestas.get(i).respuestaId+"\" class=\"btn btn-outline-danger\">Eliminar</button></a>");
                                    out.println("</td>");
                                }                                 
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