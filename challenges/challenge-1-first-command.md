# 🎮 Challenge 1: Your First Command

Welcome to your first Minecraft coding challenge! You're going to learn how to create commands that players can use in the game. 

## 🎯 What You'll Learn
- How Minecraft commands work
- How to send messages to players
- How to make your code respond to player actions
- Basic Java syntax for beginners

## 🚀 Getting Started

### Step 1: Understanding the Current Code
First, let's look at what we already have! Open the file `plugin/src/main/java/com/example/Main.java`.

You'll see this code:
```java
@Override
public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
    if (command.getName().equalsIgnoreCase("hello")) {
        sender.sendMessage("Hello, world!");
        return true;
    }
    return false;
}
```

**What does this do?**
- When a player types `/hello` in the game, it sends them the message "Hello, world!"
- The `sender` is the player who typed the command
- The `sendMessage()` method sends text to that player

### Step 2: Test the Current Command
Let's make sure everything works:

1. Build your plugin:
   ```bash
   cd plugin
   mvn clean package
   ```

2. The plugin JAR file will be created in `plugin/target/minecraft-plugin-1.0-SNAPSHOT.jar`

### Step 3: Make It Your Own! 🌟

Now let's customize this command to make it more exciting:

**Challenge 3a: Change the Message**
Replace `"Hello, world!"` with your own fun message. For example:
```java
sender.sendMessage("Welcome to my awesome server!");
```

**Challenge 3b: Add Some Color! 🎨**
Minecraft supports colored text. Try this:
```java
sender.sendMessage("§aWelcome to my awesome server!"); // Green text
sender.sendMessage("§cThis is red text!");
sender.sendMessage("§9This is blue text!");
```

**Color Codes:**
- §a = Green
- §c = Red  
- §9 = Blue
- §e = Yellow
- §d = Pink
- §b = Aqua

**Challenge 3c: Multiple Messages**
You can send multiple messages at once:
```java
sender.sendMessage("§6Welcome to the server!");
sender.sendMessage("§eHave fun playing!");
sender.sendMessage("§aType /help for more commands!");
```

### Step 4: Add a New Command! 🎊

Let's add a completely new command called `/welcome`. 

1. First, we need to register it in `plugin/src/main/resources/plugin.yml`:
```yaml
name: HelloPlugin
version: 1.0
main: com.example.Main
api-version: 1.20
commands:
  hello:
    description: Says hello
    usage: /hello
  welcome:
    description: Gives a warm welcome
    usage: /welcome
```

2. Then add the code to handle it in `Main.java`:
```java
@Override
public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
    if (command.getName().equalsIgnoreCase("hello")) {
        sender.sendMessage("§aHello, world!");
        return true;
    }
    
    if (command.getName().equalsIgnoreCase("welcome")) {
        sender.sendMessage("§6🎉 Welcome to our amazing server! 🎉");
        sender.sendMessage("§eGet ready for an epic adventure!");
        return true;
    }
    
    return false;
}
```

### Step 5: Personal Touch Challenge 💡

Create your own unique command! Some ideas:
- `/joke` - tells a funny joke
- `/tip` - gives a helpful tip
- `/cheer` - sends encouraging words
- `/fact` - shares a fun fact

Example `/joke` command:
```java
if (command.getName().equalsIgnoreCase("joke")) {
    sender.sendMessage("§eWhy don't skeletons fight each other?");
    sender.sendMessage("§aBecause they don't have the guts! 💀");
    return true;
}
```

## 🏆 Success Checklist
- [ ] I changed the hello message to something personal
- [ ] I added colors to my messages  
- [ ] I created the welcome command
- [ ] I added my own unique command
- [ ] I tested my commands in-game

## 🎯 Next Steps
Once you've completed this challenge, you'll be ready for Challenge 2: "Magic Messages" where we'll learn about:
- Using player arguments in commands
- Creating dynamic messages
- Adding sound effects and particles!

## 💡 Helpful Tips
- **Test often!** Build and test your plugin after each change
- **Don't worry about mistakes** - they're how we learn!
- **Be creative!** The best part about coding is making something uniquely yours
- **Ask for help** if you get stuck - every programmer does!

## 🐛 Troubleshooting
**Plugin won't compile?**
- Check for missing semicolons (;)
- Make sure quotes match (" with ")
- Verify brackets are balanced ({ with })

**Command not working in-game?**
- Make sure you added it to plugin.yml
- Check that the command name matches exactly
- Restart the server after rebuilding

---
**Ready for the next challenge?** You're doing great! 🌟
