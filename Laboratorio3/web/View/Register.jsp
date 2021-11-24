<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../CSS/main.css">
    <title>Document</title>
</head>
<body>
    <div class="container-login">
        <div class="wrap-login">
            <form class="login-form validate-form" id="formLogin" action="${pageContext.request.contextPath}/UserServlet" method="post">
                <span class="login-form-title">REGISTRO</span>
                
                <div class="wrap-input100" data-validate = "Nombre incorrecto">
                    <input class="input100" type="text" id="usuario" name="txtUsuarioNombre" placeholder="Nombre">
                    <span class="focus-efecto"></span>
                </div>
                
                <div class="wrap-input100" data-validate = "Apellido incorrecto">
                    <input class="input100" type="text" id="usuario" name="txtUsuarioApellido" placeholder="Apellido">
                    <span class="focus-efecto"></span>
                </div>
                
                <div class="wrap-input100" data-validate = "Usuario incorrecto">
                    <input class="input100" type="text" id="usuario" name="txtUsuarioCorreo" placeholder="Correo">
                    <span class="focus-efecto"></span>
                </div>
                
                <div class="wrap-input100" data-validate="Contrasenia incorrect">
                    <input class="input100" type="password" id="password" name="txtUsuarioClave" placeholder="Contrasenia">
                    <span class="focus-efecto"></span>
                </div>
                
                <div class="container-login-form-btn">
                    <div class="wrap-login-form-btn">
                        <div class="login-form-bgbtn"></div>
                        <button type="submit" name="btnAction" value="1" class="login-form-btn">Registrar</button>
                    </div>
                </div>
                <div style="padding: 8px 0px 0px 8px;">
                    <span>Ya te has registrado?<a href="Login.jsp"> Entra aqui!</a></span>
                </div>
            </form>
        </div>
    </div>     
        
        
     <script src="jquery/jquery-3.3.1.min.js"></script>    
     <script src="bootstrap/js/bootstrap.min.js"></script>    
     <script src="popper/popper.min.js"></script>    
        
     <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>
</body>
</html>