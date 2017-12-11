/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.dao;

import java.util.ArrayList;
import java.util.List;
import textconverter.logic.Usuario;

/**
 *
 * @author dci
 */
public interface UsuarioDao {
    /**
     * Permite obtener todos los usuarios
     * @return 
     */
    public ArrayList<Usuario> listar();
    
    /**
     * Almacena un objeto de tipo archivo
     * @param paq
     * @return 
     */
    public boolean guardar(Usuario usuario);
    
    /**
     * Elimina un usuario a traves de su id
     * @param id
     * @param usuario
     * @return 
     */
    public boolean borrar(int id);
    
    /**
     * Busca un usuario en base a un id
     * @param id
     * @return 
     */
    public Usuario buscar(String idUsuario, String passwd);

    /**
     * Permite editar los datos de un usuario
     * @param id
     * @return 
     */
    public boolean editar(Usuario user);
}
