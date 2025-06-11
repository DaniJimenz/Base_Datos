/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examenherencia;
import java.util.Scanner;
import piedrapapeltijera.*;
/**
 *
 * @author EAG
 */
public class ExamenHerencia {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        int accion = 0,respuesta;
        while(accion != 3){
        System.out.println("Elige entre: \n\t1 Piedra, Papel o Tijer");
        accion = sc.nextInt();
        while (accion < 0 || accion > 2){
            System.out.println("Opción no válida");
            accion = sc.nextInt();
        }
        if (accion == 1){
            System.out.println("¿Quieres jugar contra?\n\t1 Una\n\t2Dos \nTu respuesta");
            respuesta = sc.nextInt();
            while (respuesta < 1 || respuesta > 2){
                System.out.println("Opción no válida");
                respuesta = sc.nextInt();
            }
            int numJugadores = respuesta + 1;
            Jugador[] jugadores = new Jugador[numJugadores];
            System.out.println("Nombre");
            String nombre = sc.nextLine();
            
            int[] manos = new int [numJugadores];
            boolean jugando = true;
            while(jugando){
                for (int i = 0; i < numJugadores; i++) {
                    manos[i] = jugadores[i].Jugar();
                }
                int gana = 0;
                boolean victoria = true;
                boolean dife = false;
                String visto = "" + manos[0];
                    for (int i = 0; i < numJugadores; i++) {
                        if (manos[i] != manos[gana]) dife = true;
                        if (manos[i] == (manos[gana] + 1) % 3) gana = 1;
                        }
                    if (victoria) {     
                }
                    }
                }else if (accion == 2){
              
                }
        }
    }

}
