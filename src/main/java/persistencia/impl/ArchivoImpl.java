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
import textconverter.logic.Proyecto;
import persistencia.factory.DAOFactory;
import persistencia.factory.MysqlDaoFactory;
import textconverter.logic.Archivo;
import textconverter.logic.Paquete;

/**
 *
 * @author dci
 */
public class ArchivoImpl implements ArchivoDao {

    /**
     * Consulta sql para obtener todas los paquetes
     */
    private static final String SQL_SELECT = "select * from archivo where id_paquete = ?";

    private static final String SQL_INSERT = "insert into archivo(nombre, id_paquete) values (?, ?)";

    private static final String SQL_DELETE = "delete from archivo where id_archivo = ?";

    private static final String SQL_UPDATE = "update archivo set nombre = ? where id_archivo = ?";

    private final Connection conn;

    public ArchivoImpl() {
        this.conn = MysqlDaoFactory.createConnection();
    }

    @Override
    public ArrayList<Archivo> listar(Paquete paq) {

        ArrayList<Archivo> archivos = new ArrayList<>();
        ResultSet rs;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_SELECT);
            pstm.setInt(1, paq.getId());
            rs = pstm.executeQuery();
            if (!rs.next()) {
                Logger.getLogger(ArchivoImpl.class.getName()).log(Level.INFO,
                        "No hay Archivos");
            } else {

                do {
                    Archivo arch = new Archivo();
                    arch.setId(rs.getInt("id_archivo"));
                    arch.setNombre(rs.getString("nombre"));
                    arch.setText(rs.getString("texto"));
                    System.out.println(arch.getNombre());
                    archivos.add(arch);

                } while (rs.next());

            }

        } catch (SQLException ex) {
            Logger.getLogger(ArchivoImpl.class.getName()).log(Level.SEVERE,
                    null, ex);
        }

        return archivos;
    }

    @Override
    public boolean guardar(Archivo arch, int id_paquete) {

        boolean resultado = false;

        try {
            PreparedStatement pstm = this.conn.prepareStatement(SQL_INSERT);
            pstm.setString(1, arch.getNombre());
            pstm.setInt(2, id_paquete);
            pstm.executeUpdate();
            resultado = true;

        } catch (SQLException ex) {
            Logger.getLogger(ArchivoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    @Override
    public boolean borrar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Archivo buscar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean editar(Archivo mesa) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
