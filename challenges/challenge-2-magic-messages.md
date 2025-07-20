# 🎨 Challenge 2: Magic Messages

Now that you've mastered basic commands, let's make them interactive! In this challenge, you'll learn how to use arguments (extra words) that players type after your commands.

## 🎯 What You'll Learn
- How to read arguments from commands
- How to personalize messages with player names
- How to create dynamic responses
- How to validate user input safely

## 🚀 Getting Started

### Step 1: Understanding Arguments
When a player types `/say Hello there!`, the parts are:
- Command: `say`
- Arguments: `["Hello", "there!"]` (split by spaces)

In your code, these come in as the `String[] args` parameter.

### Step 2: Your First Argument Command

Let's create a `/say` command that repeats what the player types:

**Add to plugin.yml:**
```yaml
  say:
    description: Makes the server say something
    usage: /say <message>
```

**Add to Main.java:**
```java
if (command.getName().equalsIgnoreCase("say")) {
    // Check if player provided a message
    if (args.length == 0) {
        sender.sendMessage("§cPlease provide a message! Usage: /say <message>");
        return true;
    }
    
    // Join all arguments into one message
    String message = String.join(" ", args);
    sender.sendMessage("§6[Server] §f" + message);
    return true;
}
```

### Step 3: Personal Greetings 👋

Create a `/greet` command that greets a specific player:

**Add to plugin.yml:**
```yaml
  greet:
    description: Greets a player by name
    usage: /greet <playername>
```

**Add to Main.java:**
```java
if (command.getName().equalsIgnoreCase("greet")) {
    if (args.length == 0) {
        sender.sendMessage("§cWho should I greet? Usage: /greet <playername>");
        return true;
    }
    
    String playerName = args[0];
    sender.sendMessage("§6🌟 Hello there, " + playerName + "! 🌟");
    sender.sendMessage("§eHope you're having an amazing day!");
    return true;
}
```

### Step 4: Magic 8-Ball Command 🎱

Let's create a fun command that gives random answers:

**Add to plugin.yml:**
```yaml
  magic8ball:
    description: Ask the magic 8-ball a question
    usage: /magic8ball <question>
```

**Add to Main.java:**
```java
if (command.getName().equalsIgnoreCase("magic8ball")) {
    if (args.length == 0) {
        sender.sendMessage("§cAsk me a question! Usage: /magic8ball <question>");
        return true;
    }
    
    // Array of possible answers
    String[] answers = {
        "§aYes, definitely!",
        "§eAsk again later...",
        "§cI don't think so.",
        "§bAbsolutely!",
        "§dMaybe...",
        "§6Signs point to yes!",
        "§7Unclear, try again.",
        "§5Without a doubt!"
    };
    
    // Pick a random answer
    int randomIndex = (int) (Math.random() * answers.length);
    String answer = answers[randomIndex];
    
    sender.sendMessage("§d🔮 Magic 8-Ball says:");
    sender.sendMessage(answer);
    return true;
}
```

### Step 5: Advanced - Multiple Arguments 🌟

Create a `/compliment` command that takes a player name and a compliment:

**Add to plugin.yml:**
```yaml
  compliment:
    description: Send a compliment to a player
    usage: /compliment <player> <compliment>
```

**Add to Main.java:**
```java
if (command.getName().equalsIgnoreCase("compliment")) {
    if (args.length < 2) {
        sender.sendMessage("§cUsage: /compliment <player> <compliment>");
        return true;
    }
    
    String targetPlayer = args[0];
    
    // Join all words after the first one as the compliment
    String[] complimentWords = new String[args.length - 1];
    for (int i = 1; i < args.length; i++) {
        complimentWords[i - 1] = args[i];
    }
    String compliment = String.join(" ", complimentWords);
    
    sender.sendMessage("§6💝 Compliment sent to " + targetPlayer + "!");
    sender.sendMessage("§e\"" + compliment + "\"");
    return true;
}
```

### Step 6: Creative Challenge Time! 🎨

Create your own commands using arguments! Ideas:
- `/story` - Tell a story with the player's name
- `/rhyme` - Make rhymes with words they provide
- `/color` - Let players choose text colors
- `/countdown` - Count down from a number they specify

**Example `/countdown` command:**
```java
if (command.getName().equalsIgnoreCase("countdown")) {
    if (args.length == 0) {
        sender.sendMessage("§cProvide a number! Usage: /countdown <number>");
        return true;
    }
    
    try {
        int number = Integer.parseInt(args[0]);
        if (number < 1 || number > 10) {
            sender.sendMessage("§cNumber must be between 1 and 10!");
            return true;
        }
        
        sender.sendMessage("§6🚀 Starting countdown from " + number + "!");
        for (int i = number; i >= 1; i--) {
            sender.sendMessage("§e" + i + "...");
        }
        sender.sendMessage("§a🎉 Blast off! 🚀");
        
    } catch (NumberFormatException e) {
        sender.sendMessage("§cThat's not a valid number!");
    }
    return true;
}
```

## 🏆 Success Checklist
- [ ] I created the /say command that repeats messages
- [ ] I made the /greet command that uses player names
- [ ] I built the magic 8-ball with random responses
- [ ] I created the /compliment command with multiple arguments
- [ ] I added input validation and error messages
- [ ] I created my own unique argument-based command

## 🎯 What You've Learned
- **Arguments** - How to read extra words from commands
- **String manipulation** - Joining and splitting text
- **Arrays** - Working with lists of answers
- **Random selection** - Using Math.random()
- **Input validation** - Checking if users provided enough arguments
- **Error handling** - Giving helpful error messages

## 💡 Pro Tips
- Always check if `args.length` is sufficient before using arguments
- Use `String.join(" ", args)` to combine multiple words
- Give clear error messages to help users
- Use `try/catch` blocks when converting strings to numbers
- Test with different inputs, including edge cases!

## 🐛 Common Issues
- **Array out of bounds** - Check `args.length` first!
- **NumberFormatException** - Use try/catch when parsing numbers
- **Empty arguments** - Handle the case when `args.length == 0`

## 🚀 Next Challenge
Ready for Challenge 3: "Item Giver"? You'll learn how to:
- Give players actual items
- Work with Minecraft's item system
- Create inventory management commands
- Add enchantments and custom properties!

---
**You're becoming a real Minecraft developer! 🌟**
