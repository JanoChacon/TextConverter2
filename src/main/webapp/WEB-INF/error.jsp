<%-- 
    Document   : error
    Created on : 11-dic-2017, 20:22:13
    Author     : Alejandro
--%>

<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="webjars/jquery/1.11.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>JSP Page</title>
    </head>

    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        /* basic non-functional styling passed this poing */
        *{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }

        body{
            background-color: #1E90FF;
            font-family: 'Roboto', sans-serif;
            font-weight: 300;
        }

        .title{
            text-align: center;
            font-size: 20px;
            margin: 10px;
            color: white;

        }
    </style>
        <!-- el cuerpo de la pagina -->
        <br><br><br><br><br><br><br><br><br>
        <div class="container">
            <div class="jumbotron">
                <div class="page-header">
                    <legend><h2>Elemento no disponible</h2></legend> 
                </div>
                <p>
                    La direccion ingresada no es valida o necesita estar Logeado
                </p><br><br><br><br><br><br>
            </div>
            <br><br><br><br><br><br>
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

</html>