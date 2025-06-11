/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package escuela_prog;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
/**
 *
 * @author EAG
 */
public class Escuela_Prog {

    /**
     * @param args the command line arguments
     */
    private static Scanner sc = new Scanner(System.in);
    
    private static final String DATA_DIR = "data/";
    private static final String CURSOS_FILE = DATA_DIR + "cursos.txt";
    private static final String ASIGNATURAS_FILE = DATA_DIR + "asignaturas.txt";
    private static final String PROFESORES_FILE = DATA_DIR + "profesores.txt";
    private static final String ALUMNOS_FILE = DATA_DIR + "alumnos.txt";
    
    public static void main(String[] args) {
        File dataDir = new File(DATA_DIR);
        if (!dataDir.exists()) {
            dataDir.mkdir();
        }
        
        System.out.println("// GESTIÓN DE LA ESCUELA \\\\");
        System.out.println("//          EAG          \\\\");
        
        int aulas = crearEscuela();
        Asignatura[] asignaturas = new Asignatura[aulas * 5];
        int topeasignatura = 0;
        Curso[] cursos = new Curso[aulas];
        int topecurso = 0;
        Docente[] docentes = new Docente[aulas * 5];
        int topeDocente = 0;
        Alumno[] alumnos = new Alumno[aulas * 30];
        int topeAlumno = 0;
        
        System.out.println("\n¿Desea cargar los datos guardados? (1. Sí / 2. No)");
        int cargar = comprobarOpcion(1, 2);
        
        if (cargar == 1) {
            aulas = 20; 
            asignaturas = new Asignatura[aulas * 5];
            cursos = new Curso[aulas];
            docentes = new Docente[aulas * 5];
            alumnos = new Alumno[aulas * 30];
            
            while (topeasignatura < asignaturas.length && asignaturas[topeasignatura] != null) {
                topeasignatura++;
            }
            while (topecurso < cursos.length && cursos[topecurso] != null) {
                topecurso++;
            }
            while (topeDocente < docentes.length && docentes[topeDocente] != null) {
                topeDocente++;
            }
            while (topeAlumno < alumnos.length && alumnos[topeAlumno] != null) {
                topeAlumno++;
            }
            
            System.out.println("\nDatos cargados correctamente.");
        } else {
            aulas = crearEscuela();
            asignaturas = new Asignatura[aulas * 5];
            cursos = new Curso[aulas];
            docentes = new Docente[aulas * 5];
            alumnos = new Alumno[aulas * 30];
        }
        
        int opt;
        do {
    System.out.println("\nMenú de opciones:");
    System.out.println("1. Registrar Alumnos");
    System.out.println("2. Registrar Docentes");
    System.out.println("3. Registrar Asignaturas");
    System.out.println("4. Registrar Cursos");
    System.out.println("5. Calcular Ganancias");
    System.out.println("6. Mostrar Datos");
    System.out.println("7. Asignar Notas");
    System.out.println("8. Ver Boletín de Notas");
    System.out.println("9. Guardar Datos");
    System.out.println("10. Asignar alumnos a curso");
    System.out.println("11. Salir");
    
    opt = comprobarOpcion(1, 11);
    
    switch (opt) {
        case 1:
            if (topeAlumno < alumnos.length) {
                topeAlumno = registrarAlumnos(topeAlumno, alumnos, aulas);
            } else {
                System.out.println("\n Plazas de alumnos completas");
            }
            break;
        case 2:
            if (topeDocente < docentes.length) {
                topeDocente = añadirDocente(topeDocente, docentes, aulas);
            } else {
                System.out.println("\n Plazas de docentes completas");
            }
            break;
        case 3:
            if (topeasignatura < asignaturas.length) {
                topeasignatura = registrarAsignatura(topeasignatura, asignaturas, aulas);
            } else {
                System.out.println("\n Asignaturas completas");
            }
            break;
        case 4:
            if (topecurso < cursos.length) {
                if (topeasignatura < 5) {
                    System.out.println("\n Insuficientes asignaturas para crear un curso");
                } else {
                    topecurso = registrarCurso(topecurso, cursos, aulas, asignaturas, topeasignatura);
                }
            } else {
                System.out.println("\n Cursos completos");
            }
            break;
        case 5:
            calcularGanancias(cursos, topecurso);
            break;
        case 6:
            mostrarDatos(alumnos, topeAlumno, docentes, topeDocente, asignaturas, topeasignatura, cursos, topecurso);
            break;
        case 7:
            asignarNotas(alumnos, topeAlumno, asignaturas, topeasignatura);
            break;
        case 8:
            verBoletin(alumnos, topeAlumno);
            break;
        case 9:
            System.out.println("\n¿Desea guardar los datos? (1. Sí / 2. No)");
            int guardar = comprobarOpcion(1, 2);
            if (guardar == 1) {
                guardarDatos(cursos, topecurso, asignaturas, topeasignatura, docentes, topeDocente, alumnos, topeAlumno, aulas);
            }
            break;
        case 10:
            asignarAlumno(alumnos, topeAlumno, cursos, topecurso);
            break;
        case 11:
            System.out.println("\n¿Desea guardar los datos antes de salir? (1. Sí / 2. No)");
            int guardarSalir = comprobarOpcion(1, 2);
            if (guardarSalir == 1) {
                guardarDatos(cursos, topecurso, asignaturas, topeasignatura, docentes, topeDocente, alumnos, topeAlumno, aulas);
            }
            System.out.println("\nSaliendo del programa...");
            break;
            }
        } while (opt != 11);
    }
    
    public static void guardarDatos(Curso[] cursos, int topeCurso, Asignatura[] asignaturas, int topeAsignatura,
    Docente[] docentes, int topeDocente, Alumno[] alumnos, int topeAlumno, int aulas) {
    try {
        
        File dataDir = new File(DATA_DIR);
        if (!dataDir.exists()) {
            dataDir.mkdir();
        }

        FileWriter fw = new FileWriter(CURSOS_FILE);
        fw.write(String.valueOf(aulas) + "\n");
        for (int i = 0; i < topeCurso; i++) {
            if (cursos[i] != null) {
                fw.write(cursos[i].Volcado() + "\n");
            }
        }
        fw.close();

        fw = new FileWriter(ASIGNATURAS_FILE);
        for (int i = 0; i < topeAsignatura; i++) {
            if (asignaturas[i] != null) {
                fw.write(asignaturas[i].Volcado() + "\n");
            }
        }
        fw.close();

        fw = new FileWriter(PROFESORES_FILE);
        for (int i = 0; i < topeDocente; i++) {
            if (docentes[i] != null) {
                fw.write(docentes[i].Volcado() + "\n");
            }
        }
        fw.close();

        fw = new FileWriter(ALUMNOS_FILE);
        for (int i = 0; i < topeAlumno; i++) {
            if (alumnos[i] != null) {
                fw.write(alumnos[i].Volcado() + "\n");
            }
        }
        fw.close();

        System.out.println("\nDatos guardados correctamente.");
    } catch (IOException e) {
        System.out.println("Error al guardar los datos: " + e.getMessage());
    }
}
    
    public static int cargarProfesores(Docente[] docentes) throws IOException {
    int contador = 0;
    File archivo = new File(PROFESORES_FILE);
    if (archivo.exists()) {
        FileReader fr = new FileReader(archivo);
        StringBuilder linea = new StringBuilder();
        int caracter;
        while ((caracter = fr.read()) != -1 && contador < docentes.length) {
            if (caracter != '\n' && caracter != '\r') {
                linea.append((char) caracter);
            } else {
                if (linea.length() > 0) {
                    String[] datos = linea.toString().split("-");
                    if (datos.length >= 4) {
                        String dni = datos[0];
                        String nombre = datos[1];
                        int horas = Integer.parseInt(datos[2]);
                        float salario = Float.parseFloat(datos[3]);

                        Docente d = new Docente(nombre, dni, salario, horas);
                        docentes[contador++] = d;
                    }
                }
            }
        }
        
        if (linea.length() > 0 && contador < docentes.length) {
            String[] datos = linea.toString().split("-");
            if (datos.length >= 4) {
                String dni = datos[0];
                String nombre = datos[1];
                int horas = Integer.parseInt(datos[2]);
                float salario = Float.parseFloat(datos[3]);

                Docente d = new Docente(nombre, dni, salario, horas);
                docentes[contador++] = d;
            }
        }
        fr.close();
    }
    return contador;
}
    
    public static int cargarAsignaturas(Asignatura[] asignaturas, Docente[] docentes, int topeDocente) throws IOException {
        int contador = 0;
        File archivo = new File(ASIGNATURAS_FILE);
        if (archivo.exists()) {
            FileReader fr = new FileReader(archivo);
            StringBuilder linea = new StringBuilder();
            int caracter;
            while ((caracter = fr.read()) != -1 && contador < asignaturas.length) {
                if (caracter != '\n' && caracter != '\r') {
                    linea.append((char) caracter);
                } else if (linea.length() > 0) {
                    LineaAsignatura(linea.toString(), asignaturas, docentes, topeDocente, contador);
                    contador++;
                    linea.setLength(0);
                }
            }
            
            if (linea.length() > 0 && contador < asignaturas.length) {
                LineaAsignatura(linea.toString(), asignaturas, docentes, topeDocente, contador);
                contador++;
            }
            fr.close();
        }
        return contador;
    }
    
    private static void LineaAsignatura(String linea, Asignatura[] asignaturas, Docente[] docentes, 
                                             int topeDocente, int contador) {
        String[] datos = linea.split("-");
        if (datos.length >= 3) {
            int id = Integer.parseInt(datos[0]);
            String nombre = datos[1];
            int horas = Integer.parseInt(datos[2]);
            
            Asignatura a = new Asignatura(id, nombre, horas);
            if (datos.length > 3 && !datos[3].isEmpty()) {
                String dniProfesor = datos[3];
                for (int i = 0; i < topeDocente; i++) {
                    if (docentes[i] != null && docentes[i].getDni().equals(dniProfesor)) {
                        a.setProfesor(docentes[i]);
                        break;
                    }
                }
            }
            asignaturas[contador] = a;
        }
    }
    
    public static int cargarAlumnos(Alumno[] alumnos) throws IOException {
        int contador = 0;
        File archivo = new File(ALUMNOS_FILE);
        if (archivo.exists()) {
            FileReader fr = new FileReader(archivo);
            StringBuilder linea = new StringBuilder();
            int caracter;
            while ((caracter = fr.read()) != -1 && contador < alumnos.length) {
                if (caracter != '\n' && caracter != '\r') {
                    linea.append((char) caracter);
                } else if (linea.length() > 0) {
                    String[] datos = linea.toString().split("-");
                    if (datos.length >= 3) {
                        String dni = datos[0];
                        String nombre = datos[1];
                        boolean pago = datos[2].equals("true");
                        
                        Alumno a = new Alumno(dni, nombre, "", pago);
                        alumnos[contador++] = a;
                    }
                    linea.setLength(0);
                }
            }
            
            if (linea.length() > 0 && contador < alumnos.length) {
                String[] datos = linea.toString().split("-");
                if (datos.length >= 3) {
                    String dni = datos[0];
                    String nombre = datos[1];
                    boolean pago = datos[2].equals("true");
                    
                    Alumno a = new Alumno(dni, nombre, "", pago);
                    alumnos[contador++] = a;
                }
            }
            fr.close();
        }
        return contador;
    }
    
    public static int cargarCursos(Curso[] cursos, Asignatura[] asignaturas, Alumno[] alumnos) throws IOException {
    int contador = 0;
    File archivo = new File(CURSOS_FILE);
    
    if (!archivo.exists()) {
        return 0;
    }
    Scanner scanner = null;
    try {
        scanner = new Scanner(archivo);
        
        int aulas = Integer.parseInt(scanner.nextLine());
        
        while (scanner.hasNextLine() && contador < cursos.length) {
            String[] datos = scanner.nextLine().split("-");
            if (datos.length >= 3) {
                int anio = Integer.parseInt(datos[0]);
                String nombre = datos[1];
                int precio = 800;
                
                Curso c = new Curso(nombre, contador + 1, anio, precio);
                
                if (!datos[2].isEmpty()) {
                    String[] asigIds = datos[2].split(":");
                    Asignatura[] asigsCurso = new Asignatura[5];
                    
                    for (int i = 0; i < asigIds.length && i < asigsCurso.length; i++) {
                        int id = Integer.parseInt(asigIds[i]);
                        for (Asignatura asig : asignaturas) {
                            if (asig != null && asig.getId() == id) {
                                asigsCurso[i] = asig;
                                break;
                            }
                        }
                    }
                    c.setAsignaturas(asigsCurso);
                }
                
                if (datos.length > 3 && !datos[3].isEmpty()) {
                    String[] alumIds = datos[3].split(":");
                    for (String dni : alumIds) {
                        for (Alumno alu : alumnos) {
                            if (alu != null && alu.getDni().equals(dni)) {
                                c.agregarAlumno(alu);
                                break;
                            }
                        }
                    }
                }
                cursos[contador++] = c;
            }
        }
    } finally {
        if (scanner != null) {
            scanner.close();
        }
    }
    return contador;
}
            
    public static int crearEscuela() {
        System.out.println("\nCuántas aulas tiene tu escuela:");
        return comprobarOpcion(2,20);
    }

    public static int comprobarOpcion(int min, int max) {
        int opt;
        do {
            System.out.print("");
            while (!sc.hasNextInt()) {
                System.out.println("Introduce un número válido");
                sc.next();
            }
            opt = sc.nextInt();
            if (opt < min || opt > max) {
                System.out.println("No válido");
            }
        } while (opt < min || opt > max);
        return opt;
    }

    public static int registrarAlumnos(int total, Alumno[] lista, int maxAulas) {
    System.out.println("\nNúmero de alumnos a registrar:");
    int cantidad = comprobarOpcion(1, maxAulas * 30 - total);

    for (int i = 0; i < cantidad; i++) {
        sc.nextLine(); 
        System.out.println("\nDatos del alumno " + (total + 1) + ":");
        System.out.print("Nombre: ");
        String nombre = sc.nextLine();
        System.out.print("Apellidos: ");
        String apellido = sc.nextLine();
        System.out.print("DNI: ");
        String dni = sc.next();
        System.out.println("Método de pago: 1. Pago único | 2. Mensualidades");
        int tipoPago = comprobarOpcion(1, 2);

        if (tipoPago == 1) {
            lista[total++] = new AlumnoPUnico(dni, nombre, apellido);
        } else {
            lista[total++] = new AlumnoPPlazos(dni, nombre, apellido);
        }
    }
    return total;
}
    
    public static int registrarAsignatura(int tope, Asignatura[] asignaturas, int aulas){ 
        System.out.println("");
        System.out.println("Cuantas asignaturas vas a introducir:");
        int opt = comprobarOpcion(1, aulas*5-tope);
        
        for (int i = 0; i < opt; i++) {
            sc.nextLine();
            System.out.println("");
            System.out.println("Introduce el nombre de la asignatura:");
            System.out.print(""); String nombre = sc.nextLine();
            System.out.println("Introduce las horas semanales de la asignatura:");
            System.out.print(""); int horas = sc.nextInt();
            
            Asignatura a = new Asignatura (tope, nombre, horas);
            asignaturas[tope] = a;
            tope++;
        }
        return tope;
    }
    

    public static void calcularGanancias(Curso[] cursos, int totalCursos) {
        float ganancia = 0;
        System.out.println("\nCuántos meses han pasado desde septiembre:");
        int mes = comprobarOpcion(1, 9);
        for (int i = 0; i < totalCursos; i++) {
            ganancia += cursos[i].calcularIngresos(mes);
        }
        System.out.println("\nLas ganancias brutas de la escuela son: " + ganancia + "€");
    }
    
    public static int registrarCurso(int tope, Curso[] cursos, int aulas, Asignatura[] asignaturas,
    int tope_asignaturas){ 
        System.out.println("");
        System.out.println("Cuantos cursos vas a introducir:");
        int opt = comprobarOpcion(1,aulas-tope);
        
        for (int i = 0; i < opt; i++) {
            sc.nextLine();
            System.out.println("");
            System.out.println("Introduce el nombre del curso:");
            System.out.print(""); String nombre = sc.nextLine();
            System.out.println("Introduce el año del curso:");
            int anio = comprobarOpcion(1,2);
            System.out.println("Introduce el precio del curso:");
            System.out.print(""); int precio = sc.nextInt();
            
            
            Curso c = new Curso (nombre,anio,tope+1,precio);
            cursos[tope] = c;
            tope++;
            
            
            Asignatura[] as = new Asignatura[5];
            System.out.println("Elige las asignaturas del curso");
            enseñarAsignaturas(asignaturas,tope_asignaturas);
            for (int j = 0; j < 5; j++) {
                int n = comprobarOpcion(1,tope_asignaturas);
                as[j] = asignaturas[n-1];
            }
            c.setAsignaturas(as);
        }
        
        
        
        return tope;
    }
    public static int añadirDocente(int tope, Docente[] docentes, int aulas) {
    System.out.println("\nCuantos docentes vas a introducir:");
    int opt = comprobarOpcion(1, aulas * 5 - tope);
    
    for (int i = 0; i < opt; i++) {
        sc.nextLine();
        System.out.println("\nTipo de docente:");
        System.out.println("1. Docente normal");
        System.out.println("2. Docente auxiliar");
        int tipo = comprobarOpcion(1, 2);
        
        System.out.println("Nombre del profesor:");
        String nombre = sc.nextLine();
        System.out.println("DNI del profesor:");
        String dni = sc.next();
        System.out.println("Sueldo/hora (minimo 10€):");
        float sueldo = sc.nextFloat();
        if (sueldo < 10) sueldo = 10.f;
        
        if (tipo == 1) {
            docentes[tope] = new Docente(dni, nombre, sueldo);
        } else {
            docentes[tope] = new Auxiliar(nombre, dni);
            docentes[tope].setSalario(sueldo);
        }
        tope++;
    }
    return tope;
}
    
    public static void asignarNotas(Alumno[] alumnos, int totalAlumnos, 
                               Asignatura[] asignaturas, int totalAsignaturas) {
    if (totalAlumnos == 0) {
        System.out.println("No hay alumnos registrados");
        return;
    }
    
    System.out.println("\nSeleccionar alumno:");
    for (int i = 0; i < totalAlumnos; i++) {
        System.out.println((i + 1) + ". " + alumnos[i].getNombre());
    }
    
    int alumnoSeleccionado = comprobarOpcion(1, totalAlumnos) - 1;
    
    System.out.println("\nSeleccionar asignatura:");
    for (int i = 0; i < totalAsignaturas; i++) {
        System.out.println((i + 1) + ". " + asignaturas[i].getNombre());
    }
    
    int asignaturaSeleccionada = comprobarOpcion(1, totalAsignaturas) - 1;
    
    System.out.println("Introducir nota (0-10):");
    float nota = sc.nextFloat();
    while (nota < 0 || nota > 10) {
        System.out.println("Nota debe estar entre 0 y 10:");
        nota = sc.nextFloat();
    }
    
    alumnos[alumnoSeleccionado].añadirNota(asignaturas[asignaturaSeleccionada].getNombre(), nota);
    System.out.println("Nota asignada correctamente");
}
    
    public static void verBoletin(Alumno[] alumnos, int totalAlumnos) {
    if (totalAlumnos == 0) {
        System.out.println("No hay alumnos registrados");
        return;
    }
    
    System.out.println("\nSeleccionar alumno:");
    for (int i = 0; i < totalAlumnos; i++) {
        System.out.println((i + 1) + ". " + alumnos[i].getNombre());
    }
    
    int alumnoSeleccionado = comprobarOpcion(1, totalAlumnos) - 1;
    Alumno alumno = alumnos[alumnoSeleccionado];
    
    System.out.println("\n BOLETÍN DE NOTAS ");
    System.out.println("Alumno: " + alumno.getNombre() + " " + alumno.getApellidos());
    System.out.println("DNI: " + alumno.getDni());
    System.out.println("\nNotas:");
    
    alumno.getNota();
}
    public static void enseñarAsignaturas(Asignatura[] asignaturas, int tope){ 
        System.out.println("");
        for (int i = 0; i < tope; i++) {
            System.out.println((i+1)+": "+asignaturas[i].getNombre()+"  | Horas Semanales: "+asignaturas[i].getHorasem());
        }
    }
    public static void mostrarDatos(Alumno[] alumnos, int totalAlumnos, Docente[] docentes, int totalDocentes,
                                    Asignatura[] asignaturas, int totalAsignaturas, Curso[] cursos, int totalCursos) {
        System.out.println("\nSeleccione qué datos desea ver:");
        System.out.println("1. Alumnos\n2. Docentes\n3. Asignaturas\n4. Cursos");
        int opcion = comprobarOpcion(1, 4);
        
        switch (opcion) {
            case 1:
                for (int i = 0; i < totalAlumnos; i++) {
                    System.out.println(alumnos[i]);
                }
                break;
            case 2:
                for (int i = 0; i < totalDocentes; i++) {
                    System.out.println(docentes[i]);
                }
                break;
            case 3:
                for (int i = 0; i < totalAsignaturas; i++) {
                    System.out.println(asignaturas[i]);
                }
                break;
            case 4:
                for (int i = 0; i < totalCursos; i++) {
                    System.out.println(cursos[i]);
                }
                break;
        }
    }

    private static void asignarAlumno(Alumno[] alumnos, int topeAlumno, Curso[] cursos, int topecurso) {
        System.out.println("Elige un curso");
        for (int i = 0; i < topecurso; i++) {
            System.out.println((i + 1)+": " +cursos[i].getNombre());
            
        }
        int cursoSeleccionado = comprobarOpcion(1,topecurso)-1;
        
        System.out.println("Elige un alumno");
        for (int i = 0; i < topeAlumno; i++) {
            System.out.println((i + 1)+": " +alumnos[i].getNombre());
            
        }
        int alumnoSeleccionado = comprobarOpcion(1, topeAlumno) -1;
        
        cursos[cursoSeleccionado].setAlumno(alumnos[alumnoSeleccionado]);
    }
}

