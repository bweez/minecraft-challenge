# 🚀 GitHub Codespaces Setup Guide

## What is GitHub Codespaces?

GitHub Codespaces is a cloud-based development environment that lets you code in your browser without installing anything on your computer. It's perfect for this Minecraft coding challenge because:

✅ **No Setup Required** - Everything is pre-configured  
✅ **Works Anywhere** - Any computer with a web browser  
✅ **Full VS Code** - Complete development environment  
✅ **Auto-Save** - Your work is automatically saved to GitHub  

## 🎯 Important Understanding

**Two-Part Process:**
1. **💻 Coding** - Done in Codespaces (cloud)
2. **🎮 Gaming** - Done on your local computer

**Why?** Minecraft needs direct access to your computer's graphics and networking, which cloud environments can't provide.

## 🚀 Getting Started

### Step 1: Create Your Codespace

1. **Go to the repository** on GitHub
2. **Click the green "Code" button**
3. **Select "Codespaces" tab**
4. **Click "Create codespace on main"**
5. **Wait 2-3 minutes** for setup to complete

### Step 2: Verify Everything Works

Once your Codespace loads, you should see:
- VS Code interface in your browser
- Terminal at the bottom
- File explorer on the left
- Welcome message with helpful commands

**Test your setup:**
```bash
mcbuild
```
You should see `BUILD SUCCESS` ✅

### Step 3: Start Your First Challenge

1. **Open the first challenge:**
   ```bash
   code challenges/challenge-1-first-command.md
   ```

2. **Open your main code file:**
   ```bash
   code plugin/src/main/java/com/example/Main.java
   ```

3. **Follow the tutorial** in the challenge file

## 🛠️ Pre-Installed Tools

Your Codespace comes with:

### Development Tools
- **Java 17** - Latest LTS version for plugin development
- **Maven** - Build and dependency management
- **Git** - Version control (pre-configured)
- **VS Code Extensions** - Java language support, debugging, testing

### Helpful Commands
| Command | What it does |
|---------|-------------|
| `mcbuild` | Compile your plugin |
| `mcpackage` | Build JAR file for deployment |
| `mctest` | Run unit tests |
| `mcplugin` | Navigate to plugin directory |
| `mcchallenges` | Navigate to challenges directory |
| `mcexamples` | Navigate to examples directory |

### File Navigation
- **Main Code**: `plugin/src/main/java/com/example/Main.java`
- **Challenges**: `challenges/` directory
- **Examples**: `examples/` directory
- **Documentation**: `docs/` directory

## 🎮 Testing Your Plugin In-Game

Since Minecraft must run locally, you'll need to:

### Option A: Download and Run Locally (Recommended)
1. **Download this repository** to your computer:
   - Click "Code" → "Download ZIP" on GitHub
   - Extract the ZIP file

2. **Install Docker Desktop** on your computer:
   - Visit [docker.com](https://docker.com) and download Docker Desktop
   - Follow installation instructions for your operating system

3. **Run the Minecraft server**:
   ```bash
   # In the downloaded folder
   docker-compose up
   ```

4. **Copy your code** from Codespace:
   - Download your modified `Main.java` from Codespace
   - Replace the local version
   - Rebuild: `docker-compose restart`

### Option B: Manual Plugin Transfer
1. **Build in Codespace**:
   ```bash
   mcpackage
   ```

2. **Download the JAR**:
   - Navigate to `plugin/target/`
   - Download `minecraft-plugin-1.0-SNAPSHOT.jar`

3. **Copy to local server**:
   - Place in your local `plugins/` folder
   - Restart your local Minecraft server

## 🔄 Development Workflow

**Recommended workflow for Codespace users:**

1. **Code in Codespace** - Write and test compilation
2. **Download changes** - Get your updated code
3. **Test locally** - Run on your local Minecraft server
4. **Iterate** - Go back to step 1

## 💡 Pro Tips

### Efficient Development
- **Use GitHub Copilot** - Ask for help with code
- **Enable auto-save** - Your work saves automatically
- **Use split screen** - Tutorial on left, code on right
- **Terminal shortcuts** - Use the helpful aliases

### Code Organization
- **Comment your code** - Explain what each part does
- **Use meaningful names** - Make variables descriptive
- **Test frequently** - Use `mcbuild` after changes
- **Follow examples** - Look at the working samples

### Troubleshooting
- **Build fails?** - Check syntax errors in Problems panel
- **Code not working?** - Compare with examples
- **Stuck?** - Ask GitHub Copilot for help
- **Lost work?** - Check Git history

## ⚠️ Common Issues & Solutions

### "BUILD FAILURE"
**Problem**: Code won't compile  
**Solution**: Check the Problems panel (View → Problems) for error details

### "Cannot find symbol"
**Problem**: Misspelled class or method names  
**Solution**: Use VS Code's autocomplete (Ctrl+Space)

### "Plugin not loading in game"
**Problem**: JAR file issues or local server problems  
**Solution**: Check local Docker logs and plugin configuration

### "Changes not showing in game"
**Problem**: Old plugin version still loaded  
**Solution**: Restart local Minecraft server or use `/reload` command

## 📚 Learning Resources

### In This Repository
- **`challenges/`** - Step-by-step tutorials
- **`examples/`** - Working code samples  
- **`docs/`** - Reference materials
- **`README.md`** - Main project documentation

### External Resources
- **Spigot API Docs** - Official plugin API reference
- **GitHub Copilot** - AI coding assistant built into VS Code
- **VS Code Java Docs** - Java development in VS Code

## 🎓 Educational Benefits

Using Codespaces teaches you:
- **Cloud Development** - Modern software development practices
- **Version Control** - Git and GitHub workflows
- **Professional Tools** - VS Code, Maven, Java ecosystem
- **Collaboration** - Sharing code and getting help

## 🚀 Next Steps

1. **Complete Challenge 1** - Your first Minecraft command
2. **Try Challenge 2** - Interactive commands with arguments
3. **Download locally** - Test your plugin in-game
4. **Continue learning** - Work through all challenges
5. **Create something unique** - Build your own plugin ideas!

## 🆘 Getting Help

- **GitHub Copilot** - Ask questions in the chat
- **Issues** - Create a GitHub issue for bugs
- **Discussions** - Ask questions in GitHub Discussions
- **Documentation** - Check the `docs/` folder

---

**Happy Coding!** 🎮✨

*Remember: Code in the cloud, game on your computer!*
