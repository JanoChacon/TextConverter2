/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.dao;

import java.util.ArrayList;
import java.util.List;
import textconverter.logic.Proyecto;

/**
 *
 * @author dci
 */
public interface ProyectoDao {
    /**
     * Permite obtener todos los proyectos
     * @return 
     */
    public ArrayList<Proyecto> listar(String idUsuario);
    
    /**
     * Almacena un objeto de tipo proyecto
     * @param proyecto
     * @return 
     */
    public boolean guardar(Proyecto mesa);
    
    /**
     * Elimina un proyecto a traves de su id
     * @param id
     * @return 
     */
    public boolean borrar(int id);
    
    /**
     * Busca una proyecto en base a un id
     * @param id
     * @return 
     */
    public Proyecto buscar(int id);

    /**
     * Permite editar los datos de un proyecto
     * @param proyecto
     * @return 
     */
    public boolean editar(Proyecto mesa);
}
