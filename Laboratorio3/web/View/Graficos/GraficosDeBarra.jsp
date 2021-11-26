<%-- 
    Document   : GraficosDeBarra
    Created on : Nov 26, 2021, 3:04:44 PM
    Author     : Osama Bin Laden <binladen at gmail.com>
--%>

<%@page import="Model.clsEncuesta"%>
<%@page import="Model.Pregunta"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <title>Gráficos de Barras</title>
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
               <h3>Gráficos de Barras</h3>
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
                        
                        <!-- AQUÍ VA EL GRAFICO CAPAZARDO DE BARRAS -->
                        
                        <canvas <% out.println("id=\"myChart"+i+"\""); %> width="200" height="80"></canvas>
                        <script>
                        const <% out.println("ctx"+i); %> = document.getElementById(<% out.println("'myChart"+i+"'"); %>).getContext('2d');
                        const <% out.println("myChart"+i); %> = new Chart(<% out.println("ctx"+i); %>, {
                            type: 'bar',
                            data: {
                                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                                datasets: [{
                                        label: '# of Votes',
                                        data: [12, 19, 3, 5, 2, 3],
                                        backgroundColor: [
                                            'rgba(255, 99, 132, 0.2)',
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(255, 206, 86, 0.2)',
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(153, 102, 255, 0.2)',
                                            'rgba(255, 159, 64, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(255, 99, 132, 1)',
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 206, 86, 1)',
                                            'rgba(75, 192, 192, 1)',
                                            'rgba(153, 102, 255, 1)',
                                            'rgba(255, 159, 64, 1)'
                                        ],
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    </script>
                        
                    </div>
                </div> 
           </div>
        <% } %> 
             <br><br>
    </body>
</html>
