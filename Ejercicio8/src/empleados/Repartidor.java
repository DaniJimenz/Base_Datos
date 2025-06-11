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
public class Repartidor extends Empleado {
    protected String zona;

    public Repartidor(String zona, String nombre, int edad, float salario) {
        super(nombre, edad, salario);
        this.zona = zona;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    @Override
    public String toString() {
        return "Repartidor{" + "zona=" + zona + '}';
    }

    @Override
    public boolean consiguePlus() {
        boolean plus = false;
        if (this.edad < 25 && this.zona.equals("Zona 3")) {
            plus = true;
        }
        return plus;
    } 
}
