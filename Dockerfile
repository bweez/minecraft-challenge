# Stage 1: Build the plugin
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /build
COPY plugin /build
RUN mvn clean package

# Stage 2: Run the Paper server
FROM eclipse-temurin:17-jdk
WORKDIR /server
ADD https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/50/downloads/paper-1.20.1-50.jar paper.jar
COPY --from=builder /build/target/*.jar plugins/
RUN echo "eula=true" > eula.txt
EXPOSE 25565
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "paper.jar", "--nogui"]
