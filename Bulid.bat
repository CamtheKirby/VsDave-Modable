@echo off
title Setup - PECG
cd ..

echo Installing dependencies, please wait...
haxelib install lime 8.0.0
haxelib install openfl
haxelib install flixel 4.11.0
haxelib run lime setup flixel
haxelib run lime setup
haxelib install actuate 1.9.0 
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib install flixel 4.11.0
haxelib install flixel-addons 2.11.0
haxelib install flixel-ui 2.6.1
haxelib install hscript 2.5.0
haxelib install hxCodec 2.5.1
haxelib install hxcpp 4.3.2
haxelib install lime 8.1.2
haxelib install openfl 9.3.3
