# Minecraft Coding Challenge - Docker Guide

## What You're Running

This project uses **Docker** to create a consistent Minecraft server environment that works the same way on any system. Here's what happens when you run the server:

### The Docker Setup

1. **Dockerfile** - Instructions to build a Minecraft server image
2. **docker-compose.yml** - Configuration to run the server container
3. **Your Plugin** - Gets compiled and loaded into the server automatically

## Understanding the Architecture

```
┌─────────────────────────────────────────┐
│ GitHub Codespace (Linux VM)            │
│                                         │
│  ┌─────────────────────────────────┐    │
│  │ Docker Container                │    │
│  │                                 │    │
│  │  ├── Paper Minecraft Server     │    │
│  │  ├── Your Plugin (compiled)     │    │
│  │  ├── Java 17 Runtime           │    │
│  │  └── Server Configuration       │    │
│  │                                 │    │
│  │  Ports: 25565 (Game)           │    │
│  │         25575 (Admin/RCON)     │    │
│  └─────────────────────────────────┘    │
│                                         │
│  Your Code: /workspaces/minecraft-      │
│              challenge/plugin/          │
└─────────────────────────────────────────┘
```

## Essential Docker Commands

### Building the Server
```bash
# Build the Docker image (compiles your plugin)
docker-compose build

# Or build with no cache (fresh build)
docker-compose build --no-cache
```

### Running the Server
```bash
# Start the server (runs in foreground)
docker-compose up

# Start the server in background
docker-compose up -d

# Stop the server
docker-compose down
```

### Monitoring & Debugging
```bash
# See all containers (running and stopped)
docker ps -a

# View server logs (if running in background)
docker-compose logs

# Follow live logs
docker-compose logs -f

# Get into the running container (for debugging)
docker-compose exec minecraft bash

# Check what images you have built
docker images
```

### When Things Go Wrong
```bash
# Stop everything and clean up
docker-compose down

# Remove the stopped container
docker-compose rm

# Rebuild from scratch
docker-compose build --no-cache
docker-compose up
```

## What Happens When You Build

1. **Stage 1 (Builder Container)**:
   - Downloads Maven and Java 17
   - Copies your plugin source code
   - Runs `mvn clean package` to compile your plugin

2. **Stage 2 (Runtime Container)**:
   - Downloads Paper Minecraft Server 1.20.1
   - Copies your compiled plugin to plugins folder
   - Sets up server configuration
   - Starts the server

## Understanding the Server Environment

### Files in the Container
- `/server/paper.jar` - The Minecraft server
- `/server/plugins/` - Your compiled plugin goes here
- `/server/eula.txt` - Minecraft EULA acceptance
- `/server/server.properties` - Server configuration
- `/server/world/` - Game world data (persisted via volume)

### Server Configuration
- **Game Mode**: Creative (for easy building/testing)
- **Difficulty**: Peaceful (no monsters)
- **Online Mode**: False (no Minecraft account required)
- **Max Players**: 10
- **RCON**: Enabled (for remote administration)

## Troubleshooting Common Issues

### "Unable to access jarfile paper.jar"
- **Cause**: Volume mount issues in docker-compose.yml
- **Fix**: Check that volume mounts don't override `/server` directory

### "Plugin failed to load"
- **Cause**: Compilation errors or wrong API version
- **Fix**: Check plugin.yml and Java compilation errors
- **Debug**: `docker-compose logs` to see error messages

### "Container exits immediately"
- **Cause**: Server startup error
- **Fix**: Run `docker-compose logs` to see what went wrong
- **Common**: Memory issues, port conflicts, configuration errors

### "Can't connect from Minecraft client"
- **Cause**: Port forwarding not working
- **Fix**: Check Codespace ports panel, ensure 25565 is forwarded

## Codespace-Specific Considerations

### When Your Codespace Stops
- **Containers stop**: You'll need to run `docker-compose up` again
- **Images persist**: Your built images are saved
- **Volumes persist**: World data is saved in `./server_data/`
- **Code persists**: Your plugin source code is safe

### Port Forwarding
- Codespace automatically forwards port 25565 when detected
- Check the "Ports" tab in VS Code
- Use the forwarded URL to connect external Minecraft clients

### Resource Limits
- Codespaces have CPU/memory limits
- Minecraft server uses ~1GB RAM (configured in Dockerfile)
- Build process uses additional memory temporarily

## Development Workflow

1. **Edit your plugin** in `/plugin/src/main/java/com/example/`
2. **Test compilation** with `mvn clean package` (optional)
3. **Rebuild container** with `docker-compose build`
4. **Start server** with `docker-compose up`
5. **Test in game** by connecting to the server
6. **View logs** with `docker-compose logs`
7. **Iterate** - repeat steps 1-6

## Quick Commands Reference

```bash
# Essential workflow
docker-compose build        # Rebuild after code changes
docker-compose up          # Start server
docker-compose down        # Stop server
docker-compose logs        # View server output

# Debugging
docker ps -a               # Show all containers
docker images              # Show all images
docker-compose exec minecraft bash  # Get shell in container

# Cleanup
docker-compose down        # Stop
docker system prune -f     # Clean up unused images/containers
```

## Next Steps

1. Try modifying the plugin code
2. Rebuild with `docker-compose build`
3. Start the server with `docker-compose up`
4. Connect with a Minecraft client or use RCON tools
5. See your changes in action!

---

*Remember: Docker ensures everyone gets the same server environment, regardless of their local setup. Understanding these commands will help you debug issues and manage the server effectively.*
