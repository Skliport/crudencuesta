<%-- 
    Document   : quizzViewSpecific
    Created on : Nov 24, 2021, 7:54:51 AM
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
    <a class="navbar-brand" >Encuesta Resuelta</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="../../index.jsp">Inicio <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="quizzViewUser.jsp">Encuestas Respondidas</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="container" style="padding-top:25px;">
    <div class="card border-dark shadow">
      <div class="card-header text-center">
        <b>Encuesta 1</b>
        <div class="text-center"></div>
        <button type="button" class="btn btn-outline-primary" ><a href="quizzViewUser.jsp" style="text-decoration:none;">Volver</a></button>
      </div>

      <div class="card-body" id="encuesta">
        <div class="row" style="padding-left: 10px; padding-right: 10px;">
          <!--Aqui es donde repetis en loop las preguntas-->
          <div class="col-xl-3 col-md-4 col-sm-12 mb-2">
            <label>1. Es cofi gei?</label>
          </div>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gridRadios" id="opcion1" value="" checked>
              <label class="form-check-label" for="gridRadios1">
                Si
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gridRadios" id="opcion2" value="">
              <label class="form-check-label" for="gridRadios2">
                Si
              </label>
            </div>
            <div class="form-check disabled">
              <input class="form-check-input" type="radio" name="gridRadios" id="opcion3" value="" disabled>
              <label class="form-check-label" for="gridRadios3">
                no es gei, pero lo desabilite pa que no seleccionenk djasldjalsdjk
              </label>
            </div>
          </div>
          <div class="col-xl-3 col-md-4 col-sm-12 mb-2" style="padding-top:5px;">
            <label>1. Es cofi gei?</label>
          </div>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gridRadios" id="opcion1" value="" checked>
              <label class="form-check-label" for="gridRadios1">
                Si
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gridRadios" id="opcion2" value="">
              <label class="form-check-label" for="gridRadios2">
                No
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>   
  </div>
</body>

</html>