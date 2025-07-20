# 🎓 Understanding Docker for Minecraft Development

## What is Docker?

Docker is like a **virtual shipping container** for applications. Just like shipping containers allow goods to be transported consistently regardless of the ship or truck, Docker containers allow applications to run consistently regardless of the computer.

## Why Use Docker for Minecraft?

### The Problem Without Docker
- "It works on my machine" syndrome
- Complex setup instructions
- Different Java versions cause issues
- Maven/dependency conflicts
- Operating system differences

### The Solution With Docker
- **Same environment everywhere** - Your code runs identically for everyone
- **No installation hassles** - Everything is pre-configured
- **Easy cleanup** - Delete container, start fresh
- **Isolation** - Your project doesn't interfere with other software

## Docker Concepts for This Project

### 1. **Dockerfile** - The Recipe
Think of this as a recipe for building your Minecraft server:

```dockerfile
# Get a computer with Java 17
FROM eclipse-temurin:17-jdk

# Download Minecraft server
RUN curl -o paper.jar "https://..."

# Add your plugin
COPY plugin.jar plugins/

# Start the server
CMD ["java", "-jar", "paper.jar"]
```

### 2. **Image** - The Blueprint
When you run `docker-compose build`, Docker follows the Dockerfile recipe to create an **image** - like a snapshot of a computer with everything installed.

### 3. **Container** - The Running Server
When you run `docker-compose up`, Docker creates a **container** from the image - like turning on a computer with your server software.

### 4. **Volumes** - Persistent Storage
Containers are temporary, but volumes let you save data:
- Your world files persist between restarts
- Logs are saved to your local machine
- Plugin configurations are preserved

## Multi-Stage Build Explained

Our Dockerfile uses two stages:

### Stage 1: Builder
```dockerfile
FROM maven:3.9-eclipse-temurin-17 AS builder
COPY plugin /build
RUN mvn clean package
```
- Uses a Maven image (has Java + Maven installed)
- Compiles your plugin code
- Creates the plugin JAR file

### Stage 2: Runtime
```dockerfile
FROM eclipse-temurin:17-jdk
COPY --from=builder /build/target/*.jar plugins/
```
- Uses a smaller Java-only image
- Copies the compiled plugin from Stage 1
- Sets up the Minecraft server

**Why two stages?**
- Smaller final image (no Maven bloat)
- Separation of build tools vs runtime
- More secure (no build tools in production)

## Understanding the Build Process

When you run `docker-compose build`:

1. **Download base images** (Maven, Java)
2. **Stage 1**: Compile your plugin
   - Copy plugin source code
   - Run `mvn clean package`
   - Create `minecraft-plugin-1.0-SNAPSHOT.jar`
3. **Stage 2**: Assemble server
   - Download Paper Minecraft server
   - Copy compiled plugin from Stage 1
   - Create server configuration
   - Set up startup command

Result: A complete image ready to run your server!

## Container Lifecycle

### Starting
```bash
docker-compose up
```
- Creates container from image
- Mounts volumes for persistent data
- Exposes ports 25565 and 25575
- Runs startup command: `java -jar paper.jar`

### Running
- Container is an isolated Linux environment
- Has its own filesystem, network, processes
- Your plugin runs inside this environment
- Data written to volumes persists outside container

### Stopping
```bash
docker-compose down
```
- Sends shutdown signal to Minecraft server
- Waits for graceful shutdown
- Removes the container (but keeps the image and volumes)

## Development Workflow with Docker

### Traditional Development
1. Install Java locally
2. Install Maven locally
3. Download Minecraft server
4. Configure everything
5. Run server locally
6. Debug environment issues

### Docker Development
1. Edit code in VS Code
2. `docker-compose build` (rebuild with changes)
3. `docker-compose up` (start server)
4. Test in Minecraft
5. Repeat!

**Advantages:**
- No local software installation
- Consistent environment for all developers
- Easy to reset/clean state
- Version control of entire environment

## Debugging with Docker

### View Logs
```bash
docker-compose logs -f
```
See everything the server outputs in real-time.

### Get Inside Container
```bash
docker-compose exec minecraft bash
```
Open a terminal inside the running container to explore.

### Check Files
```bash
docker run --rm minecraft-challenge-minecraft ls -la /server/plugins
```
List files in the container without starting the server.

### Resource Usage
```bash
docker stats
```
See how much CPU/memory your container uses.

## Common Docker Patterns

### Clean Rebuild
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up
```
Use when your changes aren't showing up.

### Background Running
```bash
docker-compose up -d    # Start in background
docker-compose logs -f  # View logs
docker-compose down     # Stop background server
```

### Data Management
```bash
# Your world data is in:
./server_data/world/

# To reset world:
rm -rf ./server_data/world/
docker-compose up  # Creates new world
```

## Why This Approach Works for Learning

1. **Focus on Code**: Spend time learning Java, not configuring servers
2. **Immediate Feedback**: Change code → rebuild → test in minutes
3. **Reproducible**: Your instructor can run the exact same environment
4. **Professional Practice**: Docker is widely used in real software development
5. **Easy Sharing**: Share your entire environment via the Dockerfile

## Next Steps

Once you understand Docker basics:
- Experiment with different base images
- Add more plugins to the server
- Customize server configuration
- Learn about Docker networking
- Explore production deployment patterns

---

💡 **Remember**: Docker might seem complex at first, but it's solving real problems that make development much easier once you understand the basics!
