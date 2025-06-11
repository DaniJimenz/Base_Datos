/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package empleados;

/**
 *
 * @author EAG
 */
public abstract class Empleado {
    protected String nombre;
    protected int edad;
    protected float salario;
    protected final int PLUS = 300;
    
    //Constructor//

    public Empleado(String nombre, int edad, float salario) {
        this.nombre = nombre;
        this.edad = edad;
        this.salario = salario;
    }

    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public float getSalario() {
        return salario;
    }

    public int getPLUS() {
        return PLUS;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setSalario(float salario) {
        this.salario = salario;
    }

    @Override
    public String toString() {
        return "Empleado{" + "nombre=" + nombre + ", edad=" + edad + ", salario=" + salario + ", PLUS=" + PLUS + '}';
    }
    
    public abstract boolean consiguePlus();
    
    public void aumentaSalario(){
        if (this.consiguePlus()) {
            this.salario = this.salario + PLUS;
        }
    }
}
