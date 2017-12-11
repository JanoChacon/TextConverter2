package persistencia.factory;

import javax.servlet.ServletContext;
import persistencia.dao.ArchivoDao;
import persistencia.dao.PaqueteDao;
import persistencia.dao.ProyectoDao;
import persistencia.dao.UsuarioDao;
import persistencia.impl.ArchivoImpl;
import persistencia.impl.PaqueteImpl;
import persistencia.impl.ProyectoImpl;
import persistencia.impl.UsuarioImpl;

public abstract class DAOFactory {

    public static DAOFactory getFactory(TipoBD bd, ServletContext context) {

        switch (bd) {

            case MYSQL:
                return new MysqlDaoFactory(context);
            case ORACLE:
                throw new IllegalArgumentException();
            default:
                throw new IllegalArgumentException();
        }

    }

    public ArchivoDao getArchivoDao() {
        return new ArchivoImpl();
    }

    public PaqueteDao getPaqueteDao() {
        return new PaqueteImpl();
    }

    public ProyectoDao getProyectoDao() {
        return new ProyectoImpl();
    }
    public UsuarioDao getUsuarioDao() {
        return new UsuarioImpl();
    }

}
