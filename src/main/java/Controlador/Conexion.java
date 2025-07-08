/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author fcch1
 */
public class Conexion {

    private static Connection conn;
    private static final String user = "root";
    private static final String password = "mF121617"; // mF121617
    private static final String url = "jdbc:mysql://localhost:3306/intranet_web";

    public Connection conectar() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL 8.0+
            conn = DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver de MySQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos:");
            e.printStackTrace();
        }
        return conn;
    }

}
