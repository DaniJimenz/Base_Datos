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
public class PuntoMovible extends Movible{
    
    //Atributos//
    
    protected int x;
    protected int y;
    protected int xVel;
    protected int yVel;
    
    //Constructores//
    
    public PuntoMovible(int x, int y, int xVel, int yVel){
        this.x = x;
        this.y = y;
        this.xVel = xVel;
        this.yVel = yVel;
    }
    
    //Métodos//

    @Override
    public String toString() {
        return "PuntoMovible{" + "x=" + x + ", y=" + y + ", xVel=" + xVel + ", yVel=" + yVel + '}';
    }
    
    public void Arriba(){
        this.y = y + yVel;
    }
    public void Abajo(){
        this.y = y + yVel;
    }
    public void Izquierda(){
        this.y = y + yVel;
    }
    public void Derecha(){
        this.y = y + yVel;
    }
}
