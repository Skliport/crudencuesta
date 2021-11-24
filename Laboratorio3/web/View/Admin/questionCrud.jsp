<%-- 
    Document   : questionCrud
    Created on : Nov 24, 2021, 10:17:05 AM
    Author     : bryan
--%>

<%@page import="Model.clsEncuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int id = Integer.parseInt(request.getParameter("id")); 
    clsEncuesta encuesta = clsEncuesta.GetById(id);

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
                        <a class="nav-link" href="adminIndex.html">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="questionCrud.html">Crear preguntas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="answerCrud.html">Crear Respuesta</a>
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
                                    <button type="submit" name="btnAction" value=<% out.println("\"4-"+id+"\""); %> class="btn btn-outline-primary" style="" >Actualizar</button>
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
                    <form action="${pageContext.request.contextPath}/PreguntaServlet" method="post">
                        <div class="card-body">
                            <div class="row" style="padding-left: 10px; padding-right: 10px;">
                                <div class="col-xl-12 col-md-4 col-sm-12 mb-2">
                                    <label>Pregunta:*</label>
                                    <input class=" card border-dark shadow col-xl-12 col-md-4 col-sm-12 mb-2" type="text" name="txtPregunta" minlength="4" size="10" required>
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
                            <button type="submit" name="btnActionPregunta" value="1-0" class="btn btn-outline-primary" style="" >Agregar</button>
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
                                        <th scope="col">ID Pregunta</th>
                                        <th scope="col">Pregunta</th>
                                        <th scope="col">Respuesta Real</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Existe el chupacabras?</td>
                                        <td>a</td>
                                        <td style="vertical-align: middle;">
                                            <div role="group" aria-label="">
                                                <a href="questionCrud.html" style="text-decoration:none;"><button type="submit" class="btn btn-outline-primary">Editar</button></a>
                                                <a href="quizzViewSpecific.html" style="text-decoration:none;"><button type="submit" class="btn btn-outline-danger">Eliminar</button></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Quien eres?</td>
                                        <td>a</td>
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