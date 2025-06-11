/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package piedrapapeltijera;
import java.util.Scanner;
/**
 *
 * @author EAG
 */
public class Maquina extends Jugador {
    
    private static int NumeMaqui = 0;
    
    //Constructor//
    
    public Maquina(String no, int pu){
        super ("Máquina" + (++NumeMaqui), 0);
    }
    
    //Métodos//
    
    @Override
    public int Jugar(){
        return (int)(Math.random() * 3) + 1;
    }
}
