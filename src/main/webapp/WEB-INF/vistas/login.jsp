<%-- 
    Document   : login
    Created on : 03-dic-2017, 20:22:13
    Author     : Alejandro
--%>

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

<p id="verificarLogin" name="verificarLogin" hidden>${login}</p>
<p id="validarReg" name="validarReg" hidden>${reg}</p>
<!-- el cuerpo de la pagina -->
<div class="container">
    <div class="jumbotron">
        <div class="page-header">
            <fieldset><legend><h2>Conversor de Archivos a Texto simple</h2></legend> 
        </div>
        <p>
            Convierte tus documentos de texto digitales de los formatos más comunes a formato de texto simple 
            y guárdalos en la librería de la página, puedes organizar tus archivos en paquetes y proyectos distintos.

            Necesitas crearte una cuenta para usar la aplicación.
        </p><br><br><br><br><br><br>
    </div>
    <br><br><br><br><br><br>
</div>
<!-- modal de login -->
<div id="Modalogin"  class="modal fade" role="dialog">
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
                        <input type="text" class="form-control" placeholder="nombre de usuario" name="user" required="required">
                    </div>
                    <div class="form-group">
                        <label for="passwd">Contraseña:</label>
                        <input type="password" class="form-control" name="passwd" required="required">
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
<div id="ModalReg" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Crear Usuario Nuevo</h4>
            </div>
            <form name="Form" action="Registrar" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="user">Usuario:</label>
                        <input type="text" class="form-control" placeholder="Nuevo nombre de usuario" name="nuevoIdUsuario" required="required">
                    </div>
                    <div class="form-group">
                        <label for="nuevapass">Contraseña:</label>
                        <input id="nuevapass" type="password" class="form-control" name="nuevapass" required="required">
                    </div>
                    <div class="form-group">
                        <label for="nuevapass2">Confirmar Contraseña:</label>
                        <input id="nuevapass2" type="password" class="form-control" required="required">
                    </div>
                    <div id="noreg">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" id="btn-enviar">Crear Usuario</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

<!--pie-->
<div>
    <footer class="footer col-sm-2">
        <div class="container">
            <p style="color:white;">TextConverter para Arquitetura 2017  <a href="mailto:a.chacon01@ufromail.cl" style="color:whitesmoke">Contactar</a></p>
        </div>
    </footer>
</div>
</body>

<!-- script para mostrar error de login-->
<script>
    $(document).ready(function () {
        if ($('#verificarLogin').text() === "error") {
            $("#nologin").html('<div class="alert alert-danger">Datos incorrectos, intente nuevamente</div>');
            $('#Modalogin').modal('show');
        }
        if ($('#validarReg').text() === "error") {
            $("#noreg").html('<div class="alert alert-danger">Datos incorrectos o usuario ya existente, intente nuevamente</div>');
            $('#ModalReg').modal('show');
        }
        if ($('#validarReg').text() === "registrado") {
            $("#noreg").html('<div class="alert alert-success">Usuario Creado</div>');
            $('#ModalReg').modal('show');
        }
    });
</script>

<!-- script para validar contraseñas-->
<script>
    var password = document.getElementById("nuevapass")
            , confirm_password = document.getElementById("nuevapass2");

    function validatePassword() {
        if (password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Las contraseñas no coinciden");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

</script>
</html>