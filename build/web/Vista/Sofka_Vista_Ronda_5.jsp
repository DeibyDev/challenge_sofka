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
                            <span class="card-title center " style="font-family: 'Poppins',sans-serif;" > CONCURSO DE PREGUNTAS Y RESPUESTAS</span>

                        </div>
                    </div>    
                </div> 

                <div class="row">
                    <div class="col s12 m8">
                        <div class="card  ">
                            <div class="card-content black-text">
                                <span class="card-title" >Nombre del Jugador
                                    <input id="nombre" class="center black-text" style="font-family: 'Poppins',sans-serif;" disabled="true"name="nombre" type="text" value="${nombre}">
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m4">
                        <div class="card  ">
                            <div class="card-content black-text">
                                <span class="card-title" >Acumulado:
                                    <input id="premio" class="center black-text" style="font-family: 'Poppins',sans-serif;" disabled="true"name="premio" type="text" value="${acumulado}">
                                </span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12 m4">
                        <div class="card  ">
                            <div class="card-content black-text">
                                <span class="card-title center" >INFORMACIÓN </span>  

                                <span class="card-title" >Categoria:  ${datos.categoria.getCate_descripcion()}</span>  

                                <span class="card-title" >Difucultad : ${datos.preg_dificultad}</span>
                                <a class="waves-effect waves-light btn-small pulse right blue darken-3 tooltipped btn modal-trigger" 
                                   data-position="bottom" data-tooltip="Retirarse"  data-target="modal1"  >
                                    <i class="material-icons ">pan_tool</i> </a>
                                <span class="card-title" >Premio : $ ${datos.ronda.getRond_premio()}</span> 


                            </div>

                        </div>

                    </div>

                    <div id="modal1" class="modal ">
                        <div class="modal-content   ">
                            <h4 class="center  ">¿ESTAS SEGURO DE RENDIRTE ?</h4>
                           
                            <h6 class="card-title center" style="font-family: 'Poppins',sans-serif;">${nombre} Actualmente estas en la ronda ${datos.ronda.getRond_descripcion()} con un acumulado de :
                             <br>
                                <h3 class="card-title center red-text darken-3" style="font-family: 'Poppins',sans-serif;" >$. ${acumulado}</h3> 
                            </h6>
                        </div>
                        <div class="modal-footer">
                            <a href="#!" class="modal-close waves-effect waves-green btn-flat blue darken-1 center-align " id="renunciar">Aceptar</a>
                            <a href="#!" class="modal-close waves-effect waves-green btn-flat red  center  ">Cancelar</a>
                        </div>
                    </div>


                    <div class="col s12 m8">
                        <div class="card  ">
                            <div class="card-content black-text">

                                <span class="card-title center">
                                    ${datos.getPreg_descripcion()}
                                </span>
                                <br>
                                <p>
                                    <label>
                                        <input type="radio" name="opc" id="opc1" value="${datos.respuestas.getResp_descripcion()}" >
                                        <span class="black-text">A. ${datos.respuestas.getResp_descripcion()}</span>
                                    </label>
                                </p>

                                <p>
                                    <label>
                                        <input name="opc" type="radio" id="opc2" value="${datos.respuestas.getOpc2()}"  />
                                        <span class="black-text">B. ${datos.respuestas.getOpc2()} </span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input   name="opc" type="radio" id="opc3"  value="${datos.respuestas.getOpc3()}" />
                                        <span class="black-text">C. ${datos.respuestas.getOpc3()} </span>
                                    </label>
                                </p>
                                <a class="btn-floating btn-large waves-effect waves-light cyan darken-1 pulse right " id="boton" ><i class="material-icons ">check</i> </a>
                                <p>
                                    <label>
                                        <input name="opc" type="radio"  id="opc4" value="${datos.respuestas.getOpc4()}" />
                                        <span class="black-text">D. ${datos.respuestas.getOpc4()} </span>
                                    </label>
                                </p>
                                <br>

                            </div>

                        </div>
                    </div> 
                </div> 
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
