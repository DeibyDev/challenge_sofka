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
    <body onload="sinVueltaAtras();" onpageshow="if (event.persisted) sinVueltaAtras();" onunload="">



        <div class="container" id="prueba">



            <div class="row">
                <div class="col s12 m12">
                    <div class="card  blue darken-3">
                        <div class="card-content white-text ">
                            <span class="card-title center " style="font-family: 'Poppins',sans-serif;" >FELICITACIONES GANASTE !!</span>

                        </div>
                    </div>    
                </div> 

                <div class="row">
                      <div class="col s12 m6">
                        <div class="card  blue darken-1">
                            <div class="card-image z-depth-5 hoverable">
                                <img src="images/ganador.gif">

                            </div>
                        </div>
                    </div>
                    <div class="col s12 m6">
                        <div class="card  ">
                            <div class="card-content black-text">
                                <span class="card-title" >Nombre del Jugador
                                    <input id="nombre" class="center black-text" style="font-family: 'Poppins',sans-serif;" disabled="true"name="nombre" type="text" value="${nombre}">
                                </span>
                            </div>
                        </div>
                    </div>
                 
                    <div class="col s12 m3">
                        <div class="card  ">
                            <div class="card-content black-text">
                                <span class="card-title" >Acumulado:
                                    <input id="premio" class="center black-text" style="font-family: 'Poppins',sans-serif;" disabled="true"name="premio" type="text" value="${acumulado}">
                                </span>

                            </div>
                        </div>
                    </div>
                    <div class="col s12 m3">
                        <div class="card  ">
                            <div class="card-content black-text">
                                <span class="card-title " >Premio Mayor
                                    <input id="premio" class="center black-text" style="font-family: 'Poppins',sans-serif;" disabled="true"name="premio" type="text" value="$1'000.000">
                                </span>

                            </div>
                        </div>
                    </div>
                                   <div class="col s12 m6">
                        <div class="card  ">
                            <div class="card-content black-text">
                            
                                     <h3 class="card-title center red-text darken-3 pulse" style="font-family: 'Poppins',sans-serif;" >$. ${total}</h3> 
                                   
                               
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
                    <li><a class="btn-floating red btn tooltipped" data-position="bottom" data-tooltip="Record"><i class="material-icons" >local_convenience_store</i></a></li>
                    <li><a class="btn-floating yellow darken-1 tooltipped" data-position="bottom" data-tooltip="Premios"><i class="material-icons">attach_money</i></a></li>
                    <li><a class="btn-floating green darken-1 tooltipped" data-position="bottom" data-tooltip="Jugar"><i class="material-icons">videogame_asset</i></a></li>

                </ul>
            </div>


        </div>   

    </div>
</div>


<script>
    M.AutoInit();
    $(document).ready(function ()
    {
        $("#boton").click(function () {
            let respuesta = $('input:radio[name=opc]:checked').val();
           
            let nombre = document.getElementById("nombre").value;
            let premio = document.getElementById("premio").value;
            console.log(nombre);
            console.log(premio);
            
            window.location.href = 'ctr_challenge_sofka?accion=Ronda_6&respuesta=' + respuesta + '&opcion=' +${datos.preg_id} + '&nombre=' + nombre + '&acumulado=' +${datos.ronda.getRond_premio()}
            + '&premio=' + premio;
            return false;

        });
    });
    $(document).ready(function ()
    {
        $("#renunciar").click(function () {
             let nombre = document.getElementById("nombre").value;
            let premio = document.getElementById("premio").value;
            console.log(nombre);
            console.log(premio);
            window.location.href ='ctr_challenge_sofka?accion=Rendirse&nombre=' + nombre + '&acumulado='+premio;
            return false;

        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('.modal');
        var instances = M.Modal.init(elems, options);
    });

    // Or with jQuery

    $(document).ready(function () {
        $('.modal').modal();
    });

    window.history.forward();
    function sinVueltaAtras() {
        window.history.forward();
    }


</script>



</body>
</html>
