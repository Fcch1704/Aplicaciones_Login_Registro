/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author fcch1
 */
public class Alumno_Curso {

    private int id_ac;
    private String codigo_u;
    private String codigo_c;
    private double nota1;
    private double nota2;
    private double nota3;
    private double nota_final; // Opcional

    private String nombreUsuario;
    private String nombreCurso;

    public Alumno_Curso() {
    }

    public Alumno_Curso(int id_ac, String codigo_u, String codigo_c, double nota1, double nota2, double nota3) {
        this.id_ac = id_ac;
        this.codigo_u = codigo_u;
        this.codigo_c = codigo_c;
        this.nota1 = nota1;
        this.nota2 = nota2;
        this.nota3 = nota3;
    }

    public int getId_ac() {
        return id_ac;
    }

    public void setId_ac(int id_ac) {
        this.id_ac = id_ac;
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

    public double getNota1() {
        return nota1;
    }

    public void setNota1(double nota1) {
        this.nota1 = nota1;
    }

    public double getNota2() {
        return nota2;
    }

    public void setNota2(double nota2) {
        this.nota2 = nota2;
    }

    public double getNota3() {
        return nota3;
    }

    public void setNota3(double nota3) {
        this.nota3 = nota3;
    }

    public double getNota_final() {
        return nota_final;
    }

    public void setNota_final(double nota_final) {
        this.nota_final = nota_final;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getNombreCurso() {
        return nombreCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }
    
    
}
