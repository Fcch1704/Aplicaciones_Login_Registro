<%-- 
    Document   : login
    Created on : 2 jun. 2025, 8:51:32 a. m.
    Author     : fcch1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="Clases.Usuario"%>
        <%
            String nombre = request.getParameter("nombre");
            String pass = request.getParameter("pass");

            Usuario usuario = new Usuario(nombre, pass);

            session.setAttribute("usuario", usuario);

            // Redirigir según primera letra
            if (Character.toLowerCase(nombre.charAt(0)) == 'd') {
                response.sendRedirect("registro.jsp");
            } else {
                response.sendRedirect("notas.jsp");
            }


        %>
    </body>
</html>
