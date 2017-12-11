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
public class Proyecto {
    
    private int id;
    private String nombre;
    private ArrayList<Paquete> Paquetes = new ArrayList<>();

    public Proyecto() {
    }

    public String getNombre() {
        return nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Paquete getPaquete(int i){
        Paquete pa1 = this.Paquetes.get(i);
        return pa1;
    }    
    
    public void addPaquete(Paquete paq){
        this.Paquetes.add(paq);        
    }
    
    public int getSize(){
        return this.Paquetes.size();
    }

    public ArrayList<Paquete> getPaquetes() {
        return Paquetes;
    }

    public void setPaquetes(ArrayList<Paquete> Paquetes) {
        this.Paquetes = Paquetes;
    }
    
    
    
    public void removePaquete(int i){
        
    }
}
