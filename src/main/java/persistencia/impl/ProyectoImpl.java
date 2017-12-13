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
import textconverter.logic.Proyecto;
import persistencia.factory.DAOFactory;
import persistencia.factory.MysqlDaoFactory;
import persistencia.dao.ProyectoDao;

/**
 *
 * @author dci
 */
public class ProyectoImpl implements ProyectoDao {

    /**
     * Consulta sql para obtener todas las mesas
     */
    private static final String SQL_SELECT = "select * from proyecto where id_usuario = ?";

    private static final String SQL_INSERT = "insert into proyecto(nombre, id_usuario) values (?,?)";

    private static final String SQL_DELETE = "delete from proyecto where id_proyecto = ?";

    private static final String SQL_UPDATE = "update proyecto set nombre = ? where id_proyecto = ?";

    private final Connection conn;

    public ProyectoImpl() {
        this.conn = MysqlDaoFactory.createConnection();
    }

    @Override
    public ArrayList<Proyecto> listar(String idUsuario) {

        ArrayList<Proyecto> proyectos = new ArrayList<>();
        ResultSet rs;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_SELECT);
            pstm.setString(1, idUsuario);
            rs = pstm.executeQuery();
            if (!rs.next()) {
                Logger.getLogger(ProyectoImpl.class.getName()).log(Level.INFO,
                        "No hay Proyectos");
            } else {

                do {
                    Proyecto proj = new Proyecto();
                    proj.setNombre(rs.getString("nombre"));
                    proj.setId(rs.getInt("id_proyecto"));
                    proyectos.add(proj);

                } while (rs.next());

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProyectoImpl.class.getName()).log(Level.SEVERE,
                    null, ex);
        }

        return proyectos;
    }

    @Override
    public boolean guardar(Proyecto pro, String idUsuario) {

        boolean resultado = false;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_INSERT);          
            pstm.setString(1, pro.getNombre());
            pstm.setString(2, idUsuario);
            pstm.executeUpdate();
            resultado = true;

        } catch (SQLException ex) {
            Logger.getLogger(ProyectoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
    
    @Override
    public boolean borrar(int id) {

        boolean resultado = false;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_DELETE);          
            pstm.setInt(1, id);
            pstm.executeUpdate();
            resultado = true;

        } catch (SQLException ex) {
            Logger.getLogger(ProyectoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    @Override
    public Proyecto buscar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean editar(Proyecto mesa) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
