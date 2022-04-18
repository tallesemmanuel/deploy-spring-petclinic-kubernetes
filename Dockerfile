FROM openjdk:8-jdk-alpine
EXPOSE 8080
COPY my-app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","my-app*.jar"]

