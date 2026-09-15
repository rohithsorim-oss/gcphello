# syntax=docker/dockerfile:1

FROM gradle:9.7.1-jdk21 AS build
WORKDIR /workspace

COPY gradlew gradlew.bat settings.gradle build.gradle ./
COPY gradle ./gradle

COPY src ./src
RUN gradle dependencies
RUN gradle clean bootJar

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

ENV PORT=8080

COPY --from=build /workspace/build/libs/gcphello-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

CMD ["/bin/sh", "-c", "java -XX:+UseContainerSupport -XX:MaxRAMPercentage=75 -jar /app/app.jar --server.port=${PORT}"]
