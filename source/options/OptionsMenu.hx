package options;

import haxe.Json;
import sys.FileSystem;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import Controls.KeyboardScheme;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.util.FlxTimer;
import openfl.net.FileReference;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.IOErrorEvent;
import openfl.events.IOErrorEvent;
#if desktop
import Discord.DiscordClient;
#end
import flash.net.FileFilter;
import sys.io.File;

using StringTools;

typedef OptionsJson =
{
	var stage:Bool;
	var showcaseMode:Bool;
	var songPosition:Bool;
	var comboStack:Bool;
	var flashing:Bool;
	var modchart:Bool;
	var donoteclick:Bool;
	var discord:Bool;
	var disableFps:Bool;
	var cameraZoom:Bool;
	var hideHud:Bool;
	var vanScoreSys:Bool;
	var freeplayCuts:Bool;
	var ogHold:Bool;
	var newInput:Bool;
	var susTransparent:Float;
	var healthBO:Float;
	var curSongBarOptionSelected:String;
	var eyesores:Bool;
	var cpuLight:Bool;
	var vanMissSys:Bool;
	var compatMode:Bool;
	var selfAwareness:Bool;
	var chars:Bool;
	var lowQ:Bool;
	var antialiasing:Bool;
	var downscroll:Bool;
	var noteCamera:Bool;
	var noteSplash:Bool;
	var middleScroll:Bool;
	var ratingsPopUp:Bool;
	var playerLight:Bool;
	var adminMode:Bool;
	var wantShaders:Bool;
	var checkVersion:Bool;
}

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	var _file:FileReference;
	
	var controlsStrings:Array<String> = [];

	private var grpControls:FlxTypedGroup<Alphabet>;
	var versionShit:FlxText;

	var bgShader:Shaders.GlitchEffect;
	var awaitingExploitation:Bool;

	var languages:Array<Language> = new Array<Language>();
	var currentLanguage:Int = 0;
	var curLanguage:String = LanguageManager.save.data.language;
	public static var onPlayState:Bool = false;
	var numberOption:String = "";
	var jsonOptions:OptionsJson;

	override function create()
	{
		#if desktop
		if (FlxG.save.data.discord)
		DiscordClient.changePresence("In the Options Menu", null);
		#end
		var menuBG:FlxSprite = new FlxSprite();

		awaitingExploitation = (FlxG.save.data.exploitationState == 'awaiting');

		if (awaitingExploitation)
		{
			menuBG = new FlxSprite(-600, -200).loadGraphic(Paths.image('backgrounds/void/redsky', 'shared'));
			menuBG.scrollFactor.set();
			menuBG.antialiasing = false;
			add(menuBG);
			
			if (FlxG.save.data.wantShaders) {
			bgShader = new Shaders.GlitchEffect();
			bgShader.waveAmplitude = 0.1;
			bgShader.waveFrequency = 5;
			bgShader.waveSpeed = 2;
			
			menuBG.shader = bgShader.shader;
			}
		}
		else
		{
			menuBG.color = 0xFFea71fd;
			menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
			menuBG.updateHitbox();
			menuBG.antialiasing = FlxG.save.data.antialiasing;
			menuBG.loadGraphic(MainMenuState.randomizeBG());
			add(menuBG);
		}
		
		languages = LanguageManager.getLanguages();

		controlsStrings = CoolUtil.coolStringFile( 
			LanguageManager.getTextString('option_change_langauge')
			+ "\n" + LanguageManager.getTextString('option_change_keybinds')
			+ "\n" + ("Gameplay")
			+ "\n" + ("Visuals")
			+ "\n" + ("Optimization")
			);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...controlsStrings.length)
		{
				var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
				controlLabel.screenCenter(X);
				controlLabel.itemType = 'Vertical';
				controlLabel.isMenuItem = true;
				controlLabel.targetY = i;
				grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		versionShit = new FlxText(5, FlxG.height - 50, 0, numberOption + "Press S to make a save json\nPress I to import json\nOffset (Left, Right): " + FlxG.save.data.offset, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.save.data.wantShaders) {
		if (bgShader != null)
		{
			bgShader.shader.uTime.value[0] += elapsed;
		}
	}

		if (controls.BACK)
		{
			if(onPlayState) {
			FlxG.save.flush();
			CompatTool.save.flush();
			LoadingState.loadAndSwitchState(new PlayState());
			FlxG.sound.music.volume = 0;
			onPlayState = false;
			} else {
			FlxG.save.flush();
			CompatTool.save.flush();
			FlxG.switchState(new MainMenuState());
			}
		}
		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);

		if (controls.RIGHT_R)
		{
			FlxG.save.data.offset++;
			versionShit.text = numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset;
		}

		if (controls.LEFT_R)
		{
			FlxG.save.data.offset--;
			versionShit.text = numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset;
		}	
		if (controls.ACCEPT)
		{
			grpControls.remove(grpControls.members[curSelected]);
			switch(curSelected)
			{
				case 0:
					updateGroupControls(LanguageManager.getTextString('option_change_langauge'), 9, 'Vertical');
					FlxG.switchState(new ChangeLanguageState());
					case 1:
						new FlxTimer().start(0.01, function(timer:FlxTimer)
						{
							FlxG.switchState(new ChangeKeybinds());
						});
						updateGroupControls(LanguageManager.getTextString('option_change_keybinds'), 0, 'Vertical');
					case 2:
					FlxG.switchState(new GamePlay());
					updateGroupControls("Gameplay", 12, 'Vertical');	
					case 3:
					FlxG.switchState(new Visuals());
					updateGroupControls("Visuals", 12, 'Vertical');	
					case 4:
					FlxG.switchState(new Optimization());
					updateGroupControls("Optimization", 12, 'Vertical');	
			}
		}

		if (FlxG.keys.justPressed.SEVEN)
			{
			FlxG.save.flush();
			CompatTool.save.flush();
			FlxG.switchState(new AdminOptionsMenu());
			}	

			if (FlxG.keys.justPressed.S)
				{
				FlxG.save.flush();
				CompatTool.save.flush();
				saveLevel();
				}	

				if (FlxG.keys.justPressed.I)
					{
				FlxG.save.flush();
				CompatTool.save.flush();
				loadOptionSave();
					}
	}

	private function saveLevel()
		{
			Visuals.curSongBarOptionSelected = Visuals.songBarOptions.indexOf(FlxG.save.data.songBarOption);
			var json = {
				"adminMode": FlxG.save.data.adminMode,
				"newInput": FlxG.save.data.newInput,
				"downscroll": FlxG.save.data.downscroll,
				"middleScroll": FlxG.save.data.middleScroll,
				"eyesores": FlxG.save.data.eyesores,
				"donoteclick": FlxG.save.data.donoteclick,
				"selfAwareness": FlxG.save.data.selfAwareness,
				"modchart": FlxG.save.data.modchart,
				"vanScoreSys": FlxG.save.data.vanScoreSys,
				"vanMissSys": FlxG.save.data.vanMissSys,
				"compatMode": FlxG.save.data.compatMode,
				"wantShaders": FlxG.save.data.wantShaders,
				"playerLight": FlxG.save.data.playerLight,
				"cpuLight": FlxG.save.data.cpuLight,
				"ratingsPopUp": FlxG.save.data.ratingsPopUp,
				"stage": FlxG.save.data.stage,
				"chars": FlxG.save.data.chars,
				"antialiasing": FlxG.save.data.antialiasing,
				"lowQ": FlxG.save.data.lowQ,
				"songPosition": FlxG.save.data.songPosition,
				"curSongBarOptionSelected": '${Visuals.songBarOptions[Visuals.curSongBarOptionSelected]}',
				"noteCamera": FlxG.save.data.noteCamera,
				"disableFps": FlxG.save.data.disableFps,
				"noteSplash": FlxG.save.data.noteSplash,
				"ogHold": FlxG.save.data.ogHold,
				"susTransparent": FlxG.save.data.susTransparent, // GET OUT OF MY HEAD
				"freeplayCuts": FlxG.save.data.freeplayCuts,
				"hideHud": FlxG.save.data.hideHud,
				"showcaseMode": FlxG.save.data.showcaseMode,
				"flashing": FlxG.save.data.flashing,
				"cameraZoom": FlxG.save.data.cameraZoom,
				"comboStack": FlxG.save.data.comboStack,
				"discord": FlxG.save.data.discord,
				"healthBO": FlxG.save.data.healthBO,
				"checkVersion": FlxG.save.data.checkVersion
			};
	
			var data:String = Json.stringify(json);
	
			if ((data != null) && (data.length > 0))
			{
				_file = new FileReference();
				_file.addEventListener(Event.COMPLETE, onSaveComplete);
				_file.addEventListener(Event.CANCEL, onSaveCancel);
				_file.addEventListener(IOErrorEvent.IO_ERROR, onSaveError);
				_file.save(data.trim(), "OptionsSave.json");
			}
		}
	

	function onSaveComplete(_):Void
		{
			_file.removeEventListener(Event.COMPLETE, onSaveComplete);
			_file.removeEventListener(Event.CANCEL, onSaveCancel);
			_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
			_file = null;
			FlxG.log.notice("Successfully saved LEVEL DATA.");
		}
	
		/**
		 * Called when the save file dialog is cancelled.
		 */
		function onSaveCancel(_):Void
		{
			_file.removeEventListener(Event.COMPLETE, onSaveComplete);
			_file.removeEventListener(Event.CANCEL, onSaveCancel);
			_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
			_file = null;
		}
	
		/**
		 * Called if there is an error while saving the gameplay recording.
		 */
		function onSaveError(_):Void
		{
			_file.removeEventListener(Event.COMPLETE, onSaveComplete);
			_file.removeEventListener(Event.CANCEL, onSaveCancel);
			_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
			_file = null;
			trace("Problem saving Level data");
		}

		function loadOptionSave() {
			var jsonFilter:FileFilter = new FileFilter('JSON', 'json');
			_file = new FileReference();
			_file.addEventListener(#if desktop Event.SELECT #else Event.COMPLETE #end, onLoadComplete);
			_file.addEventListener(Event.CANCEL, onLoadCancel);
			_file.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			_file.browse([jsonFilter]);
		}
		function onLoadComplete(_):Void
			{
				_file.removeEventListener(#if desktop Event.SELECT #else Event.COMPLETE #end, onLoadComplete);
				_file.removeEventListener(Event.CANCEL, onLoadCancel);
				_file.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
		
				#if sys
				var fullPath:String = null;
		@:privateAccess
		if(_file.__path != null) fullPath = _file.__path;

		if(fullPath != null) {
			var rawJson:String = File.getContent(fullPath);
			if(rawJson != null) {
				jsonOptions = cast Json.parse(rawJson);
				// there's prob a way to do this better but whatever
			    FlxG.save.data.adminMode = jsonOptions.adminMode;
			    FlxG.save.data.newInput  = jsonOptions.newInput;
				FlxG.save.data.downscroll = jsonOptions.downscroll;
			    FlxG.save.data.middleScroll = jsonOptions.middleScroll;
			    FlxG.save.data.eyesores = jsonOptions.eyesores;
				FlxG.save.data.donoteclick = jsonOptions.donoteclick;
			    FlxG.save.data.selfAwareness = jsonOptions.selfAwareness;
		        FlxG.save.data.modchart = jsonOptions.modchart;
				FlxG.save.data.vanScoreSys = jsonOptions.vanScoreSys;
				FlxG.save.data.vanMissSys = jsonOptions.vanMissSys;
				FlxG.save.data.compatMode = jsonOptions.compatMode;
				FlxG.save.data.wantShaders = jsonOptions.wantShaders;
				FlxG.save.data.playerLight = jsonOptions.playerLight;
				FlxG.save.data.cpuLight = jsonOptions.cpuLight;
				FlxG.save.data.ratingsPopUp = jsonOptions.ratingsPopUp;
				FlxG.save.data.stage = jsonOptions.stage;
				FlxG.save.data.chars = jsonOptions.chars;
				FlxG.save.data.antialiasing = jsonOptions.antialiasing;
				FlxG.save.data.lowQ = jsonOptions.lowQ;
				FlxG.save.data.songPosition = jsonOptions.songPosition;
				FlxG.save.data.songBarOption = jsonOptions.curSongBarOptionSelected;
				FlxG.save.data.noteCamera  = jsonOptions.noteCamera;
				FlxG.save.data.disableFps = jsonOptions.disableFps;
				FlxG.save.data.noteSplash = jsonOptions.noteSplash;
				FlxG.save.data.ogHold = jsonOptions.ogHold;
				FlxG.save.data.susTransparent = jsonOptions.susTransparent;
				FlxG.save.data.freeplayCuts = jsonOptions.freeplayCuts;
				FlxG.save.data.hideHud = jsonOptions.hideHud;
				FlxG.save.data.showcaseMode = jsonOptions.showcaseMode;
				FlxG.save.data.flashing = jsonOptions.flashing;
				FlxG.save.data.cameraZoom = jsonOptions.cameraZoom;
				FlxG.save.data.comboStack = jsonOptions.comboStack;
				FlxG.save.data.discord = jsonOptions.discord;
				FlxG.save.data.healthBO = jsonOptions.healthBO;
				FlxG.save.data.checkVersion = jsonOptions.checkVersion;
			
				_file = null;

				if(FlxG.sound.music != null)
					FlxG.sound.music.stop();
				TitleState.initialized = false;
				TitleState.onlyforabug = false;
				onPlayState = false;
				FlxG.switchState(new StartStateSelector());
			}
				#else
				trace("You aren't on Desktop, are you?");
				#end
			}
		}

		function onLoadCancel(_):Void
			{
				_file.removeEventListener(#if desktop Event.SELECT #else Event.COMPLETE #end, onLoadComplete);
				_file.removeEventListener(Event.CANCEL, onLoadCancel);
				_file.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
				_file = null;
				trace("Cancelled file loading.");
			}
		
			/**
				* Called if there is an error while saving the gameplay recording.
				*/
			function onLoadError(_):Void
			{
				_file.removeEventListener(#if desktop Event.SELECT #else Event.COMPLETE #end, onLoadComplete);
				_file.removeEventListener(Event.CANCEL, onLoadCancel);
				_file.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
				_file = null;
				trace("Problem loading file");
			}

	var isSettingControl:Bool = false;

	override function beatHit()
	{
		super.beatHit();
		FlxTween.tween(FlxG.camera, {zoom:1.05}, 0.3, {ease: FlxEase.quadOut, type: BACKWARD});
	}
	function updateGroupControls(controlText:String, yIndex:Int, controlTextItemType:String)
	{
		var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, controlText, true, false);
		ctrl.screenCenter(X);
		ctrl.isMenuItem = true;
		ctrl.targetY = curSelected - yIndex;
		ctrl.itemType = controlTextItemType;
		grpControls.add(ctrl);
	}

	function changeSelection(change:Int = 0)
	{
		
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}