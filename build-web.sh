#!/bin/sh

# Compile tools
echo Building tools...
mkdir -p out/production/jurk
javac -d out/production/jurk tools/gurk/*.java -Xlint:deprecation

# Run image compiler
#echo Processing images...
java -cp out/production/jurk gurk.ImageCompiler game/gurkDemo.js web

# Compile coffee script
cat src/device.coffee src/core.coffee src/model.coffee src/adventure.coffee src/combat.coffee src/gurk.coffee | node_modules/coffeescript/bin/coffee --compile --stdio > web/gurk.js

# Copy images
cp images/* $1

# Compile game data
#java -cp out/production/jurk gurk.GameCompiler gurkDemo.js $1
java -cp out/production/jurk gurk.GameCompiler ../game.js

echo Done!
