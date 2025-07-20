package com.example;

import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.plugin.java.JavaPlugin;

public class Main extends JavaPlugin {
    @Override
    public void onEnable() {
        getLogger().info("HelloPlugin enabled!");
    }

    @Override
    public void onDisable() {
        getLogger().info("HelloPlugin disabled.");
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (command.getName().equalsIgnoreCase("hello")) {
            sender.sendMessage("Hello, world!");
            return true;
        }
        return false;
    }
}
