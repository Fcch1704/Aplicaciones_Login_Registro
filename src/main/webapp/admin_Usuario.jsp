<%-- 
    Document   : admin_alumnos
    Created on : 23 jun. 2025, 9:37:26 a. m.
    Author     : fcch1
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menu_admin.css">

        <title>Agregar Usuario</title>
    </head>
    <body>
        <% String actualizado = request.getParameter("actualizado");
             if ("ok".equals(actualizado)) { %>
        <p style="color: green;">✅ Usuario actualizado correctamente.</p>
        <% } else if ("fail".equals(actualizado)) { %>
        <p style="color: red;">❌ Error al actualizar el usuario.</p>
        <% } %>
        <nav>
            <a href="menu_admin.jsp">Menú Principal</a>

        </nav>

        <div class="contenido">

            <div class="botones">
                <button onclick="mostrarRegistro()">➕ Agregar Usuario</button>
                <button onclick="mostrarEliminar()">🗑️ Eliminar Usuario</button>
                <button onclick="mostrarEditar()">✏️ Editar Usuario</button>

            </div>
            <!-- Sección Agregar Usuario -->
            <div id="registroUsuario" style="display: block;">
                <%
                    String registro = request.getParameter("registro");
                    if ("ok".equals(registro)) {
                %>
                <p style="color: green;">✅ Usuario registrado exitosamente.</p>
                <% } else if ("fail".equals(registro)) { %>
                <p style="color: red;">❌ No se pudo registrar el usuario. Intenta nuevamente.</p>
                <% } %>
                <h2>Registrar Usuario</h2>

                <form action="ControladorAdminUsuario" method="post">
                    <label for="codigo">Código (Ej: D123456 para Docente):</label>
                    <input type="text" id="codigo" name="codigo" required>

                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" required>

                    <label for="password">Contraseña:</label>
                    <input type="password" name="password" required>

                    <button type="submit">Registrar</button>
                </form>
            </div>

            <!-- Sección Eliminar Usuario -->
            <div id="eliminarUsuario" style="display: none;">
                <h2>Eliminar Usuario</h2>
                <form action="ControladorEliminarUsuario" method="post">
                    <label for="codigoEliminar">Selecciona el usuario:</label>
                    <select name="codigoEliminar" required>
                        <option value="">-- Seleccionar --</option>
                        <%
                            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                            for (Usuario u : usuarios) {
                        %>
                        <option value="<%= u.getCodigo()%>"><%= u.getNombre()%> (<%= u.getCodigo()%>)</option>
                        <% }%>
                    </select>

                    <button type="submit" onclick="return confirm('¿Estás seguro que deseas eliminar este usuario?')">Eliminar</button>
                </form>
            </div>
        </div>
        <!-- Sección Editar Usuario -->
        <div id="editarUsuario" style="display: none;">
            <h3>Editar Usuario</h3>


            <form action="ControladorEditarUsuario" method="post">
                <label for="codigoEditar">Selecciona el usuario:</label>
                <select name="codigoEditar" id="codigoEditar" required onchange="cargarDatosUsuario(this)">
                    <option value="">-- Seleccionar --</option>
                    <% for (Usuario u : usuarios) {%>
                    <option value="<%= u.getCodigo()%>_<%= u.getNombre()%>_<%= u.getPass()%>">
                        <%= u.getNombre()%> (<%= u.getCodigo()%>)
                    </option>
                    <% }%>
                </select>

                <label for="nuevoNombre">Nuevo Nombre:</label>
                <input type="text" name="nuevoNombre" id="nuevoNombre" required>

                <label for="nuevaPassword">Nueva Contraseña:</label>
                <input type="password" name="nuevaPassword" id="nuevaPassword" required>

                <button type="submit">Actualizar Usuario</button>
            </form>
        </div>
        <script>
            function mostrarRegistro() {
                document.getElementById("registroUsuario").style.display = "block";
                document.getElementById("eliminarUsuario").style.display = "none";
                document.getElementById("editarUsuario").style.display = "none";

            }

            function mostrarEliminar() {
                document.getElementById("editarUsuario").style.display = "none";
                document.getElementById("registroUsuario").style.display = "none";
                document.getElementById("eliminarUsuario").style.display = "block";
            }
            function mostrarEditar() {
                document.getElementById("registroUsuario").style.display = "none";
                document.getElementById("eliminarUsuario").style.display = "none";
                document.getElementById("editarUsuario").style.display = "block";
            }

            function cargarDatosUsuario(select) {
                const valor = select.value;
                if (valor !== "") {
                    const partes = valor.split("_");
                    document.getElementById("nuevoNombre").value = partes[1];
                    document.getElementById("nuevaPassword").value = partes[2];
                }
            }
        </script>
    </body>
</html>
