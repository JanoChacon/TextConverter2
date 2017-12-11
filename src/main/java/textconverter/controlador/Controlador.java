package textconverter.controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persistencia.dao.ArchivoDao;
import persistencia.dao.PaqueteDao;
import persistencia.dao.ProyectoDao;
import persistencia.dao.UsuarioDao;
import persistencia.factory.DAOFactory;
import persistencia.factory.TipoBD;
import textconverter.logic.Proyecto;
import textconverter.logic.Usuario;

/**
 *
 * @author Alejandro
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static DAOFactory fabrica;
    Usuario usuario;
    boolean isLoged;

    private ProyectoDao proyectoDao;
    private PaqueteDao paqueteDao;
    private ArchivoDao archivoDao;

    public ArrayList<Proyecto> proyectos;

    @Override
    public void init() throws ServletException {

        Controlador.fabrica = DAOFactory.getFactory(TipoBD.MYSQL,
                this.getServletContext());
        
        proyectoDao = fabrica.getProyectoDao();
        paqueteDao = fabrica.getPaqueteDao();
        archivoDao = fabrica.getArchivoDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ruta = request.getServletPath();

        HttpSession session = request.getSession();

        String destino = "/WEB-INF/vistas/";

        if (ruta.equals("/Ingresar")) {
            destino += "login.jsp";
        }
        if (ruta.equals("/Logearse")) {
            isLoged = validarUsuario(request, session);
            if (isLoged) {
                destino = "ProyectosListar";
            } else {
                request.setAttribute("login", "error");
                destino += "login.jsp";
            }
        }

        if (ruta.equals("/ProyectosListar")) {
            System.out.println("hola "+usuario.getIdUsuario());
            listarDocumentos(usuario);
            request.setAttribute("usuario", usuario);
            request.setAttribute("proyectos", usuario.getProyectos());
            destino += "mostrar_proyectos.jsp";
        }

        if (ruta.equals("/CerrarSession")) {
            cerrarSession(session);
            destino += "login.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean validarUsuario(HttpServletRequest request, HttpSession session)
            throws ServletException, IOException {

        String idUsuario = request.getParameter("user");
        String pass = request.getParameter("passwd");

        UsuarioDao usuarioDao = this.fabrica.getUsuarioDao();
        usuario = usuarioDao.buscar(idUsuario, pass);

        if (usuario != null) {
            session = request.getSession();
            session.setAttribute("usuario", usuario);
            return true;
        } else {
            return false;
        }
    }

    private void cerrarSession(HttpSession session) throws ServletException, IOException {

        if (session.getAttribute("usuario") != null) {
            session.invalidate();
            isLoged = false;
        }
    }

    /**
     *
     * seccion de dao
     * @param usuario
     */
    public void listarDocumentos(Usuario usuario) {
        proyectos = proyectoDao.listar(usuario.getIdUsuario());
        for (int i = 0; i < proyectos.size(); i++) {
            proyectos.get(i).setPaquetes(paqueteDao.listar(proyectos.get(i)));
            for (int j = 0; j < proyectos.get(i).getPaquetes().size(); j++) {
                proyectos.get(i).getPaquetes().get(j).setArchivos(archivoDao.listar(proyectos.get(i).getPaquetes().get(j)));
            }
        }
        usuario.setProyectos(proyectos);
    }
}
