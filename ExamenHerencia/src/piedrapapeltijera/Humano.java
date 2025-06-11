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
public class Humano extends Jugador {
    Scanner sc = new Scanner(System.in);
    
    //Constructor//
    
    public Humano(String no, int pu){
        super( no, pu);
    }

    public Humano(String nombre) {
        this.nombre = nombre;
    }
    
    //Métodos//
    
    
    @Override
    public int Jugar(){
        int opcion;
        System.out.println("Opciones;\n\t1 Piedra\n\t2 Papel\n\t3 Tijera\n Respuesta");
        opcion = sc.nextInt();
        return 1;
    }
}
