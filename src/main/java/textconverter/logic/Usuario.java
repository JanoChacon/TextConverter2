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
public class Usuario {
    
     private ArrayList<Proyecto> Proyectos;
     private String idUsuario;
     private String pass;

    public Usuario() {
    }

    public ArrayList<Proyecto> getProyectos() {
        return Proyectos;
    }

    public void setProyectos(ArrayList<Proyecto> Proyectos) {
        this.Proyectos = Proyectos;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }
    

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


     
    
}
