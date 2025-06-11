/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package escuela_prog;

/**
 *
 * @author EAG
 */
public class Curso {
    
    //Atributos
    private String nombre;
    private int aula;
    private int anio;
    private Asignatura[] asignaturas = new Asignatura[5];
    private int precio;
    private int alumnotope = 0;
    private Alumno[] alumnos = new Alumno[30];
    
    
    //Constructores
    public Curso(String n, int au, int an, int p){
        nombre = n;
        aula = au;
        anio = an;
        precio = p;
        
    }
    
    public Curso(int au, Curso c){
        nombre = c.nombre;
        anio = c.anio;
        aula = au;
        precio = c.precio;
        asignaturas = c.asignaturas;
    }

    //Métodos GET/SET
    
    public String getNombre(){
        return nombre;
    }
    public int getClase(){
        return aula;
    }
    public int getAnio(){
        return anio;
    }
    public Asignatura[] getAsignaturas(){
        return asignaturas;
    }
    
    public void setNombre( String n ){
        nombre = n;
    }
    public void setClase( int au){
        aula = au;
    }
    public void setAnio( int a ){
        anio = a;
    }
    public void setAsignaturas( Asignatura[] as ){
        asignaturas = as;
    }
    
    public double ingresoTo(){
        double totalIngresos = 0;
        for (int i = 0; i < totalIngresos; i++) {
            System.out.println("El ingreso total es de " + totalIngresos);
            
        }
        return totalIngresos;
    }
    
    public void agregarAlumno(Alumno nuevoAlumno) {
        if (alumnotope < 30) {
            alumnos[alumnotope++] = nuevoAlumno;
        } else {
            System.out.println("No se pueden añadir más alumnos a este curso");
        }
    }

    public float calcularIngresos(int mes) {
        float total = 0;
        float cuotaMensual = (precio / 9) * mes;

        for (int i = 0; i < alumnos.length; i++) {
            if (alumnos[i] != null) {
                if (alumnos[i].getPago()) {
                    total += precio;
                } else {
                    total += cuotaMensual;
                }
            }
        }

        for (int i = 0; i < asignaturas.length; i++) {
            total -= asignaturas[i].getHorasem() * 4 * asignaturas[i].getProfesor().getSalario() * mes;
        }
        return total;
    }
    public boolean CursoImpartir() {
        for (int i = 0; i < asignaturas.length; i++) {
            if (asignaturas[i].getProfesor() == null) {
                return false;
            }
        }
        int cantidadAlumnos = 0;
        for (int i = 0; i < alumnos.length; i++) {
            if (alumnos[i] != null) {
                cantidadAlumnos++;
            }
        }
        return cantidadAlumnos >= 10;
        }

        public String Volcado(){
        String resultado = "";

        resultado += anio + "-";
        resultado += nombre + "-";

        boolean primeraAsignatura = true;
        for (int i = 0; i < asignaturas.length; i++) {
            if (asignaturas[i] != null) {
                if (!primeraAsignatura) {
                    resultado += ":";
                }
                resultado += asignaturas[i].getNombre();
                primeraAsignatura = false;
            }
        }

        resultado += "-";



        boolean primerAlumno = true;
        for (int i = 0; i < alumnotope; i++) {
            if (alumnos[i] != null) {
                if (!primerAlumno) {
                    resultado += ":";
                }
                resultado += alumnos[i].getNombre();
                primerAlumno = false;
            }
        }

        return resultado;
    }
    
    public void setAlumno(Alumno a){
        if (alumnotope < 30) {
            alumnos[alumnotope]= a;
            String[] asi= new String[5];
            for (int i = 0; i < 5; i++) {
                asi[i] = asignaturas[i].getNombre();
    
            }
            alumnos[alumnotope].setNota(asi);
            alumnotope ++;
        }else System.out.println("No se pueden introducir más alumnos");
    }
}
        