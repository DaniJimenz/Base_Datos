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
public class Docente {
    
    //Atributos
    protected String nombre;
    protected String dni;
    protected float salario;
    protected int horas;
    
    //Constructores
    public Docente(String n, String d, float s, int h){
        nombre = n;
        dni = d;
        salario = s;
        horas = 0;
    }
    
    public Docente(String n, String d){
        nombre = n;
        dni = d;
    }
    
    public Docente(String d,String n,float s ){
        nombre = n;
        dni = d;
        salario = s;
    }
    
    //Métodos GET/SET
    
    public String getNombre(){
        return nombre;
    }
    public String getDni(){
        return dni;
    }
    public float getSalario(){
        return salario;
    }
    public int getHoras(){
        return horas;
    }
    
    public void setNombre(String n){
        nombre = n;
    }
    public void setDni(String d){
        dni = d;
    }
    public void setSalario(float s){
        salario = s;
    }
    public void setHoras(int s){
        horas = horas + s;
    }
    
    public boolean puedeTomarHoras(int horasAdicionales){
        return (horas + horasAdicionales) <= 20;
    }
    
    public String Volcado() {
        return dni + "-" + nombre + "-" + horas + "-" + salario;
    }
    
    @Override
    public String toString() {
        return "Docente: " + nombre + " | DNI: " + dni + " | Salario: " + salario + "€/h | Horas asignadas: " + horas;
    }
}