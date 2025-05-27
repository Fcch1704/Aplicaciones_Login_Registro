<%-- 
    Document   : registro
    Created on : 27 may. 2025, 8:50:18 a. m.
    Author     : fcch1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="registro.css">

        <title>JSP Page</title>
    </head>
    <body>

        <%

            String nombre = request.getParameter("usuario");
        
        %>
        <h1>Registro de Notas periodo 2021-1</h1>

        <h2>Bienvenido Docente:  <%=nombre%></h2>

        <h3>Notas Algoritmos: </h3>
        <form id="formNotas" action="notas.jsp" method="post">

            <table border="1" cellspacing="4" cellpadding="3">
                <tr>
                    <td align="center"><strong>Nombre del Alumno</strong></td>
                    <td align="center">Curso</td>
                    <td align="center">PF1</td>
                    <td align="center">PF2</td>
                    <td align="center"><strong>Final</strong></td>
                    <td align="center"></td>

                </tr>
                <tr>
                    <td align="center">Fabrizio Alonso</td>
                    <td>Algoritmos</td>
                    <td align="center"><input type="text" id="nota1af" name="nota1af" placeholder="Ingresa la nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2af" name="nota2af" placeholder="Ingresa la nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3af" name="nota3af" placeholder="Ingresa la nota" required>
                    </td>

                </tr>

                <tr>
                    <td align="center">Eduardo Lopez</td>
                    <td>Algoritmos</td>
                    <td align="center"><input type="text" id="nota1ae" name="nota1ae" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2ae" name="nota2ae" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3ae" name="nota3ae" placeholder="Ingresa las nota" required>
                    </td>

                </tr>

                <tr>
                    <td align="center">Sebastian Caicedo</td>
                    <td>Algoritmos</td>
                    <td align="center"><input type="text" id="nota1as" name="nota1as" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2as" name="nota2as" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="notafas" name="nota3as" placeholder="Ingresa las nota" required>
                    </td>
                </tr>

            </table>
            <h3>Notas Base De Datos: </h3>

            <table border="1" cellspacing="4" cellpadding="3">
                <tr>
                    <td align="center"><strong>Nombre del Alumno</strong></td>
                    <td align="center">Curso</td>
                    <td align="center">PF1</td>
                    <td align="center">PF2</td>
                    <td align="center"><strong>Final</strong></td>
                    <td align="center"></td>

                </tr>
                <tr>
                    <td align="center">Fabrizio Alonso</td>
                    <td>Base De Datos</td>
                    <td align="center"><input type="text" id="nota1bf" name="nota1bf" placeholder="Ingresa la nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2bf" name="nota2bf" placeholder="Ingresa la nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3bf" name="nota3bf" placeholder="Ingresa la nota" required>
                    </td>

                </tr>

                <tr>
                    <td align="center">Eduardo Lopez</td>
                    <td>Base De Datos</td>
                    <td align="center"><input type="text" id="nota1be" name="nota1be" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2be" name="nota2be" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3be" name="nota3be" placeholder="Ingresa las nota" required>
                    </td>

                </tr>

                <tr>
                    <td align="center">Sebastian Caicedo</td>
                    <td>Base De Datos</td>
                    <td align="center"><input type="text" id="nota1bs" name="nota1bs" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2bs" name="nota2bs" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3bs" name="nota3bs" placeholder="Ingresa las nota" required>
                    </td>
                </tr>

            </table><h3>Notas Taller_Aplicaciones: </h3>

            <table border="1" cellspacing="4" cellpadding="3">
                <tr>
                    <td align="center"><strong>Nombre del Alumno</strong></td>
                    <td align="center">Curso</td>
                    <td align="center">PF1</td>
                    <td align="center">PF2</td>
                    <td align="center"><strong>Final</strong></td>
                    <td align="center"></td>

                </tr>
                <tr>
                    <td align="center">Fabrizio Alonso</td>
                    <td>Taller Aplicaciones</td>
                    <td align="center"><input type="text" id="nota1tf" name="nota1tf" placeholder="Ingresa la nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2tf" name="nota2tf" placeholder="Ingresa la nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3tf" name="nota3tf" placeholder="Ingresa la nota" required>
                    </td>

                </tr>

                <tr>
                    <td align="center">Eduardo Lopez</td>
                    <td>Taller Apliaciones</td>
                    <td align="center"><input type="text" id="nota1te" name="nota1te" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2te" name="nota2te" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3te" name="nota3te" placeholder="Ingresa las nota" required>
                    </td>

                </tr>

                <tr>
                    <td align="center">Sebastian Caicedo</td>
                    <td>Algoritmos</td>
                    <td align="center"><input type="text" id="nota1ts" name="nota1ts" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota2ts" name="nota2ts" placeholder="Ingresa las nota" required>
                    </td>
                    <td align="center"><input type="text" id="nota3ts" name="nota3ts" placeholder="Ingresa las nota" required>
                    </td>
                </tr>

            </table>
            <br><!-- comment -->

            <button type="button" onclick="enviarFormulario()"> Subir notas al Sistema </button>

            <script>
                function enviarFormulario() {
                    alert("¡Las notas se subieron correctamente al sistema!");
                    document.getElementById("formNotas").submit();
                }
            </script>
        </form>    
    </body>
</html>