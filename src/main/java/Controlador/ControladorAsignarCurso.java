/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Alumno_CursoDAO;
import Modelo.Curso;
import Modelo.CursoDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author fcch1
 */
@WebServlet(name = "ControladorAsignarCurso", urlPatterns = {"/ControladorAsignarCurso"})
public class ControladorAsignarCurso extends HttpServlet {

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
        UsuarioDAO udao = new UsuarioDAO();
        CursoDAO cdao = new CursoDAO();

        List<Usuario> alumnos = udao.listarAlumnos();  // 
        List<Curso> cursos = cdao.listarCursos();

        request.setAttribute("alumnos", alumnos);
        request.setAttribute("cursos", cursos);
        request.getRequestDispatcher("Admin_Asignar.jsp").forward(request, response);
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
         String codigo_u = request.getParameter("codigo_u");
    String[] codigosCurso = request.getParameterValues("cursos");

    boolean algunoDuplicado = false;

    if (codigo_u != null && codigosCurso != null) {
        Alumno_CursoDAO dao = new Alumno_CursoDAO();

        for (String codigo_c : codigosCurso) {
            if (!dao.existeAsignacion(codigo_u, codigo_c)) {
                dao.asignarCurso(codigo_u, codigo_c);
            } else {
                algunoDuplicado = true;
            }
        }
    }

    // Redirección con parámetro dependiendo del resultado
    if (algunoDuplicado) {
        response.sendRedirect("ControladorAsignarCurso?estado=duplicado");
    } else {
        response.sendRedirect("ControladorAsignarCurso?estado=ok");
    }
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
