# 🔍 Setup Verification Guide

Use this checklist to make sure everything is working correctly before you start coding!

## ✅ Step 1: Check Your Coding Environment

### If Using GitHub Codespaces:
- [ ] Codespace is running and loaded
- [ ] Can edit files in the browser
- [ ] Terminal works and shows the workspace
- [ ] Maven compilation works:
  ```bash
  cd plugin
  mvn clean compile
  ```
  Should see: `BUILD SUCCESS`

### If Using Local Development:
- [ ] Java 17+ installed: `java -version`
- [ ] Maven installed: `mvn -version`
- [ ] Git installed: `git --version`
- [ ] Repository cloned to your computer
- [ ] Maven compilation works:
  ```bash
  cd minecraft-challenge/plugin
  mvn clean compile
  ```

## ✅ Step 2: Check Your Local Gaming Environment

**⚠️ This MUST be done on your local computer (not in Codespace):**

- [ ] Docker Desktop installed and running
- [ ] Repository downloaded to your local computer
- [ ] Can start the server:
  ```bash
  cd minecraft-challenge
  ./start.sh
  ```
- [ ] Docker container is running: `docker ps`
- [ ] Should see a container with port `25565`

## ✅ Step 3: Check Minecraft Connection

- [ ] Minecraft Java Edition installed (not Bedrock)
- [ ] Can access Multiplayer menu
- [ ] Can add server with address: `localhost:25565`
- [ ] Can successfully join the server
- [ ] Can type in chat: `/hello`
- [ ] Receives response: `Hello, world!`

## 🎉 Success!

If all checkboxes are checked, you're ready to start coding!

## 🆘 If Something's Not Working

### Common Issues:

**Can't compile in Codespace:**
- Try refreshing the browser
- Check if the Codespace is still running
- Look for red error messages in the terminal

**Server won't start locally:**
- Make sure Docker Desktop is running
- Check if port 25565 is already in use
- Try restarting Docker Desktop

**Can't connect to Minecraft server:**
- Verify the server is running: `docker ps`
- Make sure you're using `localhost:25565`
- Check that you're using Java Edition, not Bedrock
- Try restarting the server: `./start.sh`

**Plugin not working in game:**
- Make sure you built the plugin: `mvn clean package`
- Check that the JAR file exists in `plugin/target/`
- Restart the Minecraft server
- Look at server logs: `docker logs minecraft-server-container`

## 📝 Need More Help?

1. Check the main [README.md](../README.md) troubleshooting section
2. Look at the challenge guides in `challenges/`
3. Review the examples in `examples/`
4. Check the documentation in `docs/`

## 🚀 Ready to Code?

Once everything is verified, start with [Challenge 1: Your First Command](../challenges/challenge-1-first-command.md)!
