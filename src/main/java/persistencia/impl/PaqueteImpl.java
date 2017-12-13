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
import persistencia.dao.PaqueteDao;
import textconverter.logic.Proyecto;
import persistencia.factory.DAOFactory;
import persistencia.factory.MysqlDaoFactory;
import textconverter.logic.Paquete;

/**
 *
 * @author dci
 */
public class PaqueteImpl implements PaqueteDao {

    /**
     * Consulta sql para obtener todas los paquetes
     */
    private static final String SQL_SELECT = "select * from paquete where id_proyecto = ?";

    private static final String SQL_INSERT = "insert into paquete(nombre, id_proyecto) values (?, ?)";

    private static final String SQL_DELETE = "delete from paquete where id_paquete = ?";

    private static final String SQL_UPDATE = "update paquete set nombre = ? where id_paquete = ?";

    private final Connection conn;

    public PaqueteImpl() {
        this.conn = MysqlDaoFactory.createConnection();
    }

    @Override
    public ArrayList<Paquete> listar(Proyecto pro) {

        ArrayList<Paquete> paquetes = new ArrayList<>();
        ResultSet rs;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_SELECT);
            pstm.setInt(1, pro.getId());
            
            rs = pstm.executeQuery();
            if (!rs.next()) {
                Logger.getLogger(PaqueteImpl.class.getName()).log(Level.INFO,
                        "No hay Paquetes");
            } else {

                do {
                    Paquete paq = new Paquete();
                    paq.setNombre(rs.getString("nombre"));
                    paq.setId(rs.getInt("id_paquete"));
                    System.out.println(rs.getString("id_proyecto"));
                    paquetes.add(paq);

                } while (rs.next());

            }

        } catch (SQLException ex) {
            Logger.getLogger(PaqueteImpl.class.getName()).log(Level.SEVERE,
                    null, ex);
        }

        return paquetes;
    }

    @Override
    public boolean guardar(Paquete paq, int proyectoid) {

        boolean resultado = false;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_INSERT);
            pstm.setString(1, paq.getNombre());
            pstm.setInt(2, proyectoid);
            pstm.executeUpdate();
            resultado = true;

        } catch (SQLException ex) {
            Logger.getLogger(PaqueteImpl.class.getName()).log(Level.SEVERE, null, ex);
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
    public Paquete buscar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean editar(Paquete mesa) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
