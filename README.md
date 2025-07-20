# 🎮 Minecraft Coding Challenge

Welcome to the most fun way to learn Java programming! Create your own Minecraft plugins and see your code come to life in the game.

## 🚀 Quick Start with Docker

This project uses **Docker** to create a consistent Minecraft server environment. Here's how to get started:

### 1. Open in GitHub Codespace
- Click the green "Code" button above
- Select "Create codespace on main"
- Wait for the environment to load

### 2. Build and Run the Server
```bash
# Build the Minecraft server with your plugin
docker-compose build

# Start the server
docker-compose up
```

### 3. What Happens Next
- Docker downloads Paper Minecraft Server 1.20.1
- Compiles your Java plugin automatically
- Starts the server on port 25565
- Your plugin loads and becomes available in-game!

### 4. Connect and Test
- Check the "Ports" tab in VS Code for the forwarded URL
- Connect with Minecraft Java Edition 1.20.1
- Type `/hello` in chat to test your plugin!

## 📖 Understanding the Setup

### The Docker Advantage
- **Consistent Environment**: Same setup for everyone
- **No Local Installation**: Everything runs in containers
- **Easy Rebuilds**: Change code, rebuild, test immediately
- **Persistence**: Your world data survives container restarts

### Key Files
- `Dockerfile` - Instructions to build the Minecraft server
- `docker-compose.yml` - Configuration to run everything
- `plugin/` - Your Java plugin source code
- `server_data/` - Persistent world data

## 🎯 What You'll Learn

- **Java Programming** - Variables, methods, object-oriented programming
- **Minecraft Plugin Development** - Using the Paper API
- **Docker Basics** - Container management and debugging
- **Problem Solving** - Breaking challenges into manageable steps
- 🚀 **Auto-setup** - Java 17, Maven, and all extensions pre-installed
- 🛠️ **Helpful commands** - `mcbuild`, `mcpackage`, `mctest` aliases ready to use  
- 🎯 **Quick start** - Run `./quick-start.sh` to begin your first challenge
- 📚 **Complete guides** - Detailed help in `.devcontainer/CODESPACE_GUIDE.md`

#### Option B: Local Development
✅ **Pros**: Everything runs on your computer  
❌ **Cons**: Requires installing Java, Maven, and Docker locally

### 2A. Setup for GitHub Codespaces Users

**Step 1: Code in the Cloud**
1. Click the green "Code" button → "Codespaces" → "Create codespace"
2. Wait for the environment to load (about 2-3 minutes)
3. Verify everything works:
   ```bash
   cd plugin
   mvn clean compile
   ```
   ✅ You should see `BUILD SUCCESS`

**Step 2: Download for Local Gaming**
Since your Minecraft client needs to connect to a local server, you'll need to:

1. **Download this repository to your local computer**:
   - Click "Code" → "Download ZIP" 
   - Extract the ZIP file to your desktop
   - Or use git: `git clone https://github.com/bweez/minecraft-challenge.git`

2. **Install Docker on your local computer**:
   - Download from [docker.com](https://www.docker.com/products/docker-desktop/)
   - Follow the installation instructions for your operating system

3. **Start your local Minecraft server**:
   ```bash
   # In your local terminal (not Codespace!)
   cd minecraft-challenge
   ./start.sh
   ```

**Step 3: Your Workflow**
- 💻 **Code in Codespace**: Edit files, build, and test compilation
- 📦 **Transfer to Local**: Copy your updated plugin JAR to your local setup
- 🎮 **Test in Minecraft**: Connect to your local server to see it in action

### 2B. Setup for Local Development Users

**Step 1: Install Requirements**
- **Java 17+**: Download from [adoptium.net](https://adoptium.net/)
- **Maven**: Download from [maven.apache.org](https://maven.apache.org/download.cgi)
- **Docker**: Download from [docker.com](https://www.docker.com/products/docker-desktop/)
- **Git**: Download from [git-scm.com](https://git-scm.com/)

**Step 2: Clone and Setup**
```bash
git clone https://github.com/bweez/minecraft-challenge.git
cd minecraft-challenge
cd plugin
mvn clean compile
```

**Step 3: Start Your Server**
```bash
# From the root directory
./start.sh
```

### 3. Connect to Your Server (Both Options)

1. **Open Minecraft Java Edition** (on your local computer)
2. **Go to Multiplayer**
3. **Add Server**:
   - Server Name: `My Coding Challenge`
   - Server Address: `localhost:25565`
4. **Join the server!**

### 4. Test Your First Command

In the Minecraft chat, type:
```
/hello
```

You should see: `Hello, world!`

🎉 **Congratulations!** Your development environment is ready!

> 🔍 **Not sure if everything is working?** Use our [Setup Verification Guide](docs/setup-verification.md) to double-check!

## 📚 Learning Path

### 🥇 **Beginner Challenges**
1. **[Your First Command](challenges/challenge-1-first-command.md)** - Create colorful commands
2. **[Magic Messages](challenges/challenge-2-magic-messages.md)** - Interactive commands with arguments
3. **[Item Giver](challenges/challenge-3-item-giver.md)** - Give players awesome items *(Coming Soon)*
4. **[Teleportation Fun](challenges/challenge-4-teleportation.md)** - Move players around the world *(Coming Soon)*

### 🥈 **Intermediate Challenges** *(Coming Soon)*
5. **Weather Controller** - Control the weather and time
6. **Pet Summoner** - Spawn and control friendly mobs
7. **Block Builder Pro** - Advanced building tools
8. **Mini-Game Creator** - Create interactive games

### 🥇 **Advanced Challenges** *(Coming Soon)*
9. **Treasure Hunt Master** - Complex quest systems
10. **Ultimate Plugin** - Combine everything you've learned

## 💻 Development Workflow

### For GitHub Codespace Users

**Making Changes (in Codespace):**
1. **Edit the Code**:
   - Open `plugin/src/main/java/com/example/Main.java` in Codespace
   - Make your changes following the challenge guides

2. **Build and Test Compilation**:
   ```bash
   cd plugin
   mvn clean package
   ```

3. **Transfer to Local Setup**:
   - Download the built JAR from `plugin/target/minecraft-plugin-1.0-SNAPSHOT.jar`
   - Copy it to your local `minecraft-challenge/plugin/target/` folder
   - Or rebuild locally: `mvn clean package` (in your local terminal)

4. **Test in Minecraft**:
   - Restart your local Minecraft server: `./start.sh`
   - Test your commands in-game

### For Local Development Users

**Making Changes (all local):**
1. **Edit the Code**:
   - Open `plugin/src/main/java/com/example/Main.java` in your favorite editor
   - Make your changes following the challenge guides

2. **Build the Plugin**:
   ```bash
   cd plugin
   mvn clean package
   ```

3. **Test in Minecraft**:
   - Restart your server: `./start.sh`
   - Test your commands in-game

4. **Debug Issues**:
   ```bash
   # View server logs
   docker logs -f minecraft-server-container
   ```

### File Structure
```
minecraft-challenge/
├── plugin/                 # Your plugin code goes here
│   ├── src/main/java/     # Java source files
│   ├── src/main/resources/ # plugin.yml configuration
│   └── pom.xml            # Build configuration
├── challenges/            # Step-by-step learning guides
├── examples/             # Working code examples
├── docs/                # Quick reference guides
└── tools/               # Helper scripts
```

## 📖 Quick Reference

### Essential Commands
```bash
# Build your plugin
cd plugin && mvn clean package

# Start/restart the server
./start.sh

# View server logs
docker logs -f minecraft-server-container

# Stop the server
docker stop minecraft-server-container
```

### Minecraft Color Codes
```
§a = Green    §c = Red      §9 = Blue
§e = Yellow   §d = Purple   §b = Aqua
§6 = Gold     §f = White    §7 = Gray
```

### Basic Command Structure
```java
if (command.getName().equalsIgnoreCase("yourcommand")) {
    sender.sendMessage("§aYour message here!");
    return true;
}
```

## 🆘 Troubleshooting

### Plugin Won't Compile
- ❌ **Check for syntax errors** - missing semicolons, unmatched brackets
- ❌ **Verify imports** - make sure all imports are correct
- ❌ **Maven issues** - try `mvn clean compile` first

### Command Not Working
- ❌ **Check plugin.yml** - make sure your command is registered
- ❌ **Case sensitivity** - commands should use `equalsIgnoreCase()`
- ❌ **Plugin transfer** - (Codespace users) make sure you copied the latest JAR
- ❌ **Server restart** - restart after major changes

### Can't Connect to Server
- ❌ **Server not running locally** - make sure you're running `./start.sh` on your LOCAL computer
- ❌ **Docker not installed** - install Docker Desktop on your local machine
- ❌ **Port conflicts** - make sure nothing else uses port 25565
- ❌ **Minecraft version** - use Java Edition, not Bedrock

### Codespace-Specific Issues
- ❌ **File sync** - remember to download updated files from Codespace to local
- ❌ **Different locations** - coding happens in cloud, gaming happens locally
- ❌ **JAR file location** - make sure the built JAR is in your local setup

### Local Development Issues  
- ❌ **Java version** - make sure you have Java 17 or higher
- ❌ **Maven not found** - ensure Maven is installed and in your PATH
- ❌ **Docker not running** - start Docker Desktop before running the server

### Need Help?
- 📚 **Check the challenge guides** - they have detailed explanations
- 🔍 **Look at examples** - working code in `examples/` folder
- 📖 **Read the documentation** - quick reference in `docs/` folder

## 🎊 Achievement System

Track your progress as you complete challenges:

- [ ] 🥇 Completed Challenge 1: Your First Command
- [ ] 🥇 Completed Challenge 2: Magic Messages  
- [ ] 🥇 Completed Challenge 3: Item Giver
- [ ] 🥇 Completed Challenge 4: Teleportation Fun
- [ ] 🥈 Created 5 custom commands
- [ ] 🥈 Used all color codes
- [ ] 🥈 Built your first mini-game
- [ ] 🥇 Shared your plugin with friends

## 🌟 Tips for Success

1. **Start Small** - Complete each challenge step by step
2. **Test Often** - Build and test after each change
3. **Experiment** - Try your own ideas and modifications
4. **Don't Give Up** - Every programmer makes mistakes - they're how we learn!
5. **Have Fun** - The best code comes from having fun while creating

## 🤝 Contributing

Found a bug or have an idea for improvement? 
- Open an issue on GitHub
- Submit a pull request
- Share your cool plugin ideas!

---

**Ready to start coding?** Begin with [Challenge 1: Your First Command](challenges/challenge-1-first-command.md)! 🚀

**Happy Coding!** 🎮✨
