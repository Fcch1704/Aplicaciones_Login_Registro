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

            <form action="controladorUsuario" method="post">
                <div class="input-group">
                    <label for="usuario">Codigo</label>
                    <input type="text" id="codigo" name="codigo" placeholder="Ingresa tu codigo" required>
                </div>
                <div class="input-group">
                    <label for="clave">Contraseña</label>
                    <input type="password" id="pass" name="pass" placeholder="Ingresa tu contraseña" required>
                </div>

                <button type="submit">Entrar</button>

                <p class="registro">¿No tienes cuenta? <a href="#">Regístrate</a></p>


            </form>
            
              <%
            String error = request.getParameter("error");
            if (error != null && error.equals("1")) {
        %>
        <p style="color: red;">Usuario o contraseña incorrectos.</p>
        <%
            }
        %>
        </div>
    </body>
</html>