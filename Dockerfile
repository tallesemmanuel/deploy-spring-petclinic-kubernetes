FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY spring-petclinic/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]