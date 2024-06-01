@echo off
title Setup - PECG
cd ..

echo Installing dependencies, please wait...
haxelib install actuate 1.9.0 
haxelib git discord_rpc https://github.com/discord/discord-rpc
haxelib install flixel 4.11.0
haxelib install flixel-addons 2.11.0
haxelib install flixel-ui 2.6.1
haxelib install hscript 2.5.0
haxelib install hxCodec 2.5.1
haxelib install hxcpp 4.3.2
haxelib install lime 8.1.2
haxelib install openfl 9.3.3