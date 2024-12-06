FROM maven:3-eclipse-temurin-21-alpine as backend_builder

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine

WORKDIR /usr/src/app

COPY --from=backend_builder /app/target/backend-0.0.1-SNAPSHOT.jar .
# COPY target/backend-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "backend-0.0.1-SNAPSHOT.jar"]

# -v volumeName:repository/in/container
# --network=networkName
# -e == --env
# -d run in detached mode
# --rm delete container after exiting
# -p binding de ports
# docker tag image_id url/image_name
# docker push image_name