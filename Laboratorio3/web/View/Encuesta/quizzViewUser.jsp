<%-- 
    Document   : quizzViewUser
    Created on : Nov 24, 2021, 7:52:17 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <a class="navbar-brand" >Resueltas</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="../../index.jsp">Inicio <span class="sr-only">(current)</span></a>
            </li>
          </ul>
        </div>
      </nav>
      <div class="container" style="padding-top:25px;">
        <div class="card border-dark shadow">
            <div class="card-header">
                <b>Encuestas que han sido finalizadas</b>
              </div>
          <div class="card-body">
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">ID encuesta</th>
                    <th scope="col">Nombre encuesta</th>
                    <th scope="col">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Encuesta de prueba</td>
                    <td><button type="button" class="btn btn-outline-primary"><a href="quizzViewSpecific.jsp" style="text-decoration:none;">Ver Encuesta</a></button></td>
                  </tr>
                </tbody>
              </table>
          </div>
        </div>
      </div>
</body>
</html>