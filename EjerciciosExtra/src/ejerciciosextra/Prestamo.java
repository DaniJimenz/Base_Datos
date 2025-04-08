/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciosextra;

/**
 *
 * @author EAG
 */
public class Prestamo {
    
    //Atributos
    
    private Lector lector;
    private Libro libro;
    private Fecha fechaPrestamo;
    private Fecha fechaDevolucion;

    public Prestamo(Lector lector, Libro libro, Fecha fechaPrestamo) {
        this.lector = lector;
        this.libro = libro;
        this.fechaPrestamo = fechaPrestamo;
        this.fechaDevolucion = null; // No hay devolución aún
    }

    public void realizarPrestamo() {
        if (libro.isPrestado()) {
            System.out.println("El libro ya está prestado.");
        } else {
            libro.prestar();
            System.out.println("Préstamo realizado correctamente.");
        }
    }

    public void devolverLibro(Fecha fechaDev) {
        if (!libro.isPrestado()) {
            System.out.println("Este libro no está prestado actualmente.");
            return;
        }

        this.fechaDevolucion = fechaDev;
        libro.devolver();

        int dias = fechaPrestamo.diasHasta(fechaDevolucion);
        if (dias > 15) {
            lector.marcarMoroso();
            System.out.println("Libro devuelto con retraso. El lector ha sido marcado como moroso.");
        } else {
            System.out.println("Libro devuelto a tiempo.");
        }
    }

    public Lector getLector() {
        return lector;
    }

    public Libro getLibro() {
        return libro;
    }
}
