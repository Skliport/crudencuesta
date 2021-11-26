<%-- 
    Document   : GraficosDePastel
    Created on : Nov 26, 2021, 3:26:28 PM
    Author     : Osama Bin Laden <binladen at gmail.com>
--%>

<%@page import="Model.Pregunta"%>
<%@page import="Model.clsEncuesta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id")); 
    clsEncuesta encuesta = clsEncuesta.GetById(id);
    ArrayList<Pregunta> lPreguntas = Pregunta.GetById(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/main.css">
        <title>Gráficos de Pastel</title>
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
              <a class="btn btn-secondary my-2 my-sm-0" href="index.jsp" style="color: white;">Salir</a>
            </form>
          </div>
        </nav>
        <div class="container" style="padding-top:25px;">
          <div class="card border-dark shadow">
            <div class="card-header text-center">
               <h3>Gráficos de Pastel</h3>
               <b>Nombre de Encuesta: </b><br>
               <% out.println("<label>"+encuesta.nombre+"</label>"); %> 
            </div>
          </div>
        </div>
        
        <!-- Gráficos -->
           
        <% for (int i = 0; i < lPreguntas.size(); i++) { %> 
            <div class="container" style="padding-top:35px;">
               <div class="card border-dark shadow">
                    <div class="card-header text-center">
                        <b>Pregunta número: </b> <% out.println("<label>"+(i+1)+"</label>"); %> <br>
                        <% out.println("<label>"+lPreguntas.get(i).pregunta+"</label>"); %> 
                        
                        <!-- AQUÍ VA EL GRAFICO CAPAZARDO DE PASTEL -->
                        
                        
                    </div>
                </div> 
           </div>
        <% } %> 
            
    </body>
</html>
