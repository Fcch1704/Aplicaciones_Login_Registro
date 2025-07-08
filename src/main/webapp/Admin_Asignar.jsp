<%-- 
    Document   : Admin_Asignar
    Created on : 23 jun. 2025, 10:05:27 a. m.
    Author     : fcch1
--%>

<%@page import="Modelo.Curso"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menu_admin.css">

        <title>Asignar Cursos</title>
    </head>
    <body>
        <%
            String estado = request.getParameter("estado");
            if ("ok".equals(estado)) {
        %>
        <p style="color: green;">✅ Cursos asignados correctamente.</p>
        <%
        } else if ("duplicado".equals(estado)) {
        %>
        <p style="color: orange;">⚠️ Algunos cursos ya estaban asignados y no se duplicaron.</p>
        <%
            }
        %>
        <nav>
            <a href="menu_admin.jsp">Menú Principal</a>
        </nav>

        <div class="contenido">
            <h2>Asignar Cursos a Alumnos</h2>

            <form action="ControladorAsignarCurso" method="post">
                <label for="alumno">Selecciona un alumno:</label>
                <select name="codigo_u" required>
                    <option value="">-- Seleccionar --</option>
                    <%
                        List<Usuario> alumnos = (List<Usuario>) request.getAttribute("alumnos");
                        for (Usuario u : alumnos) {
                    %>
                    <option value="<%= u.getCodigo()%>"><%= u.getNombre()%> (<%= u.getCodigo()%>)</option>
                    <% } %>
                </select>

                <label for="cursos">Selecciona cursos:</label>
                <%
                    List<Curso> cursos = (List<Curso>) request.getAttribute("cursos");
                    for (Curso c : cursos) {
                %>
                <div>


                    <input type="checkbox" name="cursos" value="<%= c.getCodigo()%>">
                    <label><%= c.getNombre()%></label>



                </div>
                <% }%>

                <button type="submit">Asignar Cursos</button>
            </form>
        </div>

    </body>
</html>
