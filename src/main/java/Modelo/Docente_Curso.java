/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author fcch1
 */
public class Docente_Curso {
 private int id;
    private String codigo_u;
    private String codigo_c;

    // Getters y Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo_u() {
        return codigo_u;
    }

    public void setCodigo_u(String codigo_u) {
        this.codigo_u = codigo_u;
    }

    public String getCodigo_c() {
        return codigo_c;
    }

    public void setCodigo_c(String codigo_c) {
        this.codigo_c = codigo_c;
    }
}