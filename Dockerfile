FROM openjdk:8-jdk-alpine
LABEL maintainer="ganga.bomzan@gmail.com"

ADD target/SalesManager-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","/app.jar"]