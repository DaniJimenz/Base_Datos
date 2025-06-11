/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ficheros;
import java.io.File;
import java.util.Scanner;

/**
 *
 * @author EAG
 */
public class Ficheros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        
        String ruta = "./passwd.txt";
        String ruta2 = "./data/contraseñas.txt";
        
        File Usuario = new File(ruta);
                
        if(Usuario.exists()){
            try{
                Scanner lectura = new Scanner(Usuario);
                lectura.hasNextLine();
                
                String partes;
                String NombreUsuario;
                int numeUsuario;
                String nueNombre;
                int id;
                String dirhome;
                
                while(lectura.hasNextLine())
                partes = lectura.nextLine.split("-");
                numeUsuario++;
                
                System.out.println("Nombre del usuario que quieres encontrar");
                NombreUsuario = sc.nextLine();
                System.out.println("¿Quieres añadir un usuario nuevo? /n/SI /n/NO");
                nueNombre = sc.nextLine();
                if (nueNombre != NombreUsuario) {
                    System.out.println("Usuario registrado de manera correcta");
                }else{
                    System.out.println("Usuario repetido, inténtalo de nuevo");
                }
            }catch{
                
                
            }
        } 
    }    
}
