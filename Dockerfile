FROM maven:3 as BUILD_IMAGE
ENV APP_HOME=/root/dev/myapp/
RUN mkdir -p $APP_HOME/src/main/java
WORKDIR $APP_HOME
COPY . .
RUN mvn -B package -e -X --file my-app/pom.xml

FROM openjdk:8-jre
WORKDIR /root/
COPY --from=BUILD_IMAGE /root/dev/myapp/my-app/target/my-app*.jar .
CMD java -jar my-app*.jar