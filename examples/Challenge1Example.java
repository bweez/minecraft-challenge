package com.example;

import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.plugin.java.JavaPlugin;

/**
 * Example solution for Challenge 1: Your First Command
 * 
 * This shows how to create multiple commands with colorful messages.
 * Students can use this as a reference or starting point.
 */
public class Challenge1Example extends JavaPlugin {

  @Override
  public void onEnable() {
    getLogger().info("Challenge 1 Example Plugin enabled!");
  }

  @Override
  public void onDisable() {
    getLogger().info("Challenge 1 Example Plugin disabled.");
  }

  @Override
  public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
    
    // Original hello command with improvements
    if (command.getName().equalsIgnoreCase("hello")) {
      sender.sendMessage("§6✨ Hello there, awesome player! ✨");
      sender.sendMessage("§eWelcome to the wonderful world of coding!");
      return true;
    }

    // Welcome command with multiple colorful messages
    if (command.getName().equalsIgnoreCase("welcome")) {
      sender.sendMessage("§6🎉 Welcome to our amazing server! 🎉");
      sender.sendMessage("§eGet ready for an epic adventure!");
      sender.sendMessage("§aType §f/help §afor more commands!");
      return true;
    }

    // Fun joke command
    if (command.getName().equalsIgnoreCase("joke")) {
      sender.sendMessage("§e🤔 Why don't skeletons fight each other?");
      sender.sendMessage("§a💀 Because they don't have the guts! 😂");
      return true;
    }

    // Encouraging tip command
    if (command.getName().equalsIgnoreCase("tip")) {
      sender.sendMessage("§b💡 Pro Tip:");
      sender.sendMessage("§fAlways keep food in your inventory!");
      sender.sendMessage("§7You never know when you'll need it! 🍖");
      return true;
    }

    // Fun fact command
    if (command.getName().equalsIgnoreCase("fact")) {
      sender.sendMessage("§d🌟 Fun Fact:");
      sender.sendMessage("§fCreepers were originally a coding mistake!");
      sender.sendMessage("§7The developer mixed up the height and length values. 💥");
      return true;
    }

    // Cheer command for motivation
    if (command.getName().equalsIgnoreCase("cheer")) {
      sender.sendMessage("§6🎊 You're doing AMAZING! 🎊");
      sender.sendMessage("§eKeep up the great work!");
      sender.sendMessage("§aEvery expert was once a beginner! 🌟");
      return true;
    }

    return false;
  }
}
