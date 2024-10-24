@echo off
title Setup - PECG
cd ..

echo Installing dependencies, please wait...
haxelib install lime 8.0.0
haxelib install openfl
haxelib install flixel 4.11.0
haxelib run lime setup flixel
haxelib run lime setup
haxelib install flixel-tools
haxelib install flixel-ui
haxelib install flixel-addons 2.9.0
haxelib install actuate 1.9.0 
haxelib install hxCodec 2.5.1          
haxelib install linc_luajit
haxelib install hscript
haxelib git hscript-ex https://github.com/ianharrigan/hscript-ex
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit
haxelib git faxe https://github.com/uhrobots/faxe
haxelib git polymod https://github.com/larsiusprime/polymod.git
haxelib install hxcpp-debug-server
haxelib list
