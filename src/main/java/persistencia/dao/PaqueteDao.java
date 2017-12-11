/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.dao;

import java.util.ArrayList;
import textconverter.logic.Paquete;
import textconverter.logic.Proyecto;

/**
 *
 * @author dci
 */
public interface PaqueteDao {
    /**
     * Permite obtener todas los paquetes
     * @return 
     */
    public ArrayList<Paquete> listar(Proyecto pro);
    
    /**
     * Almacena un objeto de tipo paquete
     * @param pro
     * @return 
     */
    public boolean guardar(Paquete paquete, int proyectoid);
    
    /**
     * Elimina un paquete a traves de su id
     * @param id
     * @return 
     */
    public boolean borrar(int id);
    
    /**
     * Busca un paquete en base a un id
     * @param id
     * @return 
     */
    public Paquete buscar(int id);

    /**
     * Permite editar los datos de un paquete
     * @param paq
     * @return 
     */
    public boolean editar(Paquete paq);
}
