FROM anapsix/alpine-java
ADD my-app/target/*.jar /home/myjar.jar
CMD ["java","-jar","/home/myjar.jar"]