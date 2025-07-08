<%-- 
    Document   : Admin_Cursos
    Created on : 30 jun. 2025, 9:31:00 a. m.
    Author     : fcch1
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menu_admin.css">

        <title>Gestion Cursos</title>
    </head>
    <nav><a href="menu_admin.jsp">Menú Principal</a></nav>
        <%
            String accion = request.getParameter("accion");
            String estado = request.getParameter("estado");

            if (accion != null && estado != null) {
                String mensaje = "";
                String color = "";

                switch (accion) {
                    case "agregar":
                        mensaje = "Curso agregado ";
                        break;
                    case "actualizar":
                        mensaje = "Curso actualizado ";
                        break;
                    case "eliminar":
                        mensaje = "Curso eliminado ";
                        break;
                }

                if ("ok".equals(estado)) {
                    color = "green";
                    mensaje += "correctamente. ✅";
                } else if ("fail".equals(estado)) {
                    color = "red";
                    mensaje = "❌ Error al " + mensaje.toLowerCase();
                }
        %>
    <p style="color: <%= color%>;"><%= mensaje%></p>
    <%
        }
    %>
    <div class="contenido">
        <h2>Gestión de Cursos</h2>

        <div class="botones">
            <button onclick="mostrarSeccion('registro')">➕ Agregar</button>
            <button onclick="mostrarSeccion('eliminar')">🗑️ Eliminar</button>
            <button onclick="mostrarSeccion('editar')">✏️ Editar</button>
        </div>

        <!-- AGREGAR -->
        <div id="registro" style="display: block;">
            <form action="ControladorCurso" method="post">
                <input type="hidden" name="accion" value="insertar">
                <label>Código (Ejemplo:C000002) :</label>
                <input type="text" name="codigo" required>
                <label>Nombre:</label>
                <input type="text" name="nombre" required>
                <button type="submit">Registrar Curso</button>
            </form>
        </div>

        <!-- ELIMINAR -->
        <div id="eliminar" style="display: none;">
            <form action="ControladorCurso" method="post">
                <input type="hidden" name="accion" value="eliminar">
                <label>Selecciona un curso:</label>
                <select name="codigoEliminar">
                    <%
                        List<Curso> cursos = (List<Curso>) request.getAttribute("cursos");
                        if (cursos == null) {
                            cursos = new ArrayList<>();
                        }

                        for (Curso c : cursos) {
                    %>
                    <option value="<%= c.getCodigo()%>"><%= c.getNombre()%> (<%= c.getCodigo()%>)</option>
                    <%
                        }
                    %>
                </select>
                <button type="submit">Eliminar</button>
            </form>
        </div>

        <!-- EDITAR -->
        <div id="editar" style="display: none;">
            <form action="ControladorCurso" method="post">
                <input type="hidden" name="accion" value="editar">
                <label>Selecciona un curso:</label>
                <select name="codigoEditar" onchange="cargarDatos(this)">
                    <% for (Curso c : cursos) {%>
                    <option value="<%= c.getCodigo()%>_<%= c.getNombre()%>"><%= c.getNombre()%> (<%= c.getCodigo()%>)</option>
                    <% }%>
                </select>
                <label>Nuevo nombre:</label>
                <input type="text" name="nuevoNombre" id="nuevoNombre">
                <button type="submit">Actualizar</button>
            </form>
        </div>
    </div>

    <script>
        function mostrarSeccion(seccion) {
            document.getElementById("registro").style.display = "none";
            document.getElementById("eliminar").style.display = "none";
            document.getElementById("editar").style.display = "none";
            document.getElementById(seccion).style.display = "block";
        }

        function cargarDatos(select) {
            const valor = select.value;
            const partes = valor.split("_");
            document.getElementById("nuevoNombre").value = partes[1];
        }
    </script>
</body>
</html>
