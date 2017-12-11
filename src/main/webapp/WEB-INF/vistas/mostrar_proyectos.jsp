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
            <a class="navbar-brand" href="#">TextConverter: ${usuario.idUsuario}</a>
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
            <div class="treemenu">
                <c:forEach items="${proyectos}" var="proyecto">
                    <div level="0"> <span class="lbl ">${proyecto.nombre}</span></div>
                    <c:forEach items="${proyecto.paquetes}" var="paquete">
                        <div level="1"> <span class="lbl">${paquete.nombre}</span></div>
                        <c:forEach items="${paquete.archivos}" var="archivo">
                            <div level="2"> <span class="lbl">${archivo.nombre}</span></div>
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
</body>

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
