<%-- 
    Document   : notas
    Created on : 27 may. 2025, 8:45:00 a. m.
    Author     : fcch1
--%>

<%@page import="Clases.Notas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="notas.css">

        <title>Resumen Notas</title>
    </head>
    <body>

        <%@ page import="Clases.Usuario" %>
        <%@ page import="java.util.List" %>

        <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            if (usuario == null) {
                response.sendRedirect("index.jsp"); // Redirige si no hay sesión
                return;
            }

            String nombre = usuario.getNombre();

            List<Notas> notasFabrizio = (List<Notas>) session.getAttribute("notasFabrizio");

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
                <td align="center">Nota1</td>
                <td align="center">Nota2</td>
                <td align="center">PY</td>

                <td align="center"><strong>Final</strong></td>

            </tr>
            <%
                if (notasFabrizio != null && notasFabrizio.size() == 3) {
                    // Cursos en el orden que guardaste: Algoritmos, Base de Datos, Taller Aplicaciones
                    String[] cursos = {"Algoritmos", "Base De Datos", "Taller Aplicaciones"};
                    String periodo = "2021-1";

                    for (int i = 0; i < notasFabrizio.size(); i++) {
                        Notas n = notasFabrizio.get(i);
            %>
            <tr>
                <td align="center"><%= periodo%></td>
                <td><%= cursos[i]%></td>
                <td align="center"><%= n.getNota1()%></td>
                <td align="center"><%= n.getNota2()%></td>
                <td align="center"><%= n.getPy()%></td>
                <td align="center"><%= String.format("%.2f", n.getNF())%></td>
            </tr>
            <%
                } // ← cierre del for
            } else {
            %>
            <tr>
                <td colspan="6" align="center">No hay notas registradas para mostrar.</td>
            </tr>
            <%
                } // ← cierre del if
            %>

        </table>

    </body>
</html>

