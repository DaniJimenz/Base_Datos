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
public class AlumnoPPlazos extends Alumno {
    public AlumnoPPlazos(String dni, String nom, String apel){
        super(dni, nom, apel, false);
    }
    
    public float calcularPago(int precio, int mes) {
        float cuotaMensual = precio / 9.0f; 
        return cuotaMensual * mes;
    }
    
    @Override
    public String toString(){
        return "Alumno (Pago por Plazos): " + nombre + " " + apellidos + " | DNI: " + dni;
    }
}

