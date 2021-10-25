
# Challegen Sofka 2021

## Descripción y contexto:
Lo que se busca en este juego es pre-construir una serie de preguntas con 4 opciones de
respuesta y una de ella válida, además de una categoría asociada con el mismo nivel de
dificultad. Cada pregunta debe estar categorizada y debe existir mínimo 5 preguntas por
categoría donde por cada ronda se debe extraer una pregunta de esa categoría de forma
aleatoria, debe existir 5 rondas en todo el juego, cada ronda otorga premios (puntos o dinero)
cuando el jugador acierta correctamente.
El acomulado de premios está dentro del concurso pero si dado el caso el jugador pretender
salir de juego puede retirarse antes de responder a la pregunta, si por el contrario el jugador
pierde entonces saldría del juego sin el acomulado que llevaría en ese momento.

## Guía de instalación

Esta guía es para que instales la aplicación localmente.

```bash
git clone https://github.com/DeibyDev/challenge_sofka

```

### Dependencias
* Para compilar el proyecto localmente es necesario descargar [xampp](https://www.apachefriends.org/es/index.html).

## Guía de usuario

* El archivo `/challenge-sofka.sql`. contine la configuracion de la Base de datos y para ello es necesario la instalacion de xammp.
* Las páginas residen en la carpeta `/_documents/pages`.
* El idioma predeterminado es el español. Para cualquier traducción, utiliza las carpetas internas que refieren a otros idiomas. Revisa la guía de "Agregar un idioma" en este documento.
* Los archivos de documentos deben seguir el formato `_document/[minuscula-spdx-id].markdown` (por ejemplo,`_documents/documentation.markdown`)
* Cada documento tiene [metadatos obligatorios y opcionales] (https://github.com/github/choosealicense.com#license-metadata) que deben incluirse.
* El nombre del archivo del documento no debe ser mayor a 78 caracteres.
* Dentro las variables para metadatos hay restricción de caracteres especiales por ejemplo: ':'. Para más información consulta la guía de [Jekyll](https://jekyllrb.com/)

La forma más sencilla de realizar un cambio es simplemente editar un archivo desde tu navegador.
Al hacer clic en el botón de edición, se hará un “fork” en tu propia cuenta.

Por ejemplo, para [cambiar este archivo](/documents/documentation.markdown),
encuéntralo en el repositorio de GitHub. A continuación, haz clic en el botón "Editar". Haz tus
Cambios, escribe un mensaje de confirmación y haz clic en el botón que acepta los cambios.
¡Muy fácil!

Para hacer cambios al repositorio del BID necesitas proponer los cambios vía “fork”.
