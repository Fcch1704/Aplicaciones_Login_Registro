/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author fcch1
 */
public class Notas {
    private double nota1;
    private double nota2;
    private double py;
    private double NF;

    public Notas(double nota1, double nota2, double py, double NF) {
        this.nota1 = nota1;
        this.nota2 = nota2;
        this.py = py;
        this.NF = NF;
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

    public double getPy() {
        return py;
    }

    public void setPy(double py) {
        this.py = py;
    }

    public double getNF() {
        NF=((nota1+nota2)/2+py)/2;
        return NF;
    }

    public void setNF(double NF) {
        this.NF = NF;
    }
    
    
    
    
    
}
