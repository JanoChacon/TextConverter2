<%-- 
    Document   : mostrar_proyectos
    Created on : 06-12-2017, 2:16:34
    Author     : Alejandro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- la navbar -->
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">TextConverter</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="CerrarSession" type="button" class="btn">
                    <span class="glyphicon glyphicon-log-out"></span> Cerrar session</a>
            </li>
        </ul>
    </div>
</nav>
<br><br><br><br>

<div class="container-fluid">
    <div class="row">
        <!-- barra navegacion vertical -->
        <div class="col-sm-2">
            <ul class="nav nav-pills nav-stacked">
                <c:forEach items="${proyectos}" var="proyecto">
                    <li>
                        <a href="#"><i class="fa fa-archive fa-fw"></i>${proyecto.nombre}<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <c:forEach items="${proyecto.paquetes}" var="paquete">
                                <li>
                                    <a  href="#"><i class="fa fa-folder-open fa-fw"></i>${paquete.nombre}<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <c:forEach items="${paquete.archivos}" var="archivo">
                                            <li>
                                                <a href="#"><i class="fa fa-file fa-fw"></i>${archivo.nombre}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>    
            </ul>
        </div>
        <!-- cuerpo -->
        <div class="col-sm-10">
            <div class="jumbotron">
                <div id="contenido">
                    <h2>Textconverter</h2>
                    <br>
                    <h4>
                        cosas que van acá
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                    </h4>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
