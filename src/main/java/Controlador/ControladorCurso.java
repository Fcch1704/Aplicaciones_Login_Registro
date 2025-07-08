/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Curso;
import Modelo.CursoDAO;
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
@WebServlet(name = "ControladorCurso", urlPatterns = {"/ControladorCurso"})
public class ControladorCurso extends HttpServlet {

    CursoDAO dao = new CursoDAO();

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
        List<Curso> cursos = dao.listarCursos();
        request.setAttribute("cursos", cursos);
        request.getRequestDispatcher("Admin_Cursos.jsp").forward(request, response);
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
        String accion = request.getParameter("accion");

        if ("insertar".equals(accion)) {
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            boolean exito = dao.insertar(new Curso(codigo, nombre));
            response.sendRedirect("ControladorCurso?agregar=" + (exito ? "ok" : "fail"));

        } else if ("eliminar".equals(accion)) {
            String codigo = request.getParameter("codigoEliminar");
            boolean exito = dao.eliminar(codigo);
            response.sendRedirect("ControladorCurso?eliminado=" + (exito ? "ok" : "fail"));

        } else if ("editar".equals(accion)) {
            String codigo = request.getParameter("codigoEditar");
            String nombre = request.getParameter("nuevoNombre");
            boolean exito = dao.actualizar(new Curso(codigo, nombre));
            response.sendRedirect("ControladorCurso?actualizado=" + (exito ? "ok" : "fail"));
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
