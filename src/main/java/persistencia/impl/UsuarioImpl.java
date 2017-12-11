/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.dao.ArchivoDao;
import persistencia.dao.PaqueteDao;
import persistencia.dao.UsuarioDao;
import textconverter.logic.Proyecto;
import persistencia.factory.DAOFactory;
import persistencia.factory.MysqlDaoFactory;
import textconverter.logic.Archivo;
import textconverter.logic.Paquete;
import textconverter.logic.Usuario;

/**
 *
 * @author dci
 */
public class UsuarioImpl implements UsuarioDao {

    /**
     * Consulta sql para obtener todas los paquetes
     */
    private static final String SQL_SELECT = "select * from usuario";

    private static final String SQL_BUSCAR = "select * from usuario where id_usuario = ? and pass = ?";

    private static final String SQL_INSERT = "insert into usuario(id_usuario, pass) values (?, ?)";

    private static final String SQL_DELETE = "delete from usuario where id_usuario = ?";

    private static final String SQL_UPDATE = "update usuario set nombre = ? where id_usuario = ?";

    private final Connection conn;

    public UsuarioImpl() {
        this.conn = MysqlDaoFactory.createConnection();
    }

    @Override
    public ArrayList<Usuario> listar() {

        ArrayList<Usuario> usuarios = new ArrayList<>();
        ResultSet rs;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_SELECT);
            rs = pstm.executeQuery();
            if (!rs.next()) {
                Logger.getLogger(UsuarioImpl.class.getName()).log(Level.INFO,
                        "No hay Archivos");
            } else {

                do {
                    Usuario user = new Usuario();
                    user.setIdUsuario(rs.getString("id_usuario"));
                    user.setPass(rs.getString("pass"));
                    usuarios.add(user);

                } while (rs.next());

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioImpl.class.getName()).log(Level.SEVERE,
                    null, ex);
        }

        return usuarios;
    }

    @Override
    public boolean guardar(Usuario user) {

        boolean resultado = false;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_INSERT);
            pstm.setString(1, user.getIdUsuario());
            pstm.setString(2, user.getPass());
            pstm.executeUpdate();
            resultado = true;

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    @Override
    public boolean borrar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Usuario buscar(String idUsuario, String passwd) {

        Usuario user = null;
        System.out.println(idUsuario);
        System.out.println(passwd);
        ResultSet rs;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_BUSCAR);
            pstm.setString(1, idUsuario);
            pstm.setString(2, passwd);
            rs = pstm.executeQuery();

           if (rs.next()) {
                user = map(rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioImpl.class.getName()).log(Level.SEVERE,
                    null, ex);
        }

        return user;
    }

    @Override
    public boolean editar(Usuario user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static Usuario map(ResultSet resultSet) throws SQLException {
        Usuario user = new Usuario();
        user.setIdUsuario(resultSet.getString("id_usuario"));
        user.setPass(resultSet.getString("pass"));
        return user;
    }
}
