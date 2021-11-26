<%-- 
    Document   : adminIndex
    Created on : Nov 24, 2021, 9:46:49 AM
    Author     : bryan
--%>

<%@page import="Model.clsEncuesta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<clsEncuesta> encuestas = clsEncuesta.GetAll();
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
          <a class="nav-link" href="adminIndex.jsp">Inicio <span class="sr-only">(current)</span></a>
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
        <b>Crear encuesta</b>
        <div class="text-center"></div>
        <form action="${pageContext.request.contextPath}/EncuestaServlet" method="post">
            <div class="card-body">
                <div class="row" style="padding-left: 10px; padding-right: 10px;">
                    
                   <div class="col-xl-12 col-md-4 col-sm-12 mb-2">
                       <label>Nombre de encuesta:</label>
                       <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" name="txtNombreEncuesta" minlength="4" size="10" required>
                    </div>
                                 
                </div>   
                <button type="submit" name="btnAction" value="1-0" class="btn btn-outline-primary" style="" >Agregar</button>
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
        <form action="${pageContext.request.contextPath}/EncuestaServlet" method="post">
            <div class="card-body">
                <a href="/Laboratorio3/View/Reportes/ReporteEncuestas.jsp" class="btn btn-outline-primary" style="text-decoration:none;">Reporte de encuestas</a>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">ID encuesta</th>
                        <th scope="col">Nombre encuesta</th>
                        <th scope="col">Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < encuestas.size(); i++) {
                                out.println("<tr>");
                                    out.println("<th scope=\"row\">"+encuestas.get(i).id+"</th>");
                                    out.println("<td>"+encuestas.get(i).nombre+"</td>");
                                    out.println("<td style=\"vertical-align: middle;\">");
                                    out.println("<div role=\"group\" aria-label=\"\">");
                                    out.println("<a href=\"/Laboratorio3/View/Admin/questionCrud.jsp?id="+encuestas.get(i).id+"\" class=\"btn btn-outline-primary\" style=\"text-decoration:none;\">Editar</a>");
                                    out.println("<a href=\"\" style=\"text-decoration:none;\"><button type=\"submit\" name=\"btnAction\" value=\"2-"+encuestas.get(i).id+"\" class=\"btn btn-outline-danger\">Eliminar</button></a>");
                                    out.println("");
                                    out.println("<a href=\"/Laboratorio3/View/Reportes/ReporteEncuestaPreguntas.jsp?id="+encuestas.get(i).id+"\" class=\"btn btn-outline-primary\" style=\"text-decoration:none;\">Reporte 2</a>");
                                    out.println("<a href=\"/Laboratorio3/View/Reportes/ReporteRespuestas.jsp?id="+encuestas.get(i).id+"\" class=\"btn btn-outline-primary\" style=\"text-decoration:none;\">Reporte3</a>");
                                    out.println("<a href=\"/Laboratorio3/View/Graficos/GraficosDeBarra.jsp?id="+encuestas.get(i).id+"\" class=\"btn btn-outline-success\" style=\"text-decoration:none;\">Gráfico de Barra</a>");
                                    out.println("<a href=\"/Laboratorio3/View/Graficos/GraficosDePastel.jsp?id="+encuestas.get(i).id+"\" class=\"btn btn-outline-success\" style=\"text-decoration:none;\">Gráfico de Pastel</a>");
                                    out.println("</div>");
                                    out.println("</td>");
                                    out.println("</tr>");
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