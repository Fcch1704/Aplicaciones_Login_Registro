/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fcch1
 */
public class Docente_CursoDAO {
     public void asignarCursoADocente(String codigo_u, String codigo_c) {
        String sql = "INSERT INTO Docente_Curso (codigo_u, codigo_c) VALUES (?, ?)";
        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, codigo_u);
            ps.setString(2, codigo_c);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean existeAsignacion(String codigo_u, String codigo_c) {
        String sql = "SELECT COUNT(*) FROM Docente_Curso WHERE codigo_u = ? AND codigo_c = ?";
        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, codigo_u);
            ps.setString(2, codigo_c);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Curso> listarCursosPorDocente(String codigo_u) {
        List<Curso> lista = new ArrayList<>();
        String sql = """
            SELECT c.codigo_c, c.nombre_c
            FROM Curso c
            JOIN Docente_Curso dc ON c.codigo_c = dc.codigo_c
            WHERE dc.codigo_u = ?
        """;

        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, codigo_u);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Curso c = new Curso(rs.getString("codigo_c"), rs.getString("nombre_c"));
                lista.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}