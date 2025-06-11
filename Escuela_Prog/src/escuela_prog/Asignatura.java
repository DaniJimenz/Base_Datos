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
public class Asignatura {
    
    //Atributos Asignatura
    private int id;
    private String nombre;
    private int horasem;
    private Docente profesor;
    
    //Constructores
    public Asignatura (int i, String n, int h){
        nombre = n;
        horasem = h;
        id = 1;
    }
    
    public Asignatura(String[] datos) {
        if (datos.length >= 4) {
            try {
                id = Integer.parseInt(datos[0]);
                nombre = datos[1];
                horasem = Integer.parseInt(datos[3]);
            } catch (Exception e) {
                System.out.println("Error al cargar los datos de la asignatura");
                id = 0;
                nombre = "Sin nombre";
                horasem = 0;
            }
        }
    }
    
    //Métodos GET/SET
    public int getId(){
        return id;
    }
    public String getNombre(){
        return nombre;
    }
    public int getHorasem(){
        return horasem;
    }
    public Docente getProfesor(){
        return profesor;
    }
    
    public void setNombre(String n){
        nombre = n;
    }
    public void setId(int i){
        id = 1;
    }
    public void setHorasem(int h){
        horasem = h;
    }
    public void setProfesor(Docente p){
        profesor = p;
    }
    
    public void asignarProfesor(Docente nuevoProfesor) {
        if (profesor == null) {
            if (nuevoProfesor.getHoras() + horasem < 20) {
                nuevoProfesor.setHoras(horasem);
                profesor = nuevoProfesor;
            } else {
                System.out.println("El profesor no puede impartir esta asignatura");
            }
        } else {
            if (nuevoProfesor.getHoras() + horasem < 20) {
                profesor.setHoras(-horasem);
                nuevoProfesor.setHoras(horasem);
                profesor = nuevoProfesor;
            } else {
                System.out.println("El nuevo profesor no tiene disponibilidad");
            }
        }
    }
    
    public String Volcado() {
        String idProfesor = profesor != null ? profesor.getDni() : "";
        return id + "-" + nombre + "-" + idProfesor + "-" + horasem;
    }
    
    @Override
    public String toString() {
        String profInfo = profesor != null ? profesor.getNombre() : "Sin asignar";
        return "Asignatura: " + nombre + " (ID: " + id + ") | Horas semanales: " + horasem + " | Profesor: " + profInfo;
    }
}

