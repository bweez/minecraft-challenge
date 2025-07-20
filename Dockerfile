# ============================================================================
# Minecraft Coding Challenge - Docker Image
# 
# This Dockerfile creates a Paper Minecraft server with your custom plugin
# 
# Build process:
# 1. Compile your Java plugin with Maven
# 2. Download Paper Minecraft Server 1.20.1
# 3. Configure server for educational use
# 4. Include your compiled plugin
# ============================================================================

# Stage 1: Build the plugin using Maven
# Uses official Maven image with Eclipse Temurin JDK 17
FROM maven:3.9-eclipse-temurin-17 AS builder

# Set working directory for the build
WORKDIR /build

# Copy plugin source code into the container
COPY plugin /build

# Compile the plugin
# This creates target/minecraft-plugin-1.0-SNAPSHOT.jar
RUN mvn clean package

# Stage 2: Create the runtime Minecraft server
# Uses Eclipse Temurin JDK 17 for running the server
FROM eclipse-temurin:17-jdk

# Set working directory where server will run
WORKDIR /server

# Create directory for plugins
RUN mkdir -p plugins

# Download Paper Minecraft Server 1.20.1 (build 50)
# Paper is a high-performance Minecraft server implementation
RUN curl -o paper.jar "https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/50/downloads/paper-1.20.1-50.jar" \
    && ls -la paper.jar

# Copy the compiled plugin from the builder stage
# Only copy the main JAR, not the original-* version
COPY --from=builder /build/target/minecraft-plugin-*.jar plugins/

# Accept Minecraft EULA (required to run server)
RUN echo "eula=true" > eula.txt

# Create server configuration optimized for development/learning
# Key settings:
# - Creative mode for easy building
# - Peaceful difficulty (no monsters)
# - Offline mode (no Minecraft account required)
# - RCON enabled for remote administration
RUN echo "# Minecraft server properties - Educational Configuration" > server.properties \
    && echo "max-players=10" >> server.properties \
    && echo "server-port=25565" >> server.properties \
    && echo "online-mode=false" >> server.properties \
    && echo "difficulty=peaceful" >> server.properties \
    && echo "gamemode=creative" >> server.properties \
    && echo "motd=Minecraft Coding Challenge Server" >> server.properties \
    && echo "enable-rcon=true" >> server.properties \
    && echo "rcon.port=25575" >> server.properties \
    && echo "rcon.password=minecraft" >> server.properties

# Verify the setup (helpful for debugging)
RUN ls -la \
    && ls -la plugins/ \
    && java -version

# Expose ports for external connections
# 25565: Minecraft game port
# 25575: RCON administration port
EXPOSE 25565 25575

# Start the Minecraft server
# Memory allocation: 1GB min/max (suitable for development)
# --nogui: Run without graphical interface (required in containers)
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "paper.jar", "--nogui"]
