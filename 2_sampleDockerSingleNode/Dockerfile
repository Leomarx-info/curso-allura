#Getting base image ubuntu
FROM node:latest

MAINTAINER Leomarx Tech Solutions <suporte@leomarx.com>
 # AUTOR
 # Leonardo Marques de Andrade
 # DESCRIÇÃO
 # Docker image for API of Allura Course.
 # VERSÃO 1.0
 # by Leonardo Marques de Andrade 29/01/2022 - Primeira versão do programa.

RUN apt-get update

CMD ["apt-get_upgrade.sh"]

ENV PORT=3000
COPY . /var/www
WORKDIR /var/www
RUN npm install
ENTRYPOINT npm start
EXPOSE $PORT