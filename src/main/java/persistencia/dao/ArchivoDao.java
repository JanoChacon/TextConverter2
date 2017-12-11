/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.dao;

import java.util.ArrayList;
import java.util.List;
import textconverter.logic.Archivo;
import textconverter.logic.Paquete;

/**
 *
 * @author dci
 */
public interface ArchivoDao {
    /**
     * Permite obtener todos los arhivos del paquete
     * @return 
     */
    public ArrayList<Archivo> listar(Paquete paq);
    
    /**
     * Almacena un objeto de tipo archivo
     * @param paq
     * @return 
     */
    public boolean guardar(Archivo archivo, int id);
    
    /**
     * Elimina un arhcivo a traves de su id
     * @param id
     * @param Archivo
     * @return 
     */
    public boolean borrar(int id);
    
    /**
     * Busca un arhivo en base a un id
     * @param id
     * @return 
     */
    public Archivo buscar(int id);

    /**
     * Permite editar los datos de un archivo
     * @param paq
     * @return 
     */
    public boolean editar(Archivo arch);
}
