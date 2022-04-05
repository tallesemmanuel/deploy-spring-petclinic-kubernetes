# This is a multi-stage java Dockerfile
#### first we build the jar with maven in a fat image with all the tools
FROM maven:3.6.3-openjdk-11 as build
# don't use root
# RUN groupadd --gid 1000 java \
#   && useradd --uid 1000 --gid java --shell /bin/bash --create-home java
# USER java
WORKDIR /app
# TODO: ideally we're copying in xml only and installing dependencies first
COPY spring-petclinic/pom.xml ./spring-petclinic-client/
COPY spring-petclinic/pom.xml .
COPY spring-petclinic/pom.xml ./spring-petclinic-server/
# install maven dependency packages, this takes about a minute
RUN mvn dependency:go-offline
# Then we copy in all source and build
# splitting out dependencies and source will save time in re-builds
COPY spring-petclinic .
# building should only take about 13 seconds across multiple CPU's
RUN mvn -T 1C install
WORKDIR /app/spring-petclinic-server
CMD ["../mvn", "spring-boot:run"]