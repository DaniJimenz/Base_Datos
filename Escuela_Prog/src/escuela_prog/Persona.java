/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package escuela_prog;

/**
 *
 * @author EAG
 */
public class Persona {
    
    private String nombre;
    private String dni;
    
    public Persona(String n, String d){
        nombre = n;
        dni = d;
    }
    
    public String getNombre(){
        return nombre;
    }
    public String getDni(){
        return dni;
    }
    
    public void setNombre(String n){
        nombre = n;
    }
    public void setDni(String d){
        dni = d;
    }
    
    @Override
    public String toString(){
        return "-" + dni + "-" + nombre;
    }
    
}
