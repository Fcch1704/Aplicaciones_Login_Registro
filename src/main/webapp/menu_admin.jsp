<%-- 
    Document   : menu_admin
    Created on : 23 jun. 2025, 9:29:03 a. m.
    Author     : fcch1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menu_admin.css">

        <title>Panel del Administrador</title>
    </head>
    <body>
        <nav>
            <a href="ControladorAdminUsuario">Gestion Usuario</a>
            <a href="ControladorCurso">Gestion Cursos</a>
            <a href="ControladorAsignarCurso">Asignar Cursos Alumnos</a>
            <a href="ControladorAsignarCursoDocente">Asignar Cursos Docentes</a>
            <a href="index.jsp">Salir</a>

        </nav>

        <div class="contenido">
            <h1>Bienvenido al panel del Administrador</h1>
            <p>Selecciona una opción del menú para gestionar el sistema.</p>
        </div>

    </body>
</html>
