/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ficheros;

/**
 *
 * @author EAG
 */
public class Usuario {
    
    public String Nombre;
    public int ID;
    public int DirectorioHome;
    public String Interprete;
    
    //Constructor//

    public Usuario(String NombreUsuario, int id, int dirHome, String interprete) {
        this.Nombre = NombreUsuario;
        this.ID = id;
        this.DirectorioHome = dirHome;
        this.Interprete = interprete;
    }
    

    //Getter//
    
    public String getNombre() {
        return Nombre;
    }

    public int getID() {
        return ID;
    }

    public int getDirectorioHome() {
        return DirectorioHome;
    }

    public String getInterprete() {
        return Interprete;
    }
    
    //setter//

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setDirectorioHome(int DirectorioHome) {
        this.DirectorioHome = DirectorioHome;
    }

    public void setInterprete(String Interprete) {
        this.Interprete = Interprete;
    }
    
    public void interprete(){
         
          
    }
    
    @Override
    public String toString() {
        return "Usuario(" + "Nombre=" + Nombre + ", ID=" + ID + ", DirectorioHome=" + DirectorioHome + ", Interprete=" + Interprete + ')';
    }
}
