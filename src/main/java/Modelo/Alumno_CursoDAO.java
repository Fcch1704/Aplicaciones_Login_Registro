/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import Controlador.Conexion;
import Modelo.Alumno_Curso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author fcch1
 */
public class Alumno_CursoDAO {

    public List<Alumno_Curso> listarAlumnoCursos() {
        List<Alumno_Curso> lista = new ArrayList<>();

        String sql = """
            SELECT ac.id_ac, ac.codigo_u, u.nombre, ac.codigo_c, c.nombre_c,
                       ac.nota1, ac.nota2, ac.nota3
                FROM Alumno_Curso ac
                JOIN Usuario u ON ac.codigo_u = u.codigo_u
                JOIN Curso c ON ac.codigo_c = c.codigo_c
    """;

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Alumno_Curso ac = new Alumno_Curso();
                ac.setId_ac(rs.getInt("id_ac"));
                ac.setCodigo_u(rs.getString("codigo_u"));
                ac.setNombreUsuario(rs.getString("nombre"));
                ac.setCodigo_c(rs.getString("codigo_c"));
                ac.setNombreCurso(rs.getString("nombre_c"));
                ac.setNota1(rs.getDouble("nota1"));
                ac.setNota2(rs.getDouble("nota2"));
                ac.setNota3(rs.getDouble("nota3"));
                lista.add(ac);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;

    }

    public boolean actualizarNotas(int id_ac, double nota1, double nota2, double nota3) {
        String sql = "UPDATE Alumno_Curso SET nota1 = ?, nota2 = ?, nota3 = ? WHERE id_ac = ?";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDouble(1, nota1);
            ps.setDouble(2, nota2);
            ps.setDouble(3, nota3);
            ps.setInt(4, id_ac);

            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean asignarCurso(String codigo_u, String codigo_c) {
        String sql = "INSERT INTO Alumno_Curso (codigo_u, codigo_c, nota1, nota2, nota3) VALUES (?, ?, 0, 0, 0)";

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, codigo_u);
            ps.setString(2, codigo_c);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean existeAsignacion(String codigo_u, String codigo_c) {
        String sql = "SELECT COUNT(*) FROM Alumno_Curso WHERE codigo_u = ? AND codigo_c = ?";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, codigo_u);
            ps.setString(2, codigo_c);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // true si ya existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Alumno_Curso> listarAlumnoCursosPorCodigosCurso(List<String> codigosCurso) {
    List<Alumno_Curso> lista = new ArrayList<>();
    if (codigosCurso == null || codigosCurso.isEmpty()) return lista;

    String placeholders = codigosCurso.stream().map(c -> "?").collect(Collectors.joining(", "));
    String sql = "SELECT ac.id_ac, ac.codigo_u, u.nombre, ac.codigo_c, c.nombre_c, ac.nota1, ac.nota2, ac.nota3 " +
                 "FROM Alumno_Curso ac " +
                 "JOIN Usuario u ON ac.codigo_u = u.codigo_u " +
                 "JOIN Curso c ON ac.codigo_c = c.codigo_c " +
                 "WHERE ac.codigo_c IN (" + placeholders + ")";

    try (Connection con = new Conexion().conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        for (int i = 0; i < codigosCurso.size(); i++) {
            ps.setString(i + 1, codigosCurso.get(i));
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Alumno_Curso ac = new Alumno_Curso();
            ac.setId_ac(rs.getInt("id_ac"));
            ac.setCodigo_u(rs.getString("codigo_u"));
            ac.setNombreUsuario(rs.getString("nombre"));
            ac.setCodigo_c(rs.getString("codigo_c"));
            ac.setNombreCurso(rs.getString("nombre_c"));
            ac.setNota1(rs.getDouble("nota1"));
            ac.setNota2(rs.getDouble("nota2"));
            ac.setNota3(rs.getDouble("nota3"));
            lista.add(ac);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return lista;
}
}
