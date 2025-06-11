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
public class Auxiliar extends Docente {
    private Docente docenteSustituido;
    
    public Auxiliar(String n, String d){
        super(n, d);
        this.salario = 10.0f; 
    }
    
    public Auxiliar(String n, String d, Docente docente){
        super(n, d);
        this.docenteSustituido = docente;
        this.salario = docente.getSalario(); 
    }
    
    public Docente getDocenteSustituido(){
        return docenteSustituido;
    }
    
    public void setDocenteSustituido(Docente docente){
        this.docenteSustituido = docente;
        this.salario = docente.getSalario();
    }
    
    @Override
    public boolean puedeTomarHoras(int horasAdicionales){
        return (horas + horasAdicionales) <= 10;
    }
    
    @Override
    public void setHoras(int s){
        if((horas + s) <= 10){
            horas = horas + s;
        } else {
            System.out.println("El auxiliar no puede superar las 10 horas semanales");
        }
    }
    
    public boolean puedeAccederAsignatura(Asignatura asignatura){
        return asignatura.getProfesor() != null;
    }
    
    @Override
    public String toString(){
        String sustituye = docenteSustituido != null ? 
            " | Sustituye a: " + docenteSustituido.getNombre() : "";
        return "Docente Auxiliar: " + nombre + " | DNI: " + dni + 
               " | Salario: " + salario + "€/h | Horas asignadas: " + horas + sustituye;
    }
}

