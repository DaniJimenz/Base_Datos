/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Circulos;

/**
 *
 * @author EAG
 */
public class Circulo implements ObjetoGeometrico{
    
    //Atributos//
    protected double radio;
    
    //Constructor//
    
    public Circulo(double r){
        radio = r;
    }
    
    //Métodos//
    @Override
    public String toString(){
        return "Circulo radio" + radio;
    }
    
    public double ObPerimetro(){
        return (double)(2 * Math.PI + radio);
    }
    
    public double ObArea(){
        return (double)((int)(Math.PI * radio * radio * 1000))/1000;
    }
    
}
