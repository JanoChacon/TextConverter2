/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textconverter.logic;

import java.util.ArrayList;

/**
 *
 * @author Alejandro
 */
public class Paquete {
    
    private int id;
    private String nombre;
    private ArrayList<Archivo> Archivos;

    public Paquete() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
      
    public Archivo getArchivo(int i){
        return this.Archivos.get(i);
    }    
    
    public int getSize(){
        return this.Archivos.size();
    }
    
    public void addArchivo(Archivo archivo){
        this.Archivos.add(archivo);
    }

    public ArrayList<Archivo> getArchivos() {
        return Archivos;
    }

    public void setArchivos(ArrayList<Archivo> Archivos) {
        this.Archivos = Archivos;
    }
     
    
    
}
