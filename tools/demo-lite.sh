#!/bin/bash

# 🎮 Example Demo - Lightweight Version
# Shows how the tools work without requiring a full Minecraft server

set -e

# Colors for fun output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${PURPLE}🎮 Minecraft Plugin Demo (Lightweight) 🎮${NC}"
echo -e "${CYAN}=======================================${NC}"

# Check if example name is provided
if [ -z "$1" ]; then
    echo -e "${YELLOW}📋 Available examples:${NC}"
    echo -e "${GREEN}  • challenge1${NC} - Your First Command"
    echo -e "${GREEN}  • challenge2${NC} - Magic Messages"
    echo ""
    echo -e "${BLUE}Usage: ./tools/demo-lite.sh <example-name>${NC}"
    echo -e "${BLUE}Example: ./tools/demo-lite.sh challenge1${NC}"
    exit 1
fi

EXAMPLE_NAME=$1

echo -e "${YELLOW}🚀 Running demo for: $EXAMPLE_NAME${NC}"
echo ""

# Show what the student's current code looks like
echo -e "${CYAN}👶 Student's Current Code:${NC}"
echo -e "${YELLOW}===========================${NC}"
grep -A 3 -B 1 "sendMessage" plugin/src/main/java/com/example/Main.java | head -5 | while read line; do
    echo -e "${BLUE}  $line${NC}"
done
echo ""

# Set up the example using existing logic
echo -e "${BLUE}📦 Setting up example...${NC}"

# Check if example exists
EXAMPLE_JAVA="examples/Challenge${EXAMPLE_NAME#challenge}Example.java"
EXAMPLE_YML="examples/challenge${EXAMPLE_NAME#challenge}-plugin.yml"

if [ ! -f "$EXAMPLE_JAVA" ]; then
    echo -e "${RED}❌ Example '$EXAMPLE_NAME' not found!${NC}"
    echo -e "${YELLOW}Available examples: challenge1, challenge2${NC}"
    exit 1
fi

# Backup current work
mkdir -p backups
cp plugin/src/main/java/com/example/Main.java backups/Main.java.backup 2>/dev/null || true
cp plugin/src/main/resources/plugin.yml backups/plugin.yml.backup 2>/dev/null || true

# Set up the example
cp "$EXAMPLE_JAVA" plugin/src/main/java/com/example/Main.java
cp "$EXAMPLE_YML" plugin/src/main/resources/plugin.yml

# Fix class names
sed -i 's/public class Challenge[0-9]*Example/public class Main/g' plugin/src/main/java/com/example/Main.java
sed -i 's/main: com.example.Challenge[0-9]*Example/main: com.example.Main/g' plugin/src/main/resources/plugin.yml

echo -e "${GREEN}✅ Example ready!${NC}"
echo ""

# Build the plugin
echo -e "${BLUE}🔨 Building plugin...${NC}"
cd plugin
BUILD_OUTPUT=$(mvn clean compile 2>&1)
BUILD_SUCCESS=$?
cd ..

if [ $BUILD_SUCCESS -eq 0 ]; then
    echo -e "${GREEN}✅ Plugin built successfully!${NC}"
else
    echo -e "${RED}❌ Build failed!${NC}"
    echo -e "${YELLOW}Build output:${NC}"
    echo "$BUILD_OUTPUT"
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 Example plugin is ready! Here's what changed:${NC}"
echo -e "${CYAN}=================================================${NC}"

# Show the available commands
echo -e "${YELLOW}📋 Available Commands:${NC}"
grep -A 2 "commands:" plugin/src/main/resources/plugin.yml | grep -E "^  [a-z]" | while read line; do
    CMD=$(echo "$line" | sed 's/://g' | xargs)
    echo -e "${GREEN}  /$CMD${NC}"
done
echo ""

# Show some example command implementations
echo -e "${YELLOW}💻 Command Examples (what players would see):${NC}"
echo -e "${CYAN}=============================================${NC}"

case $EXAMPLE_NAME in
    "challenge1")
        echo -e "${PURPLE}>>> /hello${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}✨ Hello there, awesome player! ✨${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}Welcome to the wonderful world of coding!${NC}"
        echo ""
        
        echo -e "${PURPLE}>>> /joke${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}🤔 Why don't skeletons fight each other?${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}💀 Because they don't have the guts! 😂${NC}"
        echo ""
        
        echo -e "${PURPLE}>>> /tip${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}💡 Pro Tip:${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}Always keep food in your inventory!${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}You never know when you'll need it! 🍖${NC}"
        ;;
        
    "challenge2")
        echo -e "${PURPLE}>>> /say Hello World${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}[Server] Hello World${NC}"
        echo ""
        
        echo -e "${PURPLE}>>> /greet Steve${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}🌟 Hello there, Steve! 🌟${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}Hope you're having an amazing day!${NC}"
        echo ""
        
        echo -e "${PURPLE}>>> /color blue${NC}"
        echo -e "${YELLOW}  Player sees: ${GREEN}🎨 Everything is now beautiful blue! 🎨${NC}"
        ;;
esac

echo ""
echo -e "${GREEN}🎊 Demo complete! 🎊${NC}"
echo ""

echo -e "${PURPLE}📋 What students learn:${NC}"
echo -e "${CYAN}========================${NC}"
echo -e "${GREEN}1.${NC} How to add multiple commands to their plugin"
echo -e "${GREEN}2.${NC} How to use color codes (§6, §e, §a) for pretty messages"
echo -e "${GREEN}3.${NC} How to handle command arguments (like names in /greet)"
echo -e "${GREEN}4.${NC} How to make their plugin fun and engaging"
echo ""

echo -e "${YELLOW}🔄 Restore original code: ${BLUE}./tools/restore-work.sh${NC}"
echo -e "${YELLOW}🚀 Start full server: ${BLUE}./tools/server.sh start${NC}"
echo ""
echo -e "${PURPLE}🎮 Happy coding! 🎮${NC}"
