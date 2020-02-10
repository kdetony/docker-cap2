OFFTOPIC
===================
 
Multistage nos va a permitir construir imagenes sobre imagenes, esto quiere decir, que podemos usar una imagen base para construir un artefacto y luego usar otra imagen para copiar el artefacto creado, y todo esto bajo un mismo Dockerfile, vamos a crear una carpeta de nombre multibuild y dentro de ella crearemos los ficheros main.go y Dockerfile
Asumamos que tenemos una pequeña aplicación desarrollada en Go! 

```
package main
import (
    "fmt"
    "net/http")
 
func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hola Multibuild Docker: %s\n", r.URL.Path)
    })
 
    http.ListenAndServe("0.0.0.0:8080", nil)
}
```

Guardamos este código como **main.go**, y ahora vamos a crear el siguiente Dockerfile:
```
FROM golang:1.8
WORKDIR  /go/src/app 
COPY main.go     .
RUN go build -o webserver   .
CMD [“./webserver”]
```

Y procedemos a construir la imagen:

> docker build -t imggo . 

Ahora listamos la imagen creada para ver su tamaño:

> docker images | grep imggo
imggo                latest              7dde5fd28e3b        54 seconds ago       719MB
 
El tamaño de nuestra imagen creada es de **719 MB.**

Ahora, vamos a hacer una pequeña modificación, vamos a cambiar esta linea en **Dockerfile**
```
FROM golang:alpine
```

Y generemos una nueva imagen:

> docker build -t imggo1  .

Listamos ahora el tamaño de la imagen:

> docker images | grep imggo1
imggo1                          latest              a7949d966f2b        7 seconds ago       367MB
 
Esto se debe a que alpine es una imagen base más compacta, pero se podrá reducir aún más?, vamos ahora a realizar el proceso de multibuild.  Vamos ahora a usar este Dockerfile 
```
FROM golang:alpine AS builder
WORKDIR  /go/src/app 
COPY main.go .
RUN go build -o webserver .
FROM alpine 
WORKDIR /app
COPY --from=builder /go/src/app/  /app/
CMD ["./webserver"]
```

y lo construimos:

> docker build   -t imggo2  .

Listamos ahora:

> docker images | grep imggo
imggo2         latest              59dbf19a203a        11 seconds ago      13MB

De esta forma multibuild nos ayuda a reducir el tamaño de nuestras imágenes y hacerlas más versátiles.
