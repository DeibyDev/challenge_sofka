<%-- 
    Document   : index.jsp
    Created on : 23/10/2021, 03:58:36 PM
    Author     : deibyasierra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>

    <head>
        <link rel="stylesheet" href="./css/Styles.css">
        <link rel="stylesheet" href="./js/Funciones.js">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    </head>
    <body >
        <div class="container" id="prueba">
            <div class="row">
                <div class="col s12 m12">
                    <div class="card  blue darken-3">
                        <div class="card-content white-text ">
                            <span class="card-title center " style="font-family: 'Poppins',sans-serif;" >PREMIOS DISPONIBLES</span>
                        </div>
                    </div>    
                </div> 
                <div class="col s12 m4">
                    <div class="card  blue darken-1">
                        <div class="card-image z-depth-5 hoverable">
                            <img src="images/premio.gif">
                        </div>
                    </div>
                </div> 
                <div class="col s12 m8">
                    <div class="card  ">
                        <div class="card-content white-text z-depth-5 hoverable ">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre del Jugador</th>
                                        <th>Premio</th>
                                        <th>Fecha</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="jug" items="${jugador}" varStatus="count">    
                                        <tr>
                                            <td>${count.count}</td>
                                            <td>${jug.getAlias()}</td>
                                            <td>${jug.getAcumulado()}</td>
                                            <td>${jug.fecha_registro}</td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>    
                </div>


                <div class="input-field col s12 center">
                    <a class="btn-floating btn-large blue darken-3 pulse blue-text tooltipped "data-position="bottom" data-tooltip="Jugar" id="jugar" name="jugar" href="http://localhost:8080/challenge-sofka/inicio.jsp">
                        <i class="material-icons">videogame_asset</i>
                    </a>  
                </div>
            </div>   
        </div>
        <script>
            M.AutoInit();



        </script>



    </body>
</html>
