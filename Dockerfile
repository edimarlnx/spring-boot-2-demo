FROM eclipse-temurin:17 as builder


WORKDIR /app

COPY src src
COPY .mvn .mvn
COPY mvnw mvnw
COPY pom.xml pom.xml

RUN ./mvnw clean package

FROM eclipse-temurin:17

WORKDIR /app

COPY --from=builder /app/target/spring-boot-demo*.jar /app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/app.jar"]
