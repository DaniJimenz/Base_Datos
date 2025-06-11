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
public class AlumnoPUnico extends Alumno{

     public AlumnoPUnico(String dni, String nom, String apel){
        super(dni, nom, apel, true);
       
    }
    
    public float calcularPago(int precio, int mes) {
        return precio;
    }
    
    @Override
    public String toString(){
        return "Alumno (Pago Único): " + nombre + " " + apellidos + " | DNI: " + dni;
    }
}
    
    
    
    

