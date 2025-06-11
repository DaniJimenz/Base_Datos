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
public class Comercial extends Empleado{
    protected double comision;

    public Comercial(double comision, String nombre, int edad, float salario) {
        super(nombre, edad, salario);
        this.comision = comision;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    @Override
    public String toString() {
        return "Comercial{" + "comision=" + comision + '}';
    }

    @Override
    public boolean consiguePlus() {
        boolean plus = false;
        if (this.edad > 30 && this.comision > 200) {
            plus = true;
        }
        return plus;
    }
    
    
}
