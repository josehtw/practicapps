# Elegimos la ultima version de ubuntu
FROM ubuntu:latest
# Opción para que no nos hagan preguntas durante la instalacion
ENV DEBIAN_FRONTEND=noninteractive
#Actualizamos, instalamos apache, php y git. Posteriormente borramos el directorio de apache para que nos lo cree limpio.
RUN apt-get update
RUN apt-get install -y apache2 php php-cli libapache2-mod-php
RUN apt-get install -y git
RUN rm -rf /var/www/html

# Descargamos una aplicación php en el directorio de apache

RUN git clone https://github.com/banago/simple-php-website.git /var/www/html 

#Abrimos puerto de esucha del contenedor
EXPOSE 80
# Lanzamos el apache
CMD ["apachectl", "-D", "FOREGROUND" ]
