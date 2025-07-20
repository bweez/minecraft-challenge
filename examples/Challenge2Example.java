package com.example;

import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.plugin.java.JavaPlugin;

/**
 * Example solution for Challenge 2: Magic Messages
 * 
 * This demonstrates commands that use arguments to create interactive
 * and personalized responses for players.
 */
public class Challenge2Example extends JavaPlugin {

  @Override
  public void onEnable() {
    getLogger().info("Challenge 2 Example Plugin enabled!");
  }

  @Override
  public void onDisable() {
    getLogger().info("Challenge 2 Example Plugin disabled.");
  }

  @Override
  public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {

    // Say command - repeats what the player types
    if (command.getName().equalsIgnoreCase("say")) {
      if (args.length == 0) {
        sender.sendMessage("§cPlease provide a message! Usage: /say <message>");
        return true;
      }
      
      String message = String.join(" ", args);
      sender.sendMessage("§6[Server] §f" + message);
      return true;
    }

    // Greet command - greets a specific player
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

    // Magic 8-Ball command with random responses
    if (command.getName().equalsIgnoreCase("magic8ball")) {
      if (args.length == 0) {
        sender.sendMessage("§cAsk me a question! Usage: /magic8ball <question>");
        return true;
      }
      
      String[] answers = {
        "§aYes, definitely!",
        "§eAsk again later...",
        "§cI don't think so.",
        "§bAbsolutely!",
        "§dMaybe...",
        "§6Signs point to yes!",
        "§7Unclear, try again.",
        "§5Without a doubt!",
        "§cDon't count on it.",
        "§aIt is certain!"
      };
      
      int randomIndex = (int) (Math.random() * answers.length);
      String answer = answers[randomIndex];
      
      sender.sendMessage("§d🔮 Magic 8-Ball says:");
      sender.sendMessage(answer);
      return true;
    }

    // Compliment command with multiple arguments
    if (command.getName().equalsIgnoreCase("compliment")) {
      if (args.length < 2) {
        sender.sendMessage("§cUsage: /compliment <player> <compliment>");
        sender.sendMessage("§7Example: /compliment Steve awesome builder");
        return true;
      }
      
      String targetPlayer = args[0];
      
      // Get all words after the first one as the compliment
      String[] complimentWords = new String[args.length - 1];
      for (int i = 1; i < args.length; i++) {
        complimentWords[i - 1] = args[i];
      }
      String compliment = String.join(" ", complimentWords);
      
      sender.sendMessage("§6💝 Compliment sent to " + targetPlayer + "!");
      sender.sendMessage("§e\"You are " + compliment + "!\"");
      return true;
    }

    // Countdown command with number validation
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
        sender.sendMessage("§7Please use numbers like 1, 2, 3, etc.");
      }
      return true;
    }

    // Story command - tells a story with the player's name
    if (command.getName().equalsIgnoreCase("story")) {
      if (args.length == 0) {
        sender.sendMessage("§cTell me your name! Usage: /story <yourname>");
        return true;
      }
      
      String heroName = args[0];
      sender.sendMessage("§6📖 Once upon a time...");
      sender.sendMessage("§fThere was a brave adventurer named §e" + heroName + "§f.");
      sender.sendMessage("§f" + heroName + " discovered a magical world full of blocks!");
      sender.sendMessage("§aAnd they lived craftily ever after! ⛏️");
      return true;
    }

    // Color command - lets players choose text colors
    if (command.getName().equalsIgnoreCase("color")) {
      if (args.length < 2) {
        sender.sendMessage("§cUsage: /color <colorname> <message>");
        sender.sendMessage("§7Colors: red, green, blue, yellow, purple, aqua");
        return true;
      }
      
      String colorName = args[0].toLowerCase();
      String message = String.join(" ", java.util.Arrays.copyOfRange(args, 1, args.length));
      
      String colorCode = "§f"; // Default to white
      switch (colorName) {
        case "red": colorCode = "§c"; break;
        case "green": colorCode = "§a"; break;
        case "blue": colorCode = "§9"; break;
        case "yellow": colorCode = "§e"; break;
        case "purple": colorCode = "§d"; break;
        case "aqua": colorCode = "§b"; break;
        default:
          sender.sendMessage("§cUnknown color! Use: red, green, blue, yellow, purple, aqua");
          return true;
      }
      
      sender.sendMessage("§7Your " + colorName + " message:");
      sender.sendMessage(colorCode + message);
      return true;
    }

    return false;
  }
}
