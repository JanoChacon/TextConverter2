<%-- 
    Document   : login
    Created on : 03-dic-2017, 20:22:13
    Author     : Alejandro
--%>
<head>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 


</head>

<!-- la navbar -->
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">TextConverter</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a type="button" class="btn" data-toggle="modal" data-target="#ModalReg">
                    <span class="glyphicon glyphicon-user"></span> Registarse</a>
            </li>
            <li><a type="button" class="btn" data-toggle="modal" data-target="#Modalogin">
                    <span class="glyphicon glyphicon-log-in"></span> Entrar</a>
            </li>
        </ul>
    </div>
</nav>
<br><br><br><br>

<p id="verificar" name="verificar" hidden>${login}</p>
<!-- el cuerpo de la pagina -->
<div class="container">
    <div class="jumbotron">
        <div class="page-header">
            <fieldset><legend><h2>Conversor de Archivos a Texto simple</h2></legend> 
        </div>
        <p>
            Convierte tus documentos de texto digitales de los formatos mas comunes a 
            formato de texto simple y guardalos en la libreria de la pagina, puedes 
            organizar tus archivos en paquetes y proyectos distintos.
            
            Necesitas crearte una cuenta para usar la aplicacion.
        </p>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
    </div>
    
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</div>
<!-- modal de login -->
<div class="modal fade" id="Modalogin" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Entrar</h4>
            </div>
            <form name="Form" action="Logearse" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="user">Usuario:</label>
                        <input type="text" class="form-control" placeholder="nombre de usuario" name="user">
                    </div>
                    <div class="form-group">
                        <label for="passwd">Contraseña:</label>
                        <input type="password" class="form-control" name="passwd">
                    </div>
                    <div id="nologin">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" id="btn-enviar">Entrar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>

        </div>   
    </div>
</div>
<!-- modal de como registrar -->
<div class="modal fade" id="ModalReg" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Como entrar</h4>
            </div>
            <div class="modal-body">
                <p>Para conseguir una contraseña, consulte con el administrador encargado de su institucion.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>   
    </div>
</div>
<!--pie-->
<div>
    <footer class="footer col-sm-2">
        <div class="container">
            <p class="text-muted">Alejandro Chacon !© 2017  <a href="mailto:a.chacon01@ufromail.cl">Contactar</a></p>
        </div>
    </footer>
</div>
</body>

<script>
    $(document).ready(function () {
        if ($('#verificar').text() === "error") {
            $("#nologin").html('<div class="alert alert-danger">Datos incorrectos, intente nuevamente</div>');
            $('#Modalogin').modal('show');
        }
    });
</script>
</html>