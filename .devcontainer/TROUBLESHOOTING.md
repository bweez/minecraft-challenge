# 🔧 Codespace Troubleshooting Guide

## Common Issues and Solutions

### 🚨 Setup Issues

#### "Codespace won't start" or "Setup taking too long"
**Symptoms**: Codespace creation hangs or fails  
**Solutions**:
1. **Wait longer** - Initial setup can take 3-5 minutes
2. **Check GitHub status** - Visit [githubstatus.com](https://githubstatus.com)
3. **Try again** - Delete and recreate the Codespace
4. **Check your internet** - Slow connections may timeout

#### "Java or Maven not found"
**Symptoms**: Commands like `java -version` or `mvn -version` fail  
**Solutions**:
1. **Wait for setup** - The setup script may still be running
2. **Check terminal** - Look for setup completion message
3. **Restart terminal** - Close and open a new terminal
4. **Recreate Codespace** - If problems persist

### 🔨 Build Issues

#### "BUILD FAILURE" when running `mcbuild`
**Symptoms**: Maven compilation fails  
**Solutions**:
1. **Check syntax** - Look at the Problems panel (View → Problems)
2. **Missing imports** - Add required import statements
3. **Wrong Java version** - Ensure you're using Java 17
4. **Clean build** - Run `mvn clean compile` in plugin directory

```bash
cd plugin
mvn clean compile
```

#### "Cannot find symbol" errors
**Symptoms**: Class or method names not recognized  
**Solutions**:
1. **Check spelling** - Ensure correct capitalization
2. **Add imports** - Import required classes at the top of file
3. **Check examples** - Compare with working code in examples/
4. **Use autocomplete** - Press Ctrl+Space for suggestions

### 📁 File Issues

#### "Files not opening" or "Can't find challenge files"
**Symptoms**: VS Code can't open expected files  
**Solutions**:
1. **Check file explorer** - Use the left sidebar to navigate
2. **Use correct paths**:
   - Challenges: `challenges/challenge-1-first-command.md`
   - Main code: `plugin/src/main/java/com/example/Main.java`
3. **Refresh explorer** - Right-click and select "Refresh"

#### "Changes not saving"
**Symptoms**: Edits disappear or don't persist  
**Solutions**:
1. **Auto-save enabled** - Should save automatically
2. **Manual save** - Press Ctrl+S to save explicitly
3. **Check file permissions** - Files should be editable
4. **Restart Codespace** - If issues persist

### 🎮 Minecraft Connection Issues

#### "Can't test plugin in Minecraft"
**Symptoms**: Want to see plugin working in game  
**Important**: This is expected! Minecraft must run locally.

**Solutions**:
1. **Download repository** to your computer:
   ```bash
   # On GitHub.com, click Code → Download ZIP
   ```
2. **Install Docker Desktop** on your computer
3. **Copy your code** from Codespace to local copy
4. **Run locally**:
   ```bash
   # In downloaded folder on your computer
   docker-compose up
   ```

#### "Plugin not loading in local Minecraft"
**Symptoms**: Plugin JAR doesn't work on local server  
**Solutions**:
1. **Build fresh JAR** in Codespace:
   ```bash
   mcpackage
   ```
2. **Download the JAR** from `plugin/target/minecraft-plugin-1.0-SNAPSHOT.jar`
3. **Replace local JAR** in your computer's plugins folder
4. **Restart local server**

### 💻 VS Code Issues

#### "Extensions not working" or "Java support missing"
**Symptoms**: No syntax highlighting, autocomplete, or debugging  
**Solutions**:
1. **Wait for extension installation** - Can take 2-3 minutes after Codespace creation
2. **Reload window** - Press Ctrl+Shift+P, type "reload window"
3. **Check extension status** - Click Extensions icon (left sidebar)
4. **Install manually** if needed:
   - Java Extension Pack
   - Maven for Java
   - GitHub Copilot

#### "Terminal commands not working"
**Symptoms**: Aliases like `mcbuild` not found  
**Solutions**:
1. **Source bashrc** - Run `source ~/.bashrc`
2. **Use full commands**:
   ```bash
   cd plugin
   mvn clean compile
   ```
3. **Restart terminal** - Close and open new terminal
4. **Check setup completion** - Look for setup success message

### 🔍 Debugging Help

#### "Code doesn't do what I expect"
**Solutions**:
1. **Compare with examples** - Check `examples/` folder
2. **Read challenge carefully** - Follow step-by-step instructions
3. **Ask GitHub Copilot** - Use the chat feature for help
4. **Check syntax** - Look for typos and missing semicolons

#### "Plugin compiles but doesn't work in game"
**Solutions**:
1. **Check plugin.yml** - Ensure proper configuration
2. **Verify commands** - Check command names and permissions
3. **Look at server logs** - Check Docker logs for errors
4. **Test step by step** - Start with simple commands

### ⚡ Performance Issues

#### "Codespace running slowly"
**Solutions**:
1. **Close unused tabs** - Keep only essential files open
2. **Restart Codespace** - Stop and start from GitHub
3. **Check browser** - Try different browser or incognito mode
4. **Clear browser cache** - Remove cached data

#### "Build taking too long"
**Solutions**:
1. **First build is slower** - Maven downloads dependencies
2. **Subsequent builds faster** - Dependencies are cached
3. **Use incremental builds** - Just `mvn compile` instead of `clean compile`

### 🆘 Getting Additional Help

#### When to Ask for Help
- Setup fails completely after multiple attempts
- Error messages you don't understand
- Code works in examples but not in your version
- Stuck on a challenge for more than 30 minutes

#### How to Ask for Help
1. **Include error messages** - Copy the exact text
2. **Describe what you tried** - List troubleshooting steps
3. **Share code snippet** - Show the problematic code
4. **Mention which challenge** - Specify which tutorial you're following

#### Resources for Help
- **GitHub Copilot Chat** - Built into VS Code, ask coding questions
- **GitHub Issues** - Create issue in this repository
- **README.md** - Check main project documentation
- **Challenge files** - Re-read tutorial instructions

### 📝 Prevention Tips

#### Best Practices
- **Save frequently** - Use Ctrl+S regularly (though auto-save is enabled)
- **Test incrementally** - Build after small changes
- **Read error messages** - They often tell you exactly what's wrong
- **Follow examples** - Use working code as reference
- **Ask early** - Don't struggle alone for too long

#### Staying Organized
- **One challenge at a time** - Don't jump ahead
- **Keep examples open** - Reference working code
- **Use descriptive comments** - Explain what your code does
- **Test before moving on** - Ensure each step works

---

## 🎯 Quick Reference

### Essential Commands
```bash
mcbuild      # Compile plugin
mcpackage    # Build JAR file
mctest       # Run tests
mcplugin     # Go to plugin directory
mcchallenges # Go to challenges directory
```

### Important File Paths
```
challenges/challenge-1-first-command.md  # First tutorial
plugin/src/main/java/com/example/Main.java  # Your code
examples/Challenge1Example.java  # Working reference code
```

### VS Code Shortcuts
- `Ctrl+S` - Save file
- `Ctrl+Shift+P` - Command palette
- `Ctrl+Space` - Autocomplete
- `Ctrl+Shift+E` - File explorer

---

**Remember**: Code in Codespaces, game on your computer! 🎮
