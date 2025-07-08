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
public class CursoDAO {

    public List<Curso> listarCursos() {
        List<Curso> lista = new ArrayList<>();
        String sql = "SELECT * FROM Curso";

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Curso c = new Curso(rs.getString("codigo_c"), rs.getString("nombre_c"));
                lista.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public boolean insertar(Curso c) {
        String sql = "INSERT INTO Curso (codigo_c, nombre_c) VALUES (?, ?)";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getCodigo());
            ps.setString(2, c.getNombre());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(String codigo) {
        String sql = "DELETE FROM Curso WHERE codigo_c = ?";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, codigo);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Curso c) {
        String sql = "UPDATE Curso SET nombre_c = ? WHERE codigo_c = ?";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getCodigo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
