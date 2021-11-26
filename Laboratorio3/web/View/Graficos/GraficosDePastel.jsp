<%-- 
    Document   : GraficosDePastel
    Created on : Nov 26, 2021, 3:26:28 PM
    Author     : Osama Bin Laden <binladen at gmail.com>
--%>

<%@page import="java.util.Random"%>
<%@page import="Model.Pregunta"%>
<%@page import="Model.clsEncuesta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    clsEncuesta encuesta = clsEncuesta.GetById(id);
    ArrayList<Pregunta> lPreguntas = Pregunta.GetById(id);
    ArrayList<String> data = Pregunta.GetData2(id);
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js" ></script>
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
                    <% out.println("<label>" + encuesta.nombre + "</label>"); %> 
                </div>
            </div>
        </div>

        <!-- Gráficos -->

        <% for (int i = 0; i < lPreguntas.size(); i++) { %> 
        <div class="container" style="padding-top:35px;">
            <div class="card border-dark shadow">
                <div class="card-header text-center">
                    <b> <% out.println(lPreguntas.get(i).pregunta); %>  </b> <br>
                    <% out.println("<label>" + lPreguntas.get(i).pregunta + "</label>"); %> 
                    <% String labels = "";
                        String datos = "";
                        String Colores = ""; %>
                    <%
                        for (int j = 0; j < data.size(); j++) {
                            String[] info = data.get(j).split("-");
                            if (Integer.parseInt(info[2]) == lPreguntas.get(i).preguntaId) {
                                Random rand = new Random();
                                float r = rand.nextFloat();
                                float g = rand.nextFloat();
                                float b = rand.nextFloat();
                                labels += "'" + info[0] + "',";
                                datos += info[1] + ",";
                                Colores += "'rgba("+r*255+","+g*255+","+b*255+", 0.2)',";
                            }
                        }
                    %>
                    <!-- AQUÍ VA EL GRAFICO CAPAZARDO DE PASTEL -->
                    <canvas <% out.println("id=\"myChart" + i + "\""); %> width="200" height="50"></canvas>
                    <script>
                        const <% out.println("ctx" + i); %> = document.getElementById(<% out.println("\'myChart" + i + "\'"); %>).getContext('2d');
                        const <% out.println("myChart" + i); %> = new Chart(<% out.println("ctx" + i); %>, {
                            type: 'doughnut',
                            data: {
                                labels: [<% out.println(labels); %>],
                                datasets: [{
                                        label: '# of Votes',
                                        data: [<% out.println(datos); %>],
                                        backgroundColor: [
                        <% out.println(Colores); %>
                                        ],
                                        borderColor: [
                        <% out.println(Colores); %>
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
        <% }%> 

    </body>
</html>
