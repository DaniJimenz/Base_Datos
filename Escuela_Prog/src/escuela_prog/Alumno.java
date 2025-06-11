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
public class Alumno {
    
    //Atributos
    protected String dni;
    protected String nombre;
    protected String apellidos;
    protected boolean pago;
    protected Nota[] calificaciones = new Nota[5]; 
    protected int numCalificaciones = 0;
            
    //Constructores

    public Alumno( String dn, String no, String ape, boolean pa ){
        dni = dn;
        nombre = no;
        apellidos = ape;
        pago = pa;
        numCalificaciones = 0;
    }
    
    public Alumno(String[] datos){
        if (datos.length >= 3) {
            dni = datos [0];
            nombre = datos [1];
            pago = datos [2].equals("true");
            apellidos = "";
            calificaciones = new Nota[5]; 
            numCalificaciones = 0;
        }
    }
    
    
    //Métodos GET/SET

    public String getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public boolean getPago() {
        return pago;
    }

    public Nota[] getCalificaciones() {
        return calificaciones;
    }

    public int getNumCalificaciones() {
        return numCalificaciones;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setPago(boolean pago) {
        this.pago = pago;
    }

    public void setCalificaciones(Nota[] calificaciones) {
        this.calificaciones = calificaciones;
    }

    public void setNumCalificaciones(int numCalificaciones) {
        this.numCalificaciones = numCalificaciones;
    }
    
    public boolean tieneCalificaciones() {
        return numCalificaciones > 0;
    }

    public void añadirNota(String asi, float nota) {
        if (numCalificaciones < calificaciones.length) {
            calificaciones[numCalificaciones] = new Nota(asi, nota);
            numCalificaciones++;
        } else {
            System.out.println("No se pueden añadir más notas");
        }
    }
    
    public void setNota(String[] asi){
        for (int i = 0; i < 5; i++) {
            calificaciones[i] = new Nota (asi[i],0 );
            
        }
    }
    
    public String Volcado(){
        String tipoPago = pago ? "true" : "false";
        return dni + "-" + nombre + "-" + tipoPago;
}
    
    @Override
    public String toString(){
        return "Alumno : " + nombre + " " + apellidos + " | DNI: " + dni + " | Pago único: " + (pago ? "Sí" : "No");
    }
    
    public void getNota(){
        for (int i = 0; i < 5; i++) {
            System.out.println(calificaciones[i].getIdAsignatura()+": "+calificaciones[i].getCalificacion());
        }
    }
}
