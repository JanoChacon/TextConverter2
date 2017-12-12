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
<!--        <ul class="nav navbar-nav">
            <li><a id ="idActiva" name="idActiva" type="button" class="btn">Crear Proyecto</a></li>
        </ul>-->

        <ul class="nav navbar-nav navbar-right">
            <li><a name="rutaProyecto" type="button" class="btn">
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
                    <li><a class="btn" data-toggle="modal" data-target="#ModalcrearProyecto">Crear Proyecto</a></li>
                    <li><a class="btn" data-toggle="modal" data-target="#ModalborrarProyecto">Borrar Pryecto</a></li>
                </ul>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Opciones Paquete <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Subir Nuevo Archivo</a></li>
                    <li><a href="#">Borrar Archivo</a></li>
                </ul>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Opciones Archivo <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Subir Nuevo Archivo</a></li>
                    <li><a href="#">Borrar Archivo</a></li>
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
                    <div level="0" value="${proyecto.id}"> 
                        <a id ="linkProyecto${proyecto.id}">
                        <span class="lbl">${proyecto.nombre}</span></a>
                    </div>
                    <c:forEach items="${proyecto.paquetes}" var="paquete">
                        <div level="1" value="${paquete.id}"> 
                            <a id ="linkPaquete${paquete.id}">
                            <span class="lbl">${paquete.nombre}</span></a>
                        </div>
                        <c:forEach items="${paquete.archivos}" var="archivo">
                            <div level="2" value="${archivo.id}"> 
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

<!-- modal de creacion de proyecto -->
<div id="ModalcrearProyecto"  class="modal fade" role="dialog">
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
                        <input type="text" class="form-control" placeholder="nombre" name="nombreProyecto">
                        <input name = "idProyecto" id="projID1"/>
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

<div id="ModalborrarProyecto"  class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Borrar Proyecto</h4>
            </div>
            <div class="alert alert-danger">
                Esta accion tambien borrara los subcontenidos.
            </div>
            <form name="FormBorrarProyecto" action="BorrarProyecto" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombreProyecto">Esta seguro de borrar el Proyecto:</label>
                        <input type="text" class="form-control" placeholder="nombre" name="idProyecto" value="asd">
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
                document.FormCrearProyecto.idProyecto.value = $el.attr("value");
            }else if (parseInt($el.attr("level")) == 1) {
                document.FormCrearProyecto.idProyecto.value = $el.attr("value");
            }else if (parseInt($el.attr("level")) == 2) {
                document.FormCrearProyecto.idProyecto.value = $el.attr("value");
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

</script>
</html>
