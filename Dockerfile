FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN mkdir target
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]