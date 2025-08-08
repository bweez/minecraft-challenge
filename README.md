# Start Your Own Minecraft Server (with Docker + VS Code)

This guide shows a beginner-friendly way to run a Minecraft Java Edition server on your computer using Docker and VS Code. No coding needed—just follow the steps.

## What you’ll need
- Minecraft Java Edition installed (you’ll play on your computer)
- Docker Desktop installed and running
- Visual Studio Code installed

Helpful links (optional):
- Docker Desktop: https://www.docker.com/products/docker-desktop/
- Visual Studio Code: https://code.visualstudio.com/

## 1) Get the files
Option A: Download ZIP (easiest)
- Click the green “Code” button on the GitHub page → “Download ZIP”
- Open the ZIP and drag the folder to your Desktop (or Documents)

Option B: Use git (optional)
```bash
git clone https://github.com/bweez/minecraft-challenge.git
```

## 2) Open the folder in VS Code
1. Open VS Code
2. File → Open Folder… → choose the project folder you downloaded
3. Open a terminal in VS Code: View → Terminal

You should see the terminal path ending with the project folder name.

## 3) Start the server (the easy way)
We’ll use “docker compose” so you don’t have to type long commands.

In the VS Code terminal, run:
```bash
docker compose build
docker compose up -d
```

What this does:
- Builds the Minecraft server image
- Starts the server in the background
- Saves your world to the project’s `server_data/` folder so it doesn’t get lost

See the server logs:
```bash
docker compose logs -f
```
(Press Ctrl+C to stop watching the logs. The server keeps running.)

Stop the server:
```bash
docker compose down
```

## 4) Join your server in Minecraft
1. Open Minecraft Java Edition
2. Click Multiplayer → Add Server
3. Server Address: `localhost:25565`
4. Join the server

Tip: The server is set to creative and peaceful so you can explore safely.

## 5) Do you prefer plain Docker commands? (optional)
Same thing without docker compose:
```bash
docker build -t minecraft-local .

docker run --name minecraft-server \
   -p 25565:25565 -p 25575:25575 \
   -v "$(pwd)/server_data/world:/server/world" \
   -v "$(pwd)/server_data/world_nether:/server/world_nether" \
   -v "$(pwd)/server_data/world_the_end:/server/world_the_end" \
   -v "$(pwd)/server_data/logs:/server/logs" \
   -d minecraft-local

# View logs
docker logs -f minecraft-server

# Stop and remove the server
docker stop minecraft-server && docker rm minecraft-server
```

On Windows PowerShell, use ${PWD} instead of $(pwd) in the volume lines.

## 6) Reset or back up your world
- Your world lives in the `server_data/` folder
- To reset: stop the server, then delete `server_data/world*` folders, and start again
- To back up: copy the `server_data/` folder somewhere safe while the server is stopped

## Troubleshooting (quick fixes)
- Docker says “command not found”: Install Docker Desktop and reopen VS Code
- Server won’t start: Make sure Docker Desktop is running
- Port already in use: Close other servers or change the left side of `25565:25565` to `25566:25565`
- Can’t connect from Minecraft: Make sure the server is running; use `docker compose logs -f` to check
- Stuck? Stop and restart:
   ```bash
   docker compose down
   docker compose up -d
   ```

## What’s inside
- PaperMC 1.20.1 (a fast Minecraft server)
- Friendly defaults: creative, peaceful, offline-mode=false
- Ports: 25565 (Minecraft), 25575 (RCON)
- Data saved locally under `server_data/`

That’s it—have fun exploring your own server!
