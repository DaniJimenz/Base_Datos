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
public class Nota {
    private String idAsignatura;
    private float calificacion;
    
    public Nota(String id, float cal){
        idAsignatura = id;
        calificacion = cal;
    }
    
    
    // Métodos GET/SET
    public String getIdAsignatura(){
        return idAsignatura;
    }
    
    public float getCalificacion(){
        return calificacion;
    }
    
    public void setIdAsignatura(String id){
        idAsignatura = id;
    }
    
    public void setCalificacion(float cal){
        if(cal >= 0 && cal <= 10){
            calificacion = cal;
        }
    }
    
    @Override
    public String toString(){
        return "Asignatura ID: " + idAsignatura + " | Nota: " + calificacion;
    }
}
