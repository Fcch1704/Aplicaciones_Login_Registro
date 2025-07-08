/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Alumno_CursoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author fcch1
 */
@WebServlet(name = "controladorNotas", urlPatterns = {"/controladorNotas"})
public class controladorNotas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Enumeration<String> parametros = request.getParameterNames();
        Alumno_CursoDAO dao = new Alumno_CursoDAO();

        // Mapa para agrupar por id_ac
        Map<Integer, Double[]> notasPorAlumno = new HashMap<>();

        while (parametros.hasMoreElements()) {
            String nombreParam = parametros.nextElement(); // Ejemplo: nota1_23

            if (nombreParam.startsWith("nota")) {
                String[] partes = nombreParam.split("_"); // ["nota1", "23"]
                String tipoNota = partes[0]; // nota1, nota2, nota3
                int id_ac = Integer.parseInt(partes[1]);
                double valor = Double.parseDouble(request.getParameter(nombreParam));

                Double[] notas = notasPorAlumno.getOrDefault(id_ac, new Double[]{null, null, null});
                switch (tipoNota) {
                    case "nota1":
                        notas[0] = valor;
                        break;
                    case "nota2":
                        notas[1] = valor;
                        break;
                    case "nota3":
                        notas[2] = valor;
                        break;
                }
                notasPorAlumno.put(id_ac, notas);
            }
        }

        // Actualizar en BD
        for (Map.Entry<Integer, Double[]> entry : notasPorAlumno.entrySet()) {
            int id_ac = entry.getKey();
            Double[] notas = entry.getValue();
            if (notas[0] != null && notas[1] != null && notas[2] != null) {
                dao.actualizarNotas(id_ac, notas[0], notas[1], notas[2]);
            }
        }

        request.setAttribute("notasActualizadas", true);
        response.sendRedirect("ControladorAlumno_Curso");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
