# 🐳 Docker Quick Reference

## Essential Commands

### Building & Running
```bash
# Build the server (compile plugin + setup server)
docker-compose build

# Start server (foreground - see logs live)
docker-compose up

# Start server (background - runs quietly)
docker-compose up -d

# Stop the server
docker-compose down
```

### Monitoring & Debugging
```bash
# See what's running
docker ps

# See all containers (including stopped)
docker ps -a

# View server logs
docker-compose logs

# Follow logs in real-time
docker-compose logs -f

# Get into the container (for debugging)
docker-compose exec minecraft bash
```

### When Things Break
```bash
# Stop everything
docker-compose down

# Clean rebuild (if code changes aren't showing up)
docker-compose build --no-cache
docker-compose up

# Nuclear option - clean everything
docker system prune -f
docker-compose build --no-cache
```

## Understanding Your Setup

### What Gets Built
1. **Maven Builder Stage**: Compiles your Java plugin
2. **Server Runtime Stage**: Downloads Paper server + your plugin
3. **Final Image**: Ready-to-run Minecraft server with your code

### File Locations in Container
- `/server/paper.jar` - Minecraft server
- `/server/plugins/` - Your compiled plugin
- `/server/world/` - Game world (saved to host)
- `/server/server.properties` - Server config

### Port Mapping
- `25565` - Minecraft game port
- `25575` - RCON admin port

## Common Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| "Unable to access jarfile" | Volume mount issue | Check docker-compose.yml volumes |
| Plugin not loading | Compilation error | Check `docker-compose logs` |
| Can't connect | Port forwarding | Check VS Code Ports tab |
| Container exits | Server crash | Run `docker-compose logs` |

## Development Workflow

1. Edit plugin code in `plugin/src/main/java/`
2. `docker-compose build` (rebuild with changes)
3. `docker-compose up` (start server)
4. Test in Minecraft client
5. Repeat!

---
💡 **Pro Tip**: Keep `docker-compose logs -f` running in a separate terminal to see live server output while you develop!
