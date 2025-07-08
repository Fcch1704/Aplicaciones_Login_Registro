<%-- 
    Document   : registro
    Created on : 27 may. 2025, 8:50:18 a. m.
    Author     : fcch1
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.Curso"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="Modelo.Alumno_Curso"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="registro.css">

        <title>Registro Notas</title>
    </head>
    <body>

        <%@ page import="Modelo.Usuario" %>
        <%@ page import="Modelo.Alumno_Curso" %>


        <%
             HttpSession sesion = request.getSession(false);
            String nombre = (String) sesion.getAttribute("nombre");
            List<Alumno_Curso> listaNotas = (List<Alumno_Curso>) request.getAttribute("listaNotas");
            List<Curso> cursos = (List<Curso>) request.getAttribute("cursos");

            // Obtener alumnos únicos por curso
            Map<String, Set<String>> alumnosPorCurso = new HashMap<>();
            if (listaNotas != null) {
                for (Alumno_Curso ac : listaNotas) {
                    alumnosPorCurso.putIfAbsent(ac.getNombreCurso(), new HashSet<>());
                    alumnosPorCurso.get(ac.getNombreCurso()).add(ac.getNombreUsuario());
                }
            }
        %>

        <h1>Registro de Notas periodo 2021-1</h1>

        <h2>Bienvenido Docente:  <%=nombre%></h2>

        <!-- Selección de curso -->
        <label for="comboCursos">Selecciona un curso:</label>
        <select id="comboCursos" onchange="actualizarAlumnos()">
            <option value="">-- Seleccionar --</option>
            <% for (Curso c : cursos) { %>
                <option value="<%= c.getNombre() %>"><%= c.getNombre() %></option>
            <% } %>
        </select>

        <!-- Selección de alumno -->
        <label for="comboAlumnos">Selecciona un alumno:</label>
        <select id="comboAlumnos" onchange="mostrarTabla()">
            <option value="">-- Seleccionar --</option>
        </select>

        <!-- Tabla de notas -->
        <div id="tablaNotas" style="display: none;">
            <form id="formNotas" action="controladorNotas" method="post">
                <table border="1">
                    <tr>
                        <th>Alumno</th>
                        <th>Curso</th>
                        <th>Nota 1</th>
                        <th>Nota 2</th>
                        <th>Nota 3</th>
                    </tr>
                    <%
                        if (listaNotas != null) {
                            for (Alumno_Curso ac : listaNotas) {
                    %>
                    <tr class="filaAlumno" data-curso="<%= ac.getNombreCurso() %>" data-alumno="<%= ac.getNombreUsuario() %>">
                        <td><%= ac.getNombreUsuario() %></td>
                        <td><%= ac.getNombreCurso() %></td>
                        <td><input type="text" name="nota1_<%= ac.getId_ac() %>" value="<%= ac.getNota1() %>"/></td>
                        <td><input type="text" name="nota2_<%= ac.getId_ac() %>" value="<%= ac.getNota2() %>"/></td>
                        <td><input type="text" name="nota3_<%= ac.getId_ac() %>" value="<%= ac.getNota3() %>"/></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
                <br>
                <button type="button" onclick="enviarFormulario()"> Subir notas al Sistema </button>
            </form>
        </div>

        <script>
            const alumnosPorCurso = {
                <% for (Map.Entry<String, Set<String>> entry : alumnosPorCurso.entrySet()) {
                    String curso = entry.getKey();
                    Set<String> alumnos = entry.getValue();
                %>
                "<%= curso %>": [
                    <% for (String alumno : alumnos) { %>
                    "<%= alumno %>",
                    <% } %>
                ],
                <% } %>
            };

            function actualizarAlumnos() {
                const cursoSeleccionado = document.getElementById("comboCursos").value;
                const comboAlumnos = document.getElementById("comboAlumnos");
                comboAlumnos.innerHTML = '<option value="">-- Seleccionar --</option>';

                if (cursoSeleccionado && alumnosPorCurso[cursoSeleccionado]) {
                    alumnosPorCurso[cursoSeleccionado].forEach(alumno => {
                        const option = document.createElement("option");
                        option.value = alumno;
                        option.textContent = alumno;
                        comboAlumnos.appendChild(option);
                    });
                }
                document.getElementById("tablaNotas").style.display = "none";
            }

            function mostrarTabla() {
                const curso = document.getElementById("comboCursos").value;
                const alumno = document.getElementById("comboAlumnos").value;
                const filas = document.querySelectorAll(".filaAlumno");

                if (curso && alumno) {
                    document.getElementById("tablaNotas").style.display = "block";
                    filas.forEach(fila => {
                        if (fila.getAttribute("data-curso") === curso && fila.getAttribute("data-alumno") === alumno) {
                            fila.style.display = "";
                        } else {
                            fila.style.display = "none";
                        }
                    });
                } else {
                    document.getElementById("tablaNotas").style.display = "none";
                }
            }

            function enviarFormulario() {
                alert("¡Las notas del alumno se registraron correctamente!");
                document.getElementById("formNotas").submit();
            }
        </script>
    </body>
</html>