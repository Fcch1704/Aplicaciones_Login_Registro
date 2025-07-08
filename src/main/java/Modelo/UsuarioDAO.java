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
public class UsuarioDAO {

    public boolean validarUsuario(String codigo_u, String pass) {
        String sql = "SELECT * FROM Usuario WHERE codigo_u = ? AND password = ?";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, codigo_u);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Error al validar usuario: " + e.getMessage());
            return false;
        }
    }

    public String obtenerNombre(String codigo_u) {
        String sql = "SELECT nombre FROM Usuario WHERE codigo_u = ?";
        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, codigo_u);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombre");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener nombre: " + e.getMessage());
        }
        return "";
    }

    public boolean agregar(Usuario u) {
        String sql = "INSERT INTO Usuario (codigo_u, nombre, password) VALUES (?, ?, ?)";

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, u.getCodigo());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getPass());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Usuario> listarAlumnos() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM Usuario WHERE codigo_u NOT LIKE 'd%'";

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Usuario u = new Usuario(rs.getString("codigo_u"), rs.getString("nombre"), rs.getString("password"));
                lista.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void eliminarUsuarioConCursos(String codigo) {
        try (Connection con = new Conexion().conectar()) {
            // Primero eliminamos los registros relacionados
            String sql1 = "DELETE FROM Alumno_Curso WHERE codigo_u = ?";
            try (PreparedStatement ps1 = con.prepareStatement(sql1)) {
                ps1.setString(1, codigo);
                ps1.executeUpdate();
            }

            // Luego eliminamos el usuario
            String sql2 = "DELETE FROM Usuario WHERE codigo_u = ?";
            try (PreparedStatement ps2 = con.prepareStatement(sql2)) {
                ps2.setString(1, codigo);
                ps2.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE Usuario SET nombre = ?, password = ? WHERE codigo_u = ?";

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getPass());
            ps.setString(3, usuario.getCodigo());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Usuario> listarDocentes() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM Usuario WHERE codigo_u LIKE 'd%'";

        try (Connection con = new Conexion().conectar(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Usuario u = new Usuario(rs.getString("codigo_u"), rs.getString("nombre"), rs.getString("password"));
                lista.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}
