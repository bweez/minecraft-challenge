#!/bin/bash

echo "🎮 Setting up Minecraft Plugin Development Environment..."
echo "This will take a few minutes. Please be patient! ⏰"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function for colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Update system packages
print_status "Updating system packages..."
sudo apt-get update -q

# Install additional useful tools
print_status "Installing development tools..."
sudo apt-get install -y -q \
    curl \
    wget \
    zip \
    unzip \
    tree \
    htop \
    nano \
    vim \
    git-lfs \
    jq

# Verify Java installation
print_status "Verifying Java installation..."
if java -version 2>&1 | grep -q "17"; then
    print_success "Java 17 is properly installed"
    java -version
else
    print_error "Java 17 not found. This might cause issues."
fi

# Check if Maven is available
print_status "Verifying Maven installation..."
if command -v mvn &> /dev/null; then
    print_success "Maven is available"
    mvn -version
else
    print_warning "Maven not found in PATH. Installing Maven..."
    
    # Install Maven manually
    MAVEN_VERSION=3.9.5
    cd /tmp
    wget -q https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
    sudo tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt
    sudo ln -sf /opt/apache-maven-${MAVEN_VERSION} /opt/maven
    
    # Add to PATH
    echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/environment
    echo 'export PATH=$PATH:$MAVEN_HOME/bin' | sudo tee -a /etc/environment
    
    export MAVEN_HOME=/opt/maven
    export PATH=$PATH:$MAVEN_HOME/bin
    
    print_success "Maven installed successfully"
fi

# Set up workspace permissions
print_status "Setting up workspace permissions..."
sudo chown -R vscode:vscode /workspaces/minecraft-challenge
chmod +x /workspaces/minecraft-challenge/start.sh

# Navigate to plugin directory
cd /workspaces/minecraft-challenge/plugin

# Download dependencies and compile
print_status "Downloading dependencies and compiling plugin..."
mvn clean compile -q

if [ $? -eq 0 ]; then
    print_success "Plugin compiled successfully!"
else
    print_error "Plugin compilation failed. Please check the output above."
fi

# Create helpful aliases for the user
print_status "Setting up helpful aliases..."
cat << 'EOF' >> ~/.bashrc

# Minecraft Plugin Development Aliases
alias mcbuild='cd /workspaces/minecraft-challenge/plugin && mvn clean compile'
alias mcpackage='cd /workspaces/minecraft-challenge/plugin && mvn clean package'
alias mctest='cd /workspaces/minecraft-challenge/plugin && mvn test'
alias mcclean='cd /workspaces/minecraft-challenge/plugin && mvn clean'
alias mcplugin='cd /workspaces/minecraft-challenge/plugin'
alias mcchallenges='cd /workspaces/minecraft-challenge/challenges'
alias mcexamples='cd /workspaces/minecraft-challenge/examples'
alias mcserver='cd /workspaces/minecraft-challenge && docker-compose up'
alias mcstop='cd /workspaces/minecraft-challenge && docker-compose down'
alias mclogs='cd /workspaces/minecraft-challenge && docker-compose logs -f minecraft'

# Quick navigation
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

EOF

# Create a welcome message
cat << 'EOF' > ~/.motd
🎮 Welcome to Minecraft Plugin Development! 

Quick Commands:
  mcbuild     - Compile your plugin
  mcpackage   - Build plugin JAR file
  mctest      - Run tests
  mcplugin    - Go to plugin directory
  mcchallenges - Go to challenges directory
  mcexamples  - Go to examples directory

Get Started:
1. Open /workspaces/minecraft-challenge/challenges/challenge-1-first-command.md
2. Edit code in /workspaces/minecraft-challenge/plugin/src/main/java/com/example/Main.java
3. Run 'mcbuild' to compile your changes
4. For local gaming, download this repo and run Docker locally

Need Help? Check out the README.md or ask GitHub Copilot! 🤖

Happy Coding! 🚀
EOF

# Create a startup script that shows the welcome message
echo 'cat ~/.motd' >> ~/.bashrc

# Pre-cache Maven dependencies
print_status "Pre-caching Maven dependencies..."
cd /workspaces/minecraft-challenge/plugin
mvn dependency:go-offline -q

# Create useful development directories if they don't exist
print_status "Setting up development workspace..."
mkdir -p /workspaces/minecraft-challenge/workspace
mkdir -p /workspaces/minecraft-challenge/temp
mkdir -p /workspaces/minecraft-challenge/logs

# Set up Git configuration for the codespace
print_status "Configuring Git..."
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input

# Create a quick reference file
cat << 'EOF' > /workspaces/minecraft-challenge/CODESPACE_QUICK_START.md
# 🚀 Codespace Quick Start

## First Steps
1. **Open Challenge 1**: `challenges/challenge-1-first-command.md`
2. **Edit Main.java**: `plugin/src/main/java/com/example/Main.java`
3. **Compile**: Run `mcbuild` in terminal
4. **Check Success**: Look for "BUILD SUCCESS"

## Important Notes
- ✅ You can code here in Codespaces
- ❌ You cannot run Minecraft here (need local computer)
- 📥 Download repo locally to test in-game

## Useful Commands
- `mcbuild` - Compile your plugin
- `mcpackage` - Build JAR file
- `mctest` - Run tests
- `mcplugin` - Go to plugin folder

## File Structure
```
plugin/src/main/java/com/example/Main.java  ← Your code goes here
challenges/                                  ← Follow these tutorials
examples/                                   ← Working code samples
```

## Need Help?
- Ask GitHub Copilot in chat
- Check README.md for detailed setup
- Look at examples/ for working code

Happy coding! 🎮
EOF

print_success "🎉 Development environment setup complete!"
echo ""
print_status "Here's what was set up:"
echo "  ✅ Java 17 development environment"
echo "  ✅ Maven build system"
echo "  ✅ VS Code extensions for Java development"  
echo "  ✅ Helpful aliases and commands"
echo "  ✅ Pre-cached dependencies"
echo "  ✅ Workspace permissions"
echo ""
print_success "🚀 You're ready to start coding!"
echo ""
print_warning "📋 Remember: Code here, game locally!"
echo "   - Write code in this Codespace"
echo "   - Download repo to your computer for gaming"
echo ""
print_status "💡 Run 'cat CODESPACE_QUICK_START.md' for quick tips"
