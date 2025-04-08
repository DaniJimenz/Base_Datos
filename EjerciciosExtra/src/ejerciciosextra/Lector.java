/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciosextra;

/**
 *
 * @author EAG
 */
public class Lector {
    
    //Atributos
    
    private int numero;
    private String nombre;
    private String apellidos;
    private boolean moroso = false;

    public Lector(int numero, String nombre, String apellidos) {
        this.numero = numero;
        this.nombre = nombre;
        this.apellidos = apellidos;
    }

    public int getNumero() {
        return numero;
    }

    public String getNombreCompleto() {
        return nombre + " " + apellidos;
    }

    public boolean isMoroso() {
        return moroso;
    }

    public void marcarMoroso() {
        this.moroso = true;
    }
}
         

