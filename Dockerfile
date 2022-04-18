FROM openjdk:8-jdk-alpine
EXPOSE 8080
ADD target/my-app-*.jar /home/myjar.jar
CMD ["java","-jar","/home/myjar.jar"]
