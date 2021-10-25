<%-- 
    Document   : index.jsp
    Created on : 23/10/2021, 03:58:36 PM
    Author     : deibyasierra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <style type="text/css"> 

            iframe { 
                display:block; 
                width:100%; 
                border:none; } 
            </style>
        </head>
        <body onload="sinVueltaAtras();" onpageshow="if (event.persisted) sinVueltaAtras();" onunload="">
            <div class="container ">
            <div class="row">
                <div class="col s12 m12">
                    <div class="card  blue darken-3 z-depth-5">
                        <div class="card-content white-text ">
                            <span class="card-title center " style="font-family: 'Poppins',sans-serif;" > CONCURSO DE PREGUNTAS Y RESPUESTAS</span>
                        </div>
                    </div>    
                </div> 
                <div class="row">
                    <div class="col s12 m6">
                        <div class="card  blue darken-1">
                            <div class="card-image z-depth-5 hoverable">
                                <img src="images/fondo.gif">
                            </div>
                        </div>
                    </div> 
                    <div class="col s12 m6  ">
                        <div class="card z-depth-5">
                            <ul class="collapsible hoverable">
                                <li>
                                    <div class="collapsible-header" style="font-family: 'Poppins'"><i class="material-icons">library_books</i>Instrucciones</div>
                                    <div class="collapsible-body" style="font-family: 'Poppins'">
                                        <ol>
                                            <li>El jugador inicia con la primera ronda, el sistema busca la categoría del primer nivel y
                                                escoge una pregunta de esa categoría.
                                            </li>
                                            <li>El Jugador selecciona una opción de las 4 opciones que tiene, si pierde se finaliza el
                                                juego si gana continua a la siguiente ronda.</li>
                                            <li>La siguiente ronda selecciona una pregunta de un grado de complejidad mayor según
                                                la categoría. Hace el mismo comportamiento del ítem 4.
                                            </li>
                                            <li>Si llega a la ronda 5 y pasa, entonces gana el juego, el premio mayor debería estar en
                                                la última ronda
                                            </li>
                                        </ol>
                                    </div>
                                </li>                           
                            </ul>
                        </div>
                    </div> 
                    <div class="col s12 m6">
                        <div class="card z-depth-5">
                            <div class="card-content -text hoverable">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="nombre" name="nombre" type="text" >
                                        <label for="nombre">Ingresa un Nombre </label>
                                    </div>
                                    <div class="input-field col s12 center">
                                        <a class="btn-floating btn-large blue darken-3 pulse blue-text" id="jugar" name="jugar"  onclick="validar()">
                                            <i class="material-icons">videogame_asset</i>
                                        </a>  
                                    </div>
                                </div>
                            </div>             
                       </div>
                    </div> 
                </div>
                <div class="fixed-action-btn">
                    <a class="btn-floating btn-large red">
                        <i class="large material-icons">mode_edit</i>
                    </a>
                    <ul>
                        
                        <li><a class="btn-floating yellow darken-1 tooltipped btn modal-trigger" data-position="bottom" data-tooltip="Premio" href="ctr_challenge_sofka?accion=Jugar&opcion=premio" ><i class="material-icons">attach_money</i></a></li>
                        <li><a class="btn-floating red darken-1 tooltipped btn modal-trigger" data-position="bottom" data-tooltip="Historico" href="ctr_challenge_sofka?accion=Jugar&opcion=listar" ><i class="material-icons">local_convenience_store</i></a></li>
                       
                    </ul>
                </div>
            </div> 
        </div>   
    </div>
    <script>
        M.AutoInit();
        window.history.forward();
        function sinVueltaAtras() {
            window.history.forward();
        }
        function validar() {
            let nombre = document.getElementById("nombre").value;
            if (nombre === null || nombre === undefined || nombre === "") {
                alert("Digite un nombre");
            } else {
                window.location.href = 'ctr_challenge_sofka?accion=Jugar&nombre=' + nombre+'&opcion=inicio' ;
            }
        }

    </script>



</body>
</html>
