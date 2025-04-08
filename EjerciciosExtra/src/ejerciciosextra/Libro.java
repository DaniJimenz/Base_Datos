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
public class Libro {
    
    //Atributos
    
    public int codigo;
    public String titulo;
    public String autor;
    public String editorial;
    public boolean prestado = false;
    
    public Libro(int codigo, String titulo, String autor, String editorial){
        this.codigo = codigo;
        this.titulo = titulo;
        this.autor = autor;
        this.editorial = editorial;
    }

    public String getTitulo() {
        return titulo;
    }

    public boolean isPrestado() {
        return prestado;
    }

    public void prestar() {
        this.prestado = true;
    }

    public void devolver() {
        this.prestado = false;
    }
}
    
    
    

