# 🛠️ Troubleshooting Guide

## Container Won't Start

### Problem: "Unable to access jarfile paper.jar"
**What it means**: The server can't find the Minecraft server file.

**Diagnosis**:
```bash
docker-compose logs
```

**Common causes**:
- Volume mount is overriding the `/server` directory
- Build failed silently
- Wrong working directory

**Solutions**:
1. Check volume mounts in `docker-compose.yml`
2. Rebuild with `docker-compose build --no-cache`
3. Verify files exist: `docker run --rm minecraft-challenge-minecraft ls -la /server`

### Problem: Container exits immediately
**What it means**: Server crashed during startup.

**Diagnosis**:
```bash
docker-compose logs
docker ps -a  # Check exit code
```

**Common causes**:
- Memory issues
- Port conflicts
- Configuration errors

**Solutions**:
1. Check available memory: `docker stats`
2. Ensure ports 25565/25575 aren't in use: `netstat -tulpn | grep 25565`
3. Review server.properties configuration

## Plugin Issues

### Problem: Plugin doesn't load
**What it means**: Your plugin compilation failed or has errors.

**Diagnosis**:
```bash
docker-compose logs | grep -i plugin
docker-compose logs | grep -i error
```

**Common causes**:
- Java compilation errors
- Wrong API version in plugin.yml
- Missing dependencies

**Solutions**:
1. Test compilation locally: `cd plugin && mvn clean package`
2. Check API version matches server version (1.20)
3. Verify plugin.yml syntax

### Problem: Plugin loads but commands don't work
**What it means**: Plugin loaded but functionality isn't working.

**Diagnosis**:
```bash
# Check if plugin is enabled
docker-compose logs | grep "Enabling.*Plugin"

# Test commands via RCON
docker-compose exec minecraft rcon-cli
```

**Solutions**:
1. Check command registration in `onEnable()` method
2. Verify command permissions
3. Test with `/plugins` command in-game

## Connection Issues

### Problem: Can't connect from Minecraft client
**What it means**: Network connectivity issues.

**Diagnosis**:
```bash
# Check if server is listening
docker-compose exec minecraft netstat -tulpn | grep 25565

# Check Codespace port forwarding
# Look at VS Code "Ports" tab
```

**Solutions**:
1. Ensure server finished starting (look for "Done" message)
2. Check VS Code Ports panel for forwarded URL
3. Use correct Minecraft version (1.20.1)
4. Verify `online-mode=false` in server.properties

### Problem: Connection timeout
**What it means**: Network packets aren't reaching the server.

**Solutions**:
1. Check firewall settings
2. Verify Codespace port forwarding is active
3. Try connecting to localhost:25565 if running locally

## Docker Issues

### Problem: "No space left on device"
**What it means**: Docker ran out of disk space.

**Solutions**:
```bash
# Clean up unused images/containers
docker system prune -f

# Remove old images
docker image prune -f

# Check disk usage
docker system df
```

### Problem: Build fails with Maven errors
**What it means**: Java compilation or dependency issues.

**Diagnosis**:
```bash
docker-compose build 2>&1 | grep -i error
```

**Solutions**:
1. Check internet connectivity for Maven downloads
2. Clean build: `docker-compose build --no-cache`
3. Verify `pom.xml` syntax

## Codespace-Specific Issues

### Problem: Codespace stops/hibernates
**What it means**: GitHub paused your environment to save resources.

**What persists**:
- ✅ Your code
- ✅ Built Docker images  
- ✅ World data in volumes
- ❌ Running containers

**Recovery**:
```bash
# Simply restart everything
docker-compose up
```

### Problem: Port forwarding not working
**What it means**: VS Code isn't forwarding the Minecraft port.

**Solutions**:
1. Check "Ports" tab in VS Code
2. Manually add port 25565 if missing
3. Set port visibility to "Public" if needed
4. Restart the container: `docker-compose restart`

## Performance Issues

### Problem: Server is slow/laggy
**What it means**: Resource constraints.

**Diagnosis**:
```bash
# Check resource usage
docker stats

# Check server TPS (ticks per second)
# Connect via RCON: docker-compose exec minecraft rcon-cli
# Run: tps
```

**Solutions**:
1. Reduce world size in server.properties
2. Lower view-distance setting
3. Use peaceful difficulty
4. Restart container: `docker-compose restart`

## Getting Help

### Useful Commands for Debugging
```bash
# Full server logs
docker-compose logs

# Follow logs in real-time
docker-compose logs -f

# Get into the container
docker-compose exec minecraft bash

# Check what's running
docker ps -a

# View container resources
docker stats

# Inspect the built image
docker run --rm -it minecraft-challenge-minecraft bash
```

### What to Include in Bug Reports
1. Full output of `docker-compose logs`
2. Your modified plugin code
3. Steps to reproduce the issue
4. What you expected vs. what happened
5. Output of `docker ps -a`

---

💡 **Remember**: Most issues can be solved by reading the logs carefully with `docker-compose logs`!
