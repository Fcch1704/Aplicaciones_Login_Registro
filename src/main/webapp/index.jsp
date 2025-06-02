<%-- 
    Document   : index
    Created on : 27 may. 2025, 8:42:39 a. m.
    Author     : fcch1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="login.css">

        <title>JSP Page</title>
    </head>
    <body>

        <div class="login-container">


            <h2>Iniciar Sesión</h2>
            <form action="login.jsp" method="post" >
                <div class="input-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu usuario" required>
                </div>
                <div class="input-group">
                    <label for="clave">Contraseña</label>
                    <input type="password" id="pass" name="pass" placeholder="Ingresa tu contraseña" required>
                </div>
               
                <button type="submit">Entrar</button>

                <p class="registro">¿No tienes cuenta? <a href="#">Regístrate</a></p>


            </form>
        </div>
    </body>
</html>