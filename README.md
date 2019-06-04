# Docker-Practico

Este espacio es para explicar de forma práctica como entender los conceptos de imagen, contenedor, red y volumen, de la mano con Dockerfile y docker-compose, que nos ayudarán a desplegar la infraestructura necesaria relacionada con contenedores.

Tengamos en cuenta lo siguiente, **docker run** lo que hace es iniciar un contenedor, y si la imagen no la tenemos descargada, realizará **docker pull** internamente para realizar esta acción, pero, es muy tedioso aún para un sysadmin experimentado estar digitando los comandos en consola, por ello, recurrimos por usar **Dockerfile** quien nos ayudará a *personalizar una imagen* a nuestra necesidad, y encima podemos tener versiones aka TAG por cada cambio que realicemos.

**docker-compose** esta relacionado con los contenedores contratamente, ya que en el archivo de extension YAML, podemos asociar imagenes ,puertos, volumenes de forma más intuitiva y personalizada. Con esta introducción vamos a como iniciar esto: 

## PASO 1 

>**docker-compose up -d**

Lo que realizará docker compose es primero interpretar la version de la misma ( aqui un [Link](https://docs.docker.com/compose/compose-file/compose-versioning/) donde explica esta parte  )
posterior a ello, y es aquí el tremendo potencial que tiene, y es la sintaxis **build**, pues mediante docker-compose podemos indicarle que lea un Dockerfile, caso contrario podemos usar **image** para que pueda usar la imagen descargada en nuestro Host. La sintaxis **container_name** asigna un nombre a nuestro contenedor, **enviroment** sirve para setear las variables de entorno, para nuestro caso, passwd, user para mariadb, la sintaxis **volume** asigno el mismo al contendor.

## PASO 2 

Vamos ahora a colocar contenido en nuestro VOLUME, para este caso, será un simple html5 responsive y un restore de una base de datos, aquí podemos hacerlo de forma manual y/o via dockerfile. Vamos a ejecutarlo manualmente: 

Para la web solo copiar los archivos al bind mount declarado, para la base de datos lo haremos de la sgt manera: 

>**cat dump.sql | docker exec -i mysql-container mysql -uroot -ppassword db_name**




