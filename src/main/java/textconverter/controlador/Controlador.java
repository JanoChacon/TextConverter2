package textconverter.controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import cl.textconwebservice.ConversorService;
import cl.textconwebservice.ConversorService_Service;
import java.io.DataInputStream;
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
import javax.servlet.http.Part;
import persistencia.dao.ArchivoDao;
import persistencia.dao.PaqueteDao;
import persistencia.dao.ProyectoDao;
import persistencia.dao.UsuarioDao;
import persistencia.factory.DAOFactory;
import persistencia.factory.TipoBD;
import textconverter.logic.Archivo;
import textconverter.logic.Paquete;
import textconverter.logic.Proyecto;
import textconverter.logic.Tipo;
import textconverter.logic.Usuario;

/**
 *
 * @author Alejandro
 */
@javax.servlet.annotation.MultipartConfig
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

    ConversorService_Service cliente;

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
            RequestDispatcher rd = request.getRequestDispatcher(destino + "login.jsp");
            rd.forward(request, response);

        }
        if (ruta.equals("/Logearse")) {
            validarUsuario(request, response, session);
        }

        if (ruta.equals("/Registrar")) {
            crearUsuario(request, response, session);
        }

        if (ruta.equals("/ProyectosListar") && detectarLogin(request, response, session)) {
            listarDocumentos(usuario);
            request.setAttribute("usuario", usuario);
            request.setAttribute("proyectos", usuario.getProyectos());
            RequestDispatcher rd = request.getRequestDispatcher(destino + "mostrar_proyectos.jsp");
            rd.forward(request, response);
        }

        if (ruta.equals("/CrearProyecto") && detectarLogin(request, response, session)) {
            crearProyecto(request, response);
        }

        if (ruta.equals("/BorrarProyecto") && detectarLogin(request, response, session)) {
            borrarProyecto(request, response);
        }

        if (ruta.equals("/CrearPaquete") && detectarLogin(request, response, session)) {
            crearPaquete(request, response);
        }

        if (ruta.equals("/BorrarPaquete") && detectarLogin(request, response, session)) {
            borrarPaquete(request, response);
        }

        if (ruta.equals("/SubirArchivo") && detectarLogin(request, response, session)) {
            subirArchivo(request, response);
        }
        
        if (ruta.equals("/BorrarArchivo") && detectarLogin(request, response, session)) {
            borrarArchivo(request, response);
        }

        if (ruta.equals("/MostrarTexto") && detectarLogin(request, response, session)) {
            extraerContenido(request, response);
            RequestDispatcher rd = request.getRequestDispatcher("ProyectosListar");
            rd.forward(request, response);
        }

        if (ruta.equals("/CerrarSession")&& detectarLogin(request, response, session)) {
            cerrarSession(session);
            RequestDispatcher rd = request.getRequestDispatcher(destino += "login.jsp");
            rd.forward(request, response);
        }
        else{
           ruta.equals("/Ingresar");
        }

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

    private void validarUsuario(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        RequestDispatcher dispatcher;

        String idUsuario = request.getParameter("user");
        String pass = request.getParameter("passwd");

        UsuarioDao usuarioDao = this.fabrica.getUsuarioDao();
        usuario = usuarioDao.buscar(idUsuario, pass);

        if (usuario != null) {
            session = request.getSession();
            session.setAttribute("usuario", usuario);
            isLoged = true;
            response.sendRedirect("ProyectosListar");
        } else {
            request.setAttribute("login", "error");
            dispatcher = request.getRequestDispatcher("/WEB-INF/vistas/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void crearUsuario(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        RequestDispatcher dispatcher;

        String idUsuario = request.getParameter("nuevoIdUsuario");
        String pass = request.getParameter("nuevapass");

        UsuarioDao usuarioDao = this.fabrica.getUsuarioDao();
        Usuario usuario = usuarioDao.buscar(idUsuario, pass);
        Usuario usuario2 = new Usuario();

        if (usuario != null) {
            request.setAttribute("reg", "error");
            dispatcher = request.getRequestDispatcher("/WEB-INF/vistas/login.jsp");
            dispatcher.forward(request, response);
        } else {

            usuario2.setIdUsuario(idUsuario);
            usuario2.setPass(pass);

            usuarioDao.guardar(usuario2);

            request.setAttribute("reg", "registrado");
            dispatcher = request.getRequestDispatcher("/WEB-INF/vistas/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void cerrarSession(HttpSession session) throws ServletException, IOException {
        if (session.getAttribute("usuario") != null) {
            session.invalidate();
            isLoged = false;
        }
    }
    
        private boolean detectarLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        if (session == null || !isLoged || session.getAttribute("usuario") == null ) {
            RequestDispatcher dispatcher;
            request.setAttribute("logueado", "incorrecto");
            dispatcher = request.getRequestDispatcher("ingresar");
            dispatcher.forward(request, response);
            return false;
        } else {
            return true;
        }
    }

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

    public int buscarProyecto(int id) {
        int index = -1;
        proyectos = proyectoDao.listar(usuario.getIdUsuario());
        for (int i = 0; i < proyectos.size(); i++) {
            if (proyectos.get(i).getId() == id) {
                index = i;
            }
        }
        return index;
    }

    public void crearProyecto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProyectoDao proyectoDao = this.fabrica.getProyectoDao();
        Proyecto pro = new Proyecto();
        pro.setNombre(request.getParameter("nombreProyecto"));
        proyectos.add(pro);

        if (proyectoDao.guardar(pro, usuario.getIdUsuario())) {
            request.setAttribute("creadoValido", "valido");
        } else {
            request.setAttribute("creadoValido", "invalido");
        }
        response.sendRedirect("ProyectosListar");
    }

    public void borrarProyecto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProyectoDao proyectoDao = this.fabrica.getProyectoDao();

        if (proyectoDao.borrar(Integer.parseInt(request.getParameter("idProyecto")))) {
            request.setAttribute("borradoValido", "valido");
        } else {
            request.setAttribute("borradoValido", "invalido");
        }
        response.sendRedirect("ProyectosListar");

    }

    private void crearPaquete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PaqueteDao paqueteDao = (PaqueteDao) this.fabrica.getPaqueteDao();
        Paquete paq = new Paquete();

        paq.setNombre(request.getParameter("nombrePaquete"));

        if (paqueteDao.guardar(paq, Integer.parseInt(request.getParameter("idProyecto")))) {
            request.setAttribute("paqueteCreado", "valido");
        } else {
            request.setAttribute("paqueteCreado", "invalido");
        }
        response.sendRedirect("ProyectosListar");
    }

    public void borrarPaquete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PaqueteDao paqueteDao = (PaqueteDao) this.fabrica.getPaqueteDao();

        if (paqueteDao.borrar(Integer.parseInt(request.getParameter("idPaquete")))) {
            request.setAttribute("borradoValido", "valido");
        } else {
            request.setAttribute("borradoValido", "invalido");
        }
        response.sendRedirect("ProyectosListar");

    }

    public void subirArchivo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        cliente = new ConversorService_Service();
        //Se obtiene la conexion con el SOAP
        ConversorService service = cliente.getConversorServicePort();
        String nombreArchivo = "";
        Part archivoPart = request.getPart("archivo");
        nombreArchivo = request.getParameter("nombreArchivo");

        ArchivoDao archivoDao = (ArchivoDao) this.fabrica.getArchivoDao();
        Archivo arch = new Archivo();

        arch.setNombre(nombreArchivo);

        int archivoSize = (int) archivoPart.getSize();
        byte[] archivo = null; //el buffer

        if (archivoSize > 0) {
            archivo = new byte[archivoSize];
            try (DataInputStream dis = new DataInputStream(archivoPart.getInputStream())) {
                dis.readFully(archivo);
                String result = service.convertidorGlobal(archivo, nombreArchivo);

                arch.setText(result);
            }
        }

        if (archivoDao.guardar(arch, Integer.parseInt(request.getParameter("idPaquete")))) {
            request.setAttribute("creadoValido", "valido");
        } else {
            request.setAttribute("creadoValido", "invalido");
        }
        response.sendRedirect("ProyectosListar");

    }

    public String extraerContenido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArchivoDao archivoDao = (ArchivoDao) this.fabrica.getArchivoDao();
        int id = Integer.parseInt(request.getParameter("idArchivo"));
        Archivo archivo = archivoDao.buscar(id);;
        if (archivo != null) {
            request.setAttribute("extraidoValido", "valido");
        } else {
            request.setAttribute("extraidoValido", "invalido");
        }
        request.setAttribute("tituloTexto", archivo.getNombre());
        request.setAttribute("textoMostrar", archivo.getText());
        return archivo.getText();
        
    }
    
        public void borrarArchivo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArchivoDao archivoDao = (ArchivoDao) this.fabrica.getArchivoDao();

        if (archivoDao.borrar(Integer.parseInt(request.getParameter("idArchivo")))) {
            request.setAttribute("borradoValido", "valido");
        } else {
            request.setAttribute("borradoValido", "invalido");
        }
        response.sendRedirect("ProyectosListar");

    }

}
