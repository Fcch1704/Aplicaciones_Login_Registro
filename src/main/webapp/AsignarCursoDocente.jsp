<%-- 
    Document   : AsignarCursoDocente
    Created on : 30 jun. 2025, 10:21:02 a. m.
    Author     : fcch1
--%>

<%@page import="Modelo.Curso"%>
<%@page import="Modelo.Curso"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menu_admin.css">

        <title>Asignar Curso Docente</title>
    </head>
    <body>
        <nav>
            <a href="menu_admin.jsp">Menú Principal</a>
        </nav>

        <div class="contenido">
            <h2>Asignar Cursos a Docente</h2>

            <% String estado = request.getParameter("estado");
            if ("ok".equals(estado)) { %>
            <p style="color: green;">✅ Cursos asignados correctamente.</p>
            <% } %>

            <form action="ControladorAsignarCursoDocente" method="post">
                <label for="codigo_u">Selecciona el docente:</label>
                <select name="codigo_u" required>
                    <option value="">-- Seleccionar --</option>
                    <%
                        List<Usuario> docentes = (List<Usuario>) request.getAttribute("docentes");
                        for (Usuario d : docentes) {
                    %>
                    <option value="<%= d.getCodigo()%>"><%= d.getNombre()%> (<%= d.getCodigo()%>)</option>
                    <% } %>
                </select>

                <h3>Selecciona los cursos:</h3>
                <%
                    List<Curso> cursos = (List<Curso>) request.getAttribute("cursos");
                    for (Curso c : cursos) {
                %>
                <label>
                    <input type="checkbox" name="cursos" value="<%= c.getCodigo()%>">
                    <%= c.getNombre()%> (<%= c.getCodigo()%>)
                </label><br>
                <% }%>

                <br>
                <button type="submit">Asignar Cursos</button>
            </form>
        </div>
    </body>
</html>
