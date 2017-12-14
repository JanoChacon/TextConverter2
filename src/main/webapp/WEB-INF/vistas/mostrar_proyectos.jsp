<%-- 
    Document   : mostrar_proyectos
    Created on : 06-12-2017, 2:16:34
    Author     : Alejandro
--%>
<!-- la navbar -->
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Bienvenido ${usuario.idUsuario}</a>   
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><<li><a href="CerrarSession" type="button" class="btn">
                    <span class="glyphicon glyphicon-log-out"></span>Cerrar session</a>
            </li>
        </ul>
    </div>
</nav>
<br><br><br><br>
<div class="container-fluid">
    <div class="row">
        <div class="btn-group col-sm-9">
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Opciones Proyecto <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><a id="linkCrearProyecto" class="btn" data-toggle="modal" data-target="#ModalCrearProyecto">Crear Proyecto</a></li>
                    <li><a id="linkBorrarProyecto" style="visibility:hidden;" class="btn" data-toggle="modal" data-target="#ModalBorrarProyecto">Borrar Pryecto</a></li>
                </ul>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Opciones Paquete <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><a id="linkCrearPaquete" style="visibility:hidden;" class="btn" data-toggle="modal" data-target="#ModalCrearPaquete">Crear Paquete</a></li>
                    <li><a id="linkBorrarPaquete" style="visibility:hidden;" class="btn" data-toggle="modal" data-target="#ModalBorrarPaquete">Borrar Paquete</a></li>
                </ul>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Opciones Archivo <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><form id="FormVerArchivo" style="visibility:hidden;" name="FormVerArchivo" action="MostrarTexto" method="POST">
                            <input name ="idArchivo" hidden="hidden"/>
                            <button  type="submit" id="linkMostrarContenido" class="btn" style="color:black;padding-left:3.0em" >Ver Contenido</button>
                        </form>
                    </li>
                    <li><a id="linkSubirArchivo" style="visibility:hidden;" class="btn" data-toggle="modal" data-target="#ModalSubirArchivo" >Subir Nuevo Archivo</a></li>
                    <li><a id="linkBorrarArchivo" style="visibility:hidden;" class="btn" data-toggle="modal" data-target="#ModalBorrarArchivo">Borrar Archivo</a></li>
                </ul>
            </div>
        </div>
    </div> 
</div>
</div><br>


<div class="container-fluid">
    <div class="row">
        <!-- barra navegacion vertical -->
        <div class="col-sm-2">
            <div class="treemenu">
                <c:forEach items="${proyectos}" var="proyecto">
                    <div level="0" value="${proyecto.id}" nombreItem="${proyecto.nombre}"> 
                        <a id ="linkProyecto${proyecto.id}">
                            <span class="lbl">${proyecto.nombre}</span></a>
                    </div>
                    <c:forEach items="${proyecto.paquetes}" var="paquete">
                        <div level="1" value="${paquete.id}" nombreItem="${paquete.nombre}"> 
                            <a id ="linkPaquete${paquete.id}">
                                <span class="lbl">${paquete.nombre}</span></a>
                        </div>
                        <c:forEach items="${paquete.archivos}" var="archivo">
                            <div level="2" value="${archivo.id}" nombreItem="${archivo.nombre}">
                                <a id ="linkArchivo${archivo.id}">
                                    <span class="lbl">${archivo.nombre}</span></a>
                            </div>
                        </c:forEach>
                    </c:forEach>
                </c:forEach>  
            </div>
        </div>
        <!-- cuerpo -->
        <div class="col-sm-10">
            <div class="jumbotron">
                <div id="contenido">
                    <div class="page-header">
                        <legend>
                            <h2>${tituloTexto}</h2>
                        </legend> 
                    </div>
                        <div>
                        <p>
                            ${textoMostrar}
                        </p>
                        <br><br><br><br><br><br>
                    </div>
            </div>
        </div>
    </div>
</div>

<!-- modal de creacion de proyecto -->
<div id="ModalCrearProyecto"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Crear proyecto</h4>
            </div>
            <form name="FormCrearProyecto" action="CrearProyecto" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombreProyecto">Nombre del nuevo proyecto:</label>
                        <input type="text" pattern="[a-z0-9._%+-].{1,}" class="form-control" placeholder="nombre" name="nombreProyecto" required="required">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" id="btn-enviar">Crear</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

<!--Modal para borrar Proyecto seleccionado-->
<div id="ModalBorrarProyecto"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Borrar Proyecto</h4>
            </div>
            <form name="FormBorrarProyecto" action="BorrarProyecto" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombreProyectoModal">¿Esta seguro de borrar el siguiente Proyecto?</label>
                        <h4 class="modal-title">
                            <input name ="nombreProyectoModal" disabled readonly/></h4>
                        <input name ="idProyecto" hidden="hidden"/>
                    </div>
                </div>
                <div class="alert alert-danger">
                    Esta accion tambien borrara los subcontenidos.
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" id="btn-enviar">Borrar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

<!-- modal de creacion de paquete -->
<div id="ModalCrearPaquete"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <form name="FormCrearPaquete" action="CrearPaquete" method="POST">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Nuevo Paquete en proyecto: <input name ="nombreProyectoModal" disabled readonly/></h4>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombrePaquete">Nombre del nuevo paquete:</label>
                        <input type="text" pattern="[a-z0-9._%+-].{1,}" class="form-control" placeholder="nombre" name="nombrePaquete" required="required">
                        <input name ="idProyecto" hidden="hidden"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" id="btn-enviar">Crear</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

<!-- modal para borrar de paquete -->
<div id="ModalBorrarPaquete"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Borrar Paquete</h4>
            </div>
            <form name="FormBorrarPaquete" action="BorrarPaquete" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombrePaqueteModal">¿Esta seguro de borrar el siguiente Paquete?</label>
                        <h4 class="modal-title">
                            <input name ="nombrePaqueteModal" disabled readonly/></h4>
                        <input name ="idPaquete" hidden="hidden"/>
                    </div>
                </div>
                <div class="alert alert-danger">
                    Esta accion tambien borrara los subcontenidos.
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" id="btn-enviar">Borrar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

<!-- modal de subida de archivo -->
<div id="ModalSubirArchivo"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <form name="FormSubirArchivo" action="SubirArchivo" method="POST" enctype='multipart/form-data'>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Subir Archivo en Paquete: <input name ="nombrePaqueteModal" disabled readonly/></h4>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombrePaquete">Archivo nuevo:</label>
                        <input  type="file" name="archivo" size = "10" accept=".pdf, .txt, .docx, .doc" required onchange="extraerNombre(this.value)"/>
                        <input name ="idPaquete" hidden="hidden"/>
                        <input name ="nombreArchivo" hidden="hidden"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" id="btn-enviar">Subir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

<!-- modal para borrar archivo -->
<div id="ModalBorrarArchivo"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Borrar Archivo</h4>
            </div>
            <form name="FormBorrarArchivo" action="BorrarArchivo" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombreArchivoModal">¿Esta seguro de borrar el siguiente Archivo?</label>
                        <h4 class="modal-title">
                            <input name ="nombreArchivoModal" disabled readonly/></h4>
                        <input name ="idArchivo" hidden="hidden" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" id="btn-enviar">Borrar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>   
    </div>
</div>

</body>

<!--codigo javascript para navegacion de proyectos -->
<script type="text/javascript">
    window.log = function (text) {
        console.log(text);
        //$(".console").prepend(text + "<br/>");  
    }

    class TreeMenu {

        constructor($container) {
            this.$container = $container;
            $container.find("[level]").click(this.levelClickHandler.bind(this));
            var id = 0;
            $container.find("[level]").each(function (index, item) {
                let $item = $(item);
                $item.attr("data-treemenu-id", ++id);
                this.setOpen($item, false);
                if (parseInt($item.attr("level")) > 0) {
                    this.hideItem($item);
                } else {
                    this.showItem($item);

                }
            }.bind(this))
        }

        levelClickHandler(evt) {
            var $el = $(evt.currentTarget);

            if (this.isOpen($el)) {

                this.closeItem($el);
            } else {
                this.openItem($el);
            }

            if (parseInt($el.attr("level")) == 0) {

                document.FormBorrarProyecto.nombreProyectoModal.value = $el.attr("nombreItem");
                document.FormBorrarProyecto.idProyecto.value = $el.attr("value");
                document.FormCrearPaquete.nombreProyectoModal.value = $el.attr("nombreItem");
                document.FormCrearPaquete.idProyecto.value = $el.attr("value");

                document.getElementById("linkBorrarProyecto").style.visibility = "visible";
                document.getElementById("linkCrearPaquete").style.visibility = "visible";

            } else if (parseInt($el.attr("level")) == 1) {

                document.FormBorrarPaquete.nombrePaqueteModal.value = $el.attr("nombreItem");
                document.FormBorrarPaquete.idPaquete.value = $el.attr("value");

                document.FormSubirArchivo.nombrePaqueteModal.value = $el.attr("nombreItem");
                document.FormSubirArchivo.idPaquete.value = $el.attr("value");

                document.getElementById("linkBorrarPaquete").style.visibility = "visible";
                document.getElementById("linkSubirArchivo").style.visibility = "visible";


            } else if (parseInt($el.attr("level")) == 2) {

                document.FormVerArchivo.idArchivo.value = $el.attr("value")
                document.FormBorrarArchivo.nombreArchivoModal.value = $el.attr("nombreItem");
                document.FormBorrarArchivo.idArchivo.value = $el.attr("value");

                document.FormVerArchivo.style.visibility = "visible";
                document.getElementById("linkBorrarArchivo").style.visibility = "visible";

            }
        }

        getElementTreeMenuId($el) {
            return $el.attr("data-treemenu-id");
        }

        getElementLevel($el) {
            return parseInt($el.attr("level"));
        }

        isOpen($el) {
            return $el.attr("data-treemenu-open") === "1";
        }

        setOpen($el, to) {
            log("set open: " + to);
            $el.attr("data-treemenu-open", to ? "1" : "0");
        }

        getGroup($el) {
            log("get group");
            //the group is every element that has a higher level than this one
            var firstElementLevel = this.getElementLevel($el);
            var group = [];

            this.$container.find("[level]").each(function (index, item) {
                let $item = $(item);

                if (!group.length) {
                    //first item has not been passed in the loop
                    if (this.getElementTreeMenuId($el) == this.getElementTreeMenuId($item)) {
                        //the current item is the parent of the group
                        group.push($item);
                    }
                    //stop this iteration of the loop
                    return true;
                }
                //
                //if the level of the item equals or is lower then the initial level, 
                // we have reached the end of the group
                let level = parseInt($item.attr("level"));
                if (level <= firstElementLevel)
                    return false;
                if (level == firstElementLevel + 1)
                    group.push($item);
            }.bind(this));
            return group;
        }

        closeItem($el) {
            this.setOpen($el, false);
            this.getGroup($el).forEach(function ($item, index) {
                if (!index)
                    return true;
                this.hideItem($item);

                //also close its children
                this.closeItem($item);
            }.bind(this));
        }

        openItem($el) {
            this.setOpen($el, true);
            this.getGroup($el).forEach(function ($item, index) {
                if (!index)
                    return true;
                this.showItem($item);
            }.bind(this));
        }

        showItem($el) {
            $el.removeClass("closed");
            $el.addClass("opened");
        }

        hideItem($el) {
            $el.removeClass('opened');
            $el.addClass("closed");
        }
    }
    var menu = new TreeMenu($(".treemenu"));

    function extraerNombre(fic) {
        fic = fic.split('\\');
        document.FormSubirArchivo.nombreArchivo.value = fic[fic.length - 1];
    }

</script>
</html>
