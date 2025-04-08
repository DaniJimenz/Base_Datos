/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciosextra;
import java.util.Scanner;
/**
 *
 * @author EAG
 */
public class EjerciciosExtra {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        
        Lector ana = new Lector(1, "Ana", "García");
        Lector roberto = new Lector(2, "Roberto", "Sánchez");

        
        Libro libro1 = new Libro(001, "El camino", "Miguel Delibes", "Destino");
        Libro libro2 = new Libro(002, "Cien años de soledad", "Gabriel García Márquez", "Sudamericana");
        Libro libro3 = new Libro(003, "Rayuela", "Julio Cortázar", "Sudamericana");

        
        Fecha fechaPrestamo1 = new Fecha(1, 4, 2025); 
        Fecha fechaPrestamo2 = new Fecha(2, 4, 2025); 

        
        Prestamo prestamo1 = new Prestamo(ana, libro1, fechaPrestamo1);
        prestamo1.realizarPrestamo();

        Prestamo prestamo2 = new Prestamo(ana, libro2, fechaPrestamo1);
        prestamo2.realizarPrestamo();

        Prestamo prestamo3 = new Prestamo(roberto, libro3, fechaPrestamo2);
        prestamo3.realizarPrestamo();

        
        System.out.println("\nIntentando prestar un libro ya prestado:");
        Prestamo intentoRepetido = new Prestamo(roberto, libro1, fechaPrestamo2);
        intentoRepetido.realizarPrestamo();

        
        Fecha fechaDevolucionTarde = new Fecha(20, 4, 2025); 
        System.out.println("\nDevolviendo un libro con retraso:");
        prestamo1.devolverLibro(fechaDevolucionTarde);

        System.out.println("\n¿Ana es morosa? " + ana.isMoroso());
    }
    
}
