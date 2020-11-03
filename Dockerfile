################################################################################
# https://github.com/pandeiro/docker-oracle-jdk8/blob/master/Dockerfile
#
# .) Build
# docker build -t shoepping/oraclejdk:8 .
# docker build --no-cache -t shoepping/oraclejdk:8 .
#
# .) Run
# docker run --name jdk8 -it shoepping/oraclejdk:8 bash
# docker run --name jdk8 --rm -it shoepping/oraclejdk:8 java -version
#
################################################################################
FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

COPY jdk-8u271-linux-x64.tar.gz /tmp/

RUN apt-get update \
    && apt-get install -y openssl ca-certificates \
    && cd /tmp \
    && tar xzf jdk-8u271-linux-x64.tar.gz -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/jdk-8u271-linux-x64.tar.gz \
    && update-alternatives --install /usr/bin/java java /opt/java/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100

ENV JAVA_HOME /opt/java
