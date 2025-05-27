<%-- 
    Document   : notas
    Created on : 27 may. 2025, 8:45:00 a. m.
    Author     : fcch1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="notas.css">

        <title>Resumen Notas</title>
    </head>
    <body>

        <%
            String nombre = request.getParameter("usuario");
        %>

        <h1>Resumen de Notas - Ingeniería de Sistemas</h1>

        <nav>
            <ul>
                <li><a href="notas.jsp">Periodo 2021-1</a></li>
                <li><a href="2021-2.jsp">Periodo 2021-2</a></li>
                <li><a href="2022-1.jsp">Periodo 2022-1 </a></li>
                <li><a href="2022-2.jsp">Periodo 2022-2</a></li>
                <li><a href="2023-1.jsp">Periodo 2023-1</a></li>
            </ul>
        </nav>
        <h2>Bienvenido:   <%= nombre%></h2>
        <h3>Sus notas del Periodo 2021-1 son:  </h3>

        <table border="1" cellspacing="4" cellpadding="3">
            <tr>
                <td align="center"><strong>Periodo</strong></td>
                <td align="center"><strong>Curso</strong></td>
                <td align="center">PF1</td>
                <td align="center">PF2</td>
                <td align="center"><strong>Final</strong></td>

            </tr>
            <tr>
                <td align="center">2021-1</td>
                <td>Algoritmos</td>
                <td align="center">15</td>
                <td align="center">15</td>
                <td align="center">15</td>

            </tr>

            <tr>
                <td align="center">2021-1</td>
                <td>Base De Datos</td>
                <td align="center">12></td>
                <td align="center">18></td>
                <td align="center">17</td>

            </tr>

            <tr>
                <td align="center">2021-1</td>
                <td>Taller Aplicaciones</td>
                <td align="center"><15></td>
                <td align="center"><12</td>
                <td align="center"><13</td>

            </tr>

        </table>

    </body>
</html>

