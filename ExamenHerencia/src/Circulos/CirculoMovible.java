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
public class CirculoMovible extends Circulo{
    //Atributos//
    
    protected PuntoMovible centro;
    
    //Constructores//
    
    public CirculoMovible(int x, int y, int xVel, int yVel){
        centro = new PuntoMovible( x, y , xVel, yVel);
        radio = 2;
    }
    
    //Métodos//

    @Override
    public String toString() {
        return centro + "CirculoMovible" + "centro=";
    } 
}
