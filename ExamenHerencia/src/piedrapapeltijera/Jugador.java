/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package piedrapapeltijera;
import java.util.Scanner;
/**
 *
 * @author EAG
 */
public abstract class Jugador {
    
    //Atributos
    
    protected String nombre;
    protected int puntos;
    
    //Constructor//
    
    public Jugador(String no, int pu){
        nombre = no;
        puntos = pu;
    
    }
    
    //Métodos//
    
    public void gana(){
        
    }
    
    public abstract int Jugar();

    public String getNombre() {
        return nombre;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    @Override
    public String toString() {
        return "Jugador{" + "nombre=" + nombre + ", puntos=" + puntos + '}';
    }
}

