################################################################################
#
# .) Build
# docker build -t shoepping/oraclejdk:8 .
# docker build --no-cache -t shoepping/oraclejdk:8 .
# .) Run
# docker run --name jdk8 -it shoepping/oraclejdk:8 bash
#
################################################################################

FROM debian:8.11

# Install Java 8
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y software-properties-common
RUN add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
RUN apt-get update
# RUN apt-add-repository ppa:webupd8team/java -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y oracle-java8-installer unzip && apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
