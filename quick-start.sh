#!/bin/bash

# 🎮 Minecraft Plugin Development - Quick Start Script
# This script helps you get started with your first challenge!

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print functions
print_header() {
    echo -e "${BOLD}${BLUE}🎮 $1${NC}"
}

print_step() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

clear

print_header "MINECRAFT PLUGIN DEVELOPMENT - QUICK START"
echo ""
echo -e "${BOLD}Welcome to your coding adventure! 🚀${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "plugin/pom.xml" ]; then
    print_error "Please run this script from the minecraft-challenge directory"
    exit 1
fi

print_step "Step 1: Verifying your development environment..."
echo ""

# Check Java
if java -version 2>&1 | grep -q "17"; then
    print_step "Java 17 is ready!"
else
    print_error "Java 17 not found. Please check your setup."
    exit 1
fi

# Check Maven
if command -v mvn &> /dev/null; then
    print_step "Maven is ready!"
else
    print_error "Maven not found. Please check your setup."
    exit 1
fi

echo ""
print_step "Step 2: Building your plugin for the first time..."
echo ""

cd plugin
if mvn clean compile -q; then
    print_step "Plugin compiled successfully! 🎉"
else
    print_error "Plugin compilation failed. Check the output above."
    exit 1
fi

cd ..

echo ""
print_step "Step 3: Setting up your workspace..."
echo ""

# Open important files in VS Code
print_info "Opening essential files for you..."

# Create a simple script to open files
cat << 'EOF' > open-challenge1.sh
#!/bin/bash
echo "Opening Challenge 1 and Main.java..."
code challenges/challenge-1-first-command.md
code plugin/src/main/java/com/example/Main.java
echo "Files opened! Check your VS Code tabs."
EOF

chmod +x open-challenge1.sh

echo ""
print_header "🎯 YOU'RE ALL SET!"
echo ""
print_info "Here's what to do next:"
echo ""
echo "1. 📖 Read Challenge 1:"
echo "   ${BOLD}challenges/challenge-1-first-command.md${NC}"
echo ""
echo "2. ✏️  Edit your code:"
echo "   ${BOLD}plugin/src/main/java/com/example/Main.java${NC}"
echo ""
echo "3. 🔨 Build your plugin:"
echo "   ${BOLD}mcbuild${NC} (or ${BOLD}mvn clean compile${NC} in the plugin folder)"
echo ""
echo "4. 🎮 Test in Minecraft:"
echo "   ${BOLD}Download this repo to your computer and run with Docker${NC}"
echo ""

print_warning "IMPORTANT: You can code here in Codespaces, but Minecraft must run on your local computer!"
echo ""

print_info "Quick commands for you:"
echo "• ${BOLD}mcbuild${NC} - Compile your plugin"
echo "• ${BOLD}mcpackage${NC} - Build JAR file" 
echo "• ${BOLD}mctest${NC} - Run tests"
echo "• ${BOLD}mcplugin${NC} - Go to plugin directory"
echo "• ${BOLD}mcchallenges${NC} - Go to challenges directory"
echo ""

print_info "Need help? Ask GitHub Copilot in the chat! 🤖"
echo ""

# Offer to open the first challenge
echo -e "${BOLD}Would you like me to open Challenge 1 for you? (y/n)${NC}"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    print_step "Opening Challenge 1 and Main.java..."
    code challenges/challenge-1-first-command.md
    code plugin/src/main/java/com/example/Main.java
    sleep 2
    print_step "Files opened! Check your VS Code tabs."
else
    print_info "No problem! Run './open-challenge1.sh' when you're ready."
fi

echo ""
print_header "HAPPY CODING! 🎮✨"
echo ""
print_info "Remember: Write code here, test in Minecraft on your computer!"
echo ""
