FROM openjdk:8-jdk-alpine
EXPOSE 8080
ARG JAR_FILE=my-app/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","my-app*.jar"]

