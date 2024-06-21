package;

import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;
#if sys import sys.FileSystem; #end
import flash.media.Sound;
import sys.io.File;

using StringTools;

class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

	static var currentLevel:String;

	static public function isLocale():Bool
	{
		if (LanguageManager.save.data.language != 'en-US')
		{
			return true;
		}
		return false;
	}

	static public function setCurrentLevel(name:String)
	{
		currentLevel = name.toLowerCase();
	}

	static function getPath(file:String, type:AssetType, library:Null<String>)
	{
		if (library != null)
			return getLibraryPath(file, library);

		if (currentLevel != null)
		{
			var levelPath = getLibraryPathForce(file, currentLevel);
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;

			levelPath = getLibraryPathForce(file, "shared");
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;
		}

		return getPreloadPath(file);
	}
	inline static public function getDirectory(directoryName:String, ?library:String)
	{
		return getPath('images/$directoryName', IMAGE, library);
	}

	static public function getLibraryPath(file:String, library = "preload")
	{
		return if (library == "preload" || library == "default") getPreloadPath(file); else getLibraryPathForce(file, library);
	}
 
	inline static function getLibraryPathForce(file:String, library:String)
	{
		return '$library:assets/$library/$file';
	}

	inline static function getPreloadPath(file:String)
	{
		return 'assets/$file';
	}

	inline static public function file(file:String, type:AssetType = TEXT, ?library:String)
	{
		var defaultReturnPath = getPath(file, type, library);
		if (isLocale())
		{
			var langaugeReturnPath = getPath('locale/${LanguageManager.save.data.language}/' + file, type, library);
			if (FileSystem.exists(langaugeReturnPath))
			{
				return langaugeReturnPath;
			}
			else
			{
				return defaultReturnPath;
			}
		}
		else
		{
			return defaultReturnPath;
		}
	}

	inline static public function customFile(file:String)
		{
			   var defaultReturnPath = File.getContent(file);

				return defaultReturnPath;
		}

	inline static public function txt(key:String, ?library:String)
	{
		var defaultReturnPath = getPath('data/$key.txt', TEXT, library);
		if (isLocale())
		{
			var langaugeReturnPath = getPath('locale/${LanguageManager.save.data.language}/data/$key.txt', TEXT, library);
			if (FileSystem.exists(langaugeReturnPath))
			{
				return langaugeReturnPath;
			}
			else
			{
				return defaultReturnPath;
			}
		}
		else
		{
			return defaultReturnPath;
		}
	}

	inline static public function xml(key:String, ?library:String)
	{
		return getPath('data/$key.xml', TEXT, library);
	}

	inline static public function modsSounds(path:String, key:String) {
		return modSongs(path + '/' + key + '.' + SOUND_EXT);
	}

	static public function modSongs(key:String) {
		return 'mods/' + TitleState.currentMod + '/songs/' + key;
	}
	inline static public function json(key:String, ?library:String)
	{
		return getPath('data/$key.json', TEXT, library);
	}

	inline static public function data(key:String, ?library:String)
	{
		return getPath('data/$key', TEXT, library);
	}
	
	inline static public function executable(key:String, ?library:String)
	{
		return getPath('executables/$key', BINARY, library);
	}

	inline static public function chart(key:String, ?library:String)
	{
		return getPath('data/charts/$key.json', TEXT, library);
	}

	static public function sound(key:String, ?library:String)
	{
		return getPath('sounds/$key.$SOUND_EXT', SOUND, library);
	}

	inline static public function soundRandom(key:String, min:Int, max:Int, ?library:String)
	{
		return sound(key + FlxG.random.int(min, max), library);
	}

	inline static public function customChart(key:String)
		{
			return TitleState.modFolder + '/data/charts/$key.json';
		}

		inline static public function customImage(key:String)
			{
				if (FileSystem.exists('${key}.png')) {
				return (FlxGraphic.fromBitmapData(BitmapData.fromFile('${key}.png')));
				} else {
				trace('bro that doesn\'t exist ' + '${key}.png');
				return (FlxGraphic.fromBitmapData(BitmapData.fromFile('assets/shared/images/blank.png')));
				}
			}
	inline static public function music(key:String, ?library:String)
	{
		return getPath('music/$key.$SOUND_EXT', MUSIC, library);
	}
	public static var replaceSong = false;
	

	inline static public function voices(song:String, addon:String = "")
	{
		replaceSong = false;
		if (!FreeplayState.isaCustomSong) {
	var songKey:String = '${(song)}/Voices${(addon)}';
	
	var voices = returnSound(null, songKey, 'songs');

	//trace(TitleState.modFolder + '/' + 'assets/songs/${(song)}/Voices${(addon)}' + '.ogg');
		if (FileSystem.exists(TitleState.modFolder + '/' + 'assets/songs/${(song.toLowerCase())}/Voices${(addon)}' + '.ogg')) {
			replaceSong = true;
		//	trace(replaceSong);
			voices = returnSound(null, '${(song.toLowerCase())}/Voices${(addon)}', 'songs');
		}
	
	return voices;
		} else {
	var songKey:String = 'mods/' + TitleState.currentMod + '/songs/${(song)}/Voices${(addon)}';
	var voices = returnSound(null, songKey, 'songs');
	return voices;
		}
	}

	inline static public function inst(song:String)
	{
		replaceSong = false;
		if (!FreeplayState.isaCustomSong) {
			var songKey:String = '${(song)}/Inst';
			var inst = returnSound(null, songKey, 'songs');

           // trace(TitleState.modFolder + '/' + 'assets/songs/${(song.toLowerCase())}/Inst' + '.ogg');
			if (FileSystem.exists(TitleState.modFolder + '/' + 'assets/songs/${(song.toLowerCase())}/Inst' + '.ogg')) {
			replaceSong = true;
			//trace(replaceSong);
			inst = returnSound(null, '${(song.toLowerCase())}/Inst', 'songs');
			}
		return inst;
			} else {
		var songKey:String = 'mods/' + TitleState.currentMod + '/songs/${(song)}/Inst';
		var inst = returnSound(null, songKey, 'songs');
		return inst;
			}
	}

	inline static public function externmusic(song:String)
	{
		return 'songs:assets/songs/extern/${song.toLowerCase()}.$SOUND_EXT';
	}

	inline static public function image(key:String, ?library:String)
	{
		var defaultReturnPath = getPath('images/$key.png', IMAGE, library);
		if (isLocale())
		{
			var langaugeReturnPath = getPath('locale/${LanguageManager.save.data.language}/images/$key.png', IMAGE, library);
			if (FileSystem.exists(langaugeReturnPath))
			{
				return langaugeReturnPath;
			}
			else
			{
				return defaultReturnPath;
			}
		}
		else
		{
			return defaultReturnPath;
		}
	}

	 // Thanks psych engine for the sound code
   
	 public static var currentTrackedSounds:Map<String, Sound> = [];
	 public static var localTrackedAssets:Array<String> = [];
	 public static function returnSound(path:String, key:String, ?library:String) {

		 var modLibPath:String = '';
		 if (library != null) modLibPath = '$library/';
		 if (path != null) modLibPath += '$path/';
 
		 var file:String = modsSounds((path != null ? path : ""), key);
		 if(FileSystem.exists(file)) {
			 if(!currentTrackedSounds.exists(file)) {
				 currentTrackedSounds.set(file, Sound.fromFile(file));
			 }
			 localTrackedAssets.push(key);
			 return currentTrackedSounds.get(file);
		 }
		 var gottenPath:String = '$key.$SOUND_EXT';
		 if(path != null) gottenPath = '$path/$gottenPath';
		 if (!FreeplayState.isaCustomSong)
			{
			//	trace(replaceSong);
				if (replaceSong) {
				//	trace('asd');
                var kay = StringTools.replace(getPath(gottenPath, SOUND, library), 'songs:', '');
				var kay2 = StringTools.trim(kay);
				gottenPath = TitleState.modFolder + '/' + kay2;
				} else {
		 gottenPath = getPath(gottenPath, SOUND, library);
				}
			}
		 gottenPath = gottenPath.substring(gottenPath.indexOf(':') + 1, gottenPath.length);
		 if(!currentTrackedSounds.exists(gottenPath))
	
			 currentTrackedSounds.set(gottenPath, Sound.fromFile('./' + gottenPath));
		
		 localTrackedAssets.push(gottenPath);
		// trace(gottenPath);
		 return currentTrackedSounds.get(gottenPath);
	 }
	/*
		WARNING!!
		DO NOT USE splashImage, splashFile or getSplashSparrowAtlas for searching stuff in paths!!!!!
		I'm only using these for FlxSplash since the languages haven't loaded yet!
	*/

	inline static public function splashImage(key:String, ?library:String, ?ext:String = 'png')
	{
		var defaultReturnPath = getPath('images/$key.$ext', IMAGE, library);
		return defaultReturnPath;
	}

	inline static public function splashFile(file:String, type:AssetType = TEXT, ?library:String)
	{
		var defaultReturnPath = getPath(file, type, library);
		return defaultReturnPath;
	}

	inline static public function getSplashSparrowAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSparrow(splashImage(key, library), splashFile('images/$key.xml', library));
	}

	inline static public function font(key:String)
	{
		return 'assets/fonts/$key';
	}
	static public function langaugeFile():String
	{
		return getPath('locale/languages.txt', TEXT, 'preload');
	}
	static public function offsetFile(character:String):String
	{
		return getPath('offsets/' + character + '.txt', TEXT, 'preload');
	}

	inline static public function getSparrowAtlas(key:String, ?library:String)
	{
		var what = library == null ? 'assets' : 'assets/' + library;
		var short = what + '/images/' + key;
		//trace(TitleState.modFolder + '/' + short + '.png');
		if (FileSystem.exists(TitleState.modFolder + '/' + short + '.png') && FileSystem.exists(TitleState.modFolder + '/' + short + '.xml')) {
		//trace('custom exists');
		return FlxAtlasFrames.fromSparrow(customImage(TitleState.modFolder + '/' + short), customFile(TitleState.modFolder + '/' + short + '.xml'));	
		} else {
		return FlxAtlasFrames.fromSparrow(image(key, library), file('images/$key.xml', library));	
		}
	}

	inline static public function getCustomSparrowAtlas(key:String)
		{
			return FlxAtlasFrames.fromSparrow(customImage(key), customFile('$key.xml'));	
		}

	inline static public function getPackerAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key, library), file('images/$key.txt', library));	
	}

	inline static public function getCustomPackerAtlas(key:String)
		{
			return FlxAtlasFrames.fromSpriteSheetPacker(customImage(key), customFile('$key.txt'));
		}

	inline static public function video(key:String, ?library:String)
	{
		return getPath('videos/$key.mp4', BINARY, library);
	}

}