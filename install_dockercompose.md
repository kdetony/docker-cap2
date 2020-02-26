Install Docker Compose
=======================

Para iniciar la instalacion de docker compose, nos vamos a ubicar en el directorio : **/root**

1. Descargamos docker compose de la siguiente URL:

> curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

2. Ejecutamos ahora lo siguiente:

> chmod +x  /usr/local/bin/docker-compose

3. Validamos: 

> docker-compose
