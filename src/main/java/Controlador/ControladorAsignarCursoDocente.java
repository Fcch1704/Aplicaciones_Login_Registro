/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Curso;
import Modelo.CursoDAO;
import Modelo.Docente_CursoDAO;
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
@WebServlet(name = "ControladorAsignarCursoDocente", urlPatterns = {"/ControladorAsignarCursoDocente"})
public class ControladorAsignarCursoDocente extends HttpServlet {

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
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        CursoDAO cursoDAO = new CursoDAO();

        // Solo docentes: empiezan con "D"
        List<Usuario> docentes = usuarioDAO.listarDocentes();
        List<Curso> cursos = cursoDAO.listarCursos();

        request.setAttribute("docentes", docentes);
        request.setAttribute("cursos", cursos);
        request.getRequestDispatcher("AsignarCursoDocente.jsp").forward(request, response);
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

        Docente_CursoDAO dao = new Docente_CursoDAO();

        if (codigo_u != null && codigosCurso != null) {
            for (String codigo_c : codigosCurso) {
                if (!dao.existeAsignacion(codigo_u, codigo_c)) {
                    dao.asignarCursoADocente(codigo_u, codigo_c);
                }
            }
        }

        response.sendRedirect("ControladorAsignarCursoDocente?estado=ok");
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
