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
public class Fecha {
    
    //Atributos
    
    private int dia;
    private int mes;
    private int anio;

    public Fecha(int dia, int mes, int anio) {
        dia = dia;
        mes = mes;
        anio = anio;
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAnio() {
        return anio;
    }

    public int aDias() {
        return anio * 365 + mes * 30 + dia;
    }

    public int diasHasta(Fecha dev) {
    int dias1 = anio * 365 + mes * 30 + dia;
    int dias2 = dev.anio * 365 + dev.mes * 30 + dev.dia;

    if (dias2 >= dias1) {
        return dias2 - dias1;
    } else {
        return dias1 - dias2;
    }
}
    
    @Override
    public String toString() {
        return dia + "/" + mes + "/" + anio;
    }
}

