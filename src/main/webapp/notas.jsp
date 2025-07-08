<%-- 
    Document   : notas
    Created on : 27 may. 2025, 8:45:00 a. m.
    Author     : fcch1
--%>

<%@page import="Modelo.Alumno_Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="notas.css">

        <title>Resumen Notas</title>
    </head>
    <body>

        <%@ page import="Modelo.Usuario" %>
        <%@ page import="java.util.List" %>

        <%
            HttpSession sesion = request.getSession(false); // Evita crear una nueva si no hay sesión

            String nombre = (String) sesion.getAttribute("nombre");

            List<Alumno_Curso> listaNotas = (List<Alumno_Curso>) request.getAttribute("listaNotas");

        %>


        <h1>Resumen de Notas - Ingeniería de Sistemas</h1>
        <nav>
            <ul>
                <li><a href="notas.jsp">Periodo 2021-1</a></li>
                <li><a href="2021-2.jsp">Periodo 2021-2</a></li>
                <li><a href="2022-1.jsp">Periodo 2022-1</a></li>
                <li><a href="2022-2.jsp">Periodo 2022-2</a></li>
                <li><a href="2023-1.jsp">Periodo 2023-1</a></li>
            </ul>
        </nav>
        <h2>Bienvenido: <%= nombre%></h2>

        <h3>Notas de <%= nombre%>:</h3>
        <table border="1" cellspacing="4" cellpadding="3">
            <tr>
                <th>Curso</th>
                <th>Nota 1</th>
                <th>Nota 2</th>
                <th>Nota 3</th>
                <th>Promedio Final</th>
            </tr>
            <%
                boolean tieneNotas = false;

                if (listaNotas != null) {
                    for (Alumno_Curso ac : listaNotas) {
                        if (ac.getNombreUsuario().equalsIgnoreCase(nombre)) {
                            tieneNotas = true;
                            double promedio = ((ac.getNota1() + ac.getNota2())/2.0 + ac.getNota3()) / 2.0;
            %>
            <tr>
                <td><%= ac.getNombreCurso()%></td>
                <td align="center"><%= ac.getNota1()%></td>
                <td align="center"><%= ac.getNota2()%></td>
                <td align="center"><%= ac.getNota3()%></td>
                <td align="center"><%= String.format("%.2f", promedio)%></td>
            </tr>
            <%
                        }
                    }
                }

                if (!tieneNotas) {
            %>
            <tr>
                <td colspan="5" align="center">No hay notas registradas para <%= nombre%>.</td>
            </tr>
            <%
                }
            %>
        </table>
    </body

