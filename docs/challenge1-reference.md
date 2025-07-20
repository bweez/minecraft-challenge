# 📝 Challenge 1 Quick Reference

## Color Codes Cheat Sheet
```
§0 = Black        §8 = Dark Gray
§1 = Dark Blue    §9 = Blue  
§2 = Dark Green   §a = Green
§3 = Dark Aqua    §b = Aqua
§4 = Dark Red     §c = Red
§5 = Dark Purple  §d = Light Purple
§6 = Gold         §e = Yellow
§7 = Gray         §f = White
```

## Formatting Codes
```
§l = Bold         §o = Italic
§n = Underline    §m = Strikethrough
§k = Magic        §r = Reset
```

## Basic Command Structure
```java
if (command.getName().equalsIgnoreCase("commandname")) {
    sender.sendMessage("Your message here!");
    return true;
}
```

## Common Mistakes to Avoid
- ❌ Missing semicolons `;` at end of lines
- ❌ Mismatched quotes `"` and `"`  
- ❌ Forgetting to add command to plugin.yml
- ❌ Case sensitivity in command names
- ❌ Missing `return true;` after handling command

## Testing Your Plugin
1. Save your changes
2. Run: `mvn clean package`
3. Copy JAR to server plugins folder
4. Restart server
5. Test with `/yourcommand` in-game

## Example Messages
```java
// Simple message
sender.sendMessage("Hello!");

// Colorful message  
sender.sendMessage("§aGreen text!");

// Multiple lines
sender.sendMessage("§6Line 1");
sender.sendMessage("§eLine 2");

// With emojis (if supported)
sender.sendMessage("§6🎉 Party time! 🎉");
```
