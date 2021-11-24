<%-- 
    Document   : answerCrud
    Created on : Nov 24, 2021, 10:48:05 AM
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
    <a class="navbar-brand" >Admin Panel</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="adminIndex.html">Inicio <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="questionCrud.html">Crear preguntas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="answerCrud.html">Encuestas Respondidas</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit"><a href="login.html"
          style="color: white;">Salir</a></button>
      </form>
    </div>
  </nav>
  <div class="container" style="padding-top:25px;">
    <div class="card border-dark shadow">
      <div class="card-header text-center">
        <b>Aniadir respuestas</b>
        <div class="text-center"></div>
        <form action="quizzUser.html" method="post">
            <div class="card-body">
                <div class="row" style="padding-left: 10px; padding-right: 10px;">
                    
                    <div class="col-xl-4 col-md-4 col-sm-12 mb-2">
                        <label>Respuesta 1 (Respuesta verdadera):*</label>
                        <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" name="nombreEncuesta" minlength="4" size="10" required>
                     </div>
                     <div class="col-xl-4 col-md-4 col-sm-12 mb-2">
                        <label>Respuesta 2 (Obligatoria):*</label>
                        <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" name="nombreEncuesta" minlength="4" size="10" required>
                     </div>  
                     <div class="col-xl-4 col-md-4 col-sm-12 mb-2">
                        <label>Respuesta 3 (opcional):</label>
                        <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" name="nombreEncuesta" minlength="4" size="10">
                     </div>
                     <div class="col-xl-4 col-md-4 col-sm-12 mb-2">
                        <label>Respuesta 4 (opcional):</label>
                        <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" name="nombreEncuesta" minlength="4" size="10">
                     </div>
                     
                                 
                </div>   
                <button type="submit" class="btn btn-outline-primary" style="" >Agregar</button>
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
        <form action="quizzUser.html" method="post">
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">ID encuesta</th>
                        <th scope="col">respuesta 1</th>
                        <th scope="col">respuesta 2</th>
                        <th scope="col">respuesta 3</th>
                        <th scope="col">respuesta 4</th>
                        <th scope="col">Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>respuesta</td>
                        <td>respuesta</td>
                        <td>respuesta</td>
                        <td>respuesta</td>
                        <td style="vertical-align: middle;">
                            <div role="group" aria-label="">
                                <a href="questionCrud.html" style="text-decoration:none;"><button type="submit" class="btn btn-outline-primary">Editar</button></a>
                                <a href="quizzViewSpecific.html" style="text-decoration:none;"><button type="submit" class="btn btn-outline-danger">Eliminar</button></a>
                            </div>
                        </td>
                    </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>respuesta</td>
                        <td>respuesta</td>
                        <td>respuesta</td>
                        <td>Otra pq si</td>
                        <td style="vertical-align: middle;">
                            <div role="group" aria-label="">
                                <a href="questionCrud.html" style="text-decoration:none;"><button type="submit" class="btn btn-outline-primary">Editar</button></a>
                                <a href="quizzViewSpecific.html" style="text-decoration:none;"><button type="submit" class="btn btn-outline-danger">Eliminar</button></a>
                            </div>
                        </td>
                      </tr> 
                    </tbody>
                  </table>
              </div>
        </form>       
      </div>
    </div>
  </div>
</body>

</html>