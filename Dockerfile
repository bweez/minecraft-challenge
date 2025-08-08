# Minimal PaperMC Minecraft Server image (no plugins)
FROM eclipse-temurin:17-jdk

# Set working directory where server will run
WORKDIR /server

# Install tools and download Paper Minecraft Server 1.20.1 (build 50)
# Paper is a high-performance Minecraft server implementation
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl -fsSL -o paper.jar "https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/50/downloads/paper-1.20.1-50.jar" \
    && ls -la paper.jar \
    && apt-get purge -y curl \
    && rm -rf /var/lib/apt/lists/*

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
    && java -version

# Expose ports (25565: Minecraft, 25575: RCON)
EXPOSE 25565 25575

# Start the Minecraft server (1GB heap, no GUI)
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "paper.jar", "--nogui"]
