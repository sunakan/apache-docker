FROM debian:wheezy-slim as os-base
ENV LANG C.UTF-8
RUN echo 'deb http://archive.debian.org/debian wheezy main' > /etc/apt/sources.list \
  && echo 'deb http://archive.debian.org/debian-security wheezy/updates main' >> /etc/apt/sources.list \
  && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/check-valid-until.conf \
  && apt-get update

FROM os-base as apache-base
RUN apt-get install --assume-yes \
  apache2

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
