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
# docker save shoepping/oraclejdk:8 > shoepping_oraclejdk_8_1.8.0_191.tar
# docker run --name jdk8 --rm -it shoepping/oraclejdk:8 java -version
# https://docs.docker.com/engine/reference/commandline/import/
# docker import /path/to/exampleimage.tgz
#
################################################################################
FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

ENV JDK_FILE=jdk-8u271-linux-x64.tar.gz

COPY ${JDK_FILE} /tmp/

RUN apt-get update \
    && apt-get install -y openssl ca-certificates \
    && cd /tmp \
    && tar xzf ${JDK_FILE} -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/${JDK_FILE} \
    && update-alternatives --install /usr/bin/java java /opt/java/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100

ENV JAVA_HOME /opt/java
