# Docker-Practico

Este espacio es para explicar de forma práctica como entender los conceptos de imagen, contenedor, red y volumen, de la mano con Dockerfile y docker-compose, que nos ayudarán a desplegar la infraestructura necesaria relacionada con contenedores.

Tengamos en cuenta lo siguiente, **docker run** lo que hace es iniciar un contenedor, y si la imagen no la tenemos descargada, realizará **docker pull** internamente para realizar esta acción, pero, es muy tedioso aún para un sysadmin experimentado estar digitando los comandos en consola, por ello, recurrimos por usar **Dockerfile** quien nos ayudará a *personalizar una imagen* a nuestra necesidad, y encima podemos tener versiones aka TAG por cada cambio que realicemos.

**docker-compose** esta relacionado con los contenedores contratamente, ya que en el archivo de extension YAML, podemos asociar imagenes ,puertos, volumenes de forma más intuitiva y personalizada. Con esta introducción vamos a como iniciar esto: 

## PASO 1 

>**docker-compose up -d**
