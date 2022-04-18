FROM anapsix/alpine-java
ADD my-app/target/my-app-*.jar /home/myjar.jar
CMD ["java","-jar","/home/myjar.jar"]