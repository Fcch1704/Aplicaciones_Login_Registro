<%-- 
    Document   : GuardarRegistro
    Created on : 2 jun. 2025, 9:35:29 a. m.
    Author     : fcch1
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="Clases.Notas" %>
        
        <%
                    String nf_af = "", nf_bf = "", nf_tf = "";

            List<Notas> notasFabrizio = new ArrayList<>();

// Alumno Fabrizio Alonso - Algoritmos
            double n1af = Double.parseDouble(request.getParameter("nota1af"));
            double n2af = Double.parseDouble(request.getParameter("nota2af"));
            double n3af = Double.parseDouble(request.getParameter("nota3af")); // py
            Notas notas_af = new Notas(n1af, n2af, n3af, 0);
            notasFabrizio.add(notas_af);  // Agregar a la lista

// Alumno Fabrizio Alonso - Base de Datos
            double n1bf = Double.parseDouble(request.getParameter("nota1bf"));
            double n2bf = Double.parseDouble(request.getParameter("nota2bf"));
            double n3bf = Double.parseDouble(request.getParameter("nota3bf")); // py
            Notas notas_bf = new Notas(n1bf, n2bf, n3bf, 0);
            notasFabrizio.add(notas_bf);  // Agregar a la lista

// Alumno Fabrizio Alonso - Taller Aplicaciones
            double n1tf = Double.parseDouble(request.getParameter("nota1tf"));
            double n2tf = Double.parseDouble(request.getParameter("nota2tf"));
            double n3tf = Double.parseDouble(request.getParameter("nota3tf")); // py
            Notas notas_tf = new Notas(n1tf, n2tf, n3tf, 0);
            notasFabrizio.add(notas_tf);  // Agregar a la lista

// Guardar la lista completa en sesión
            session.setAttribute("notasFabrizio", notasFabrizio);
            
                response.sendRedirect("index.jsp");
            %>
    </body>
</html>
