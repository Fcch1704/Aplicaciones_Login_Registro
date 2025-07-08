/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Alumno_Curso;
import Modelo.Alumno_CursoDAO;
import Modelo.Curso;
import Modelo.Docente_CursoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fcch1
 */
@WebServlet(name = "ControladorAlumno_Curso", urlPatterns = {"/ControladorAlumno_Curso"})
public class ControladorAlumno_Curso extends HttpServlet {

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
        HttpSession sesion = request.getSession();
        String codigoDocente = (String) sesion.getAttribute("codigo_u");

        // 1. Obtener cursos que el docente tiene asignado
        Docente_CursoDAO dcDao = new Docente_CursoDAO();
        List<Curso> cursosAsignados = dcDao.listarCursosPorDocente(codigoDocente);

        // 2. Obtener códigos de curso
        List<String> codigosCurso = cursosAsignados.stream()
                .map(Curso::getCodigo)
                .toList();

        // 3. Obtener alumnos de esos cursos
        Alumno_CursoDAO acDao = new Alumno_CursoDAO();
        List<Alumno_Curso> listaNotas = acDao.listarAlumnoCursosPorCodigosCurso(codigosCurso);

        // 4. Enviar a JSP
        request.setAttribute("cursos", cursosAsignados); // Falta esto

        request.setAttribute("listaNotas", listaNotas);
        request.getRequestDispatcher("registro.jsp").forward(request, response);
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
        processRequest(request, response);
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
