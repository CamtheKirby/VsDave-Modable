package options;

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
#if desktop
import Discord.DiscordClient;
#end
import sys.io.Process;
import sys.io.File;

class Visuals extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	var awaitingExploitation:Bool;

	var controlsStrings:Array<String> = [];

	private var grpControls:FlxTypedGroup<Alphabet>;
	var versionShit:FlxText;
	var numberOption:String = "";
	var songBarOptions = [
		'ShowTime',
		'ShowTimeOld',
		'SongName',
	];
	var curSongBarOptionSelected:Int;
	
	override function create()
	{
		#if desktop
		if (FlxG.save.data.discord)
		DiscordClient.changePresence("In the Visuals Options Menu", null);
		#end

		awaitingExploitation = (FlxG.save.data.exploitationState == 'awaiting');
		
		    var menuBG:FlxSprite = new FlxSprite();
			menuBG.color = 0xFFea71fd;
			menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
			menuBG.updateHitbox();
			menuBG.antialiasing = FlxG.save.data.antialiasing;
			menuBG.loadGraphic(MainMenuState.randomizeBG());
			add(menuBG);
			curSongBarOptionSelected = songBarOptions.indexOf(FlxG.save.data.songBarOption);
		controlsStrings = CoolUtil.coolStringFile( 
			(FlxG.save.data.songPosition ? LanguageManager.getTextString('option_songPosition_on') : LanguageManager.getTextString('option_songPosition_off'))
			+ "\n" +  LanguageManager.getTextString('option_songBarType_${songBarOptions[curSongBarOptionSelected]}')
			+ "\n" + (FlxG.save.data.noteCamera ? LanguageManager.getTextString('option_noteCamera_on') : LanguageManager.getTextString('option_noteCamera_off'))
			+ "\n" + (FlxG.save.data.disableFps ? LanguageManager.getTextString('option_enable_fps') : LanguageManager.getTextString('option_disable_fps'))
			+ "\n" + (FlxG.save.data.noteSplash ? 'Note Splash ON' : 'Note Splash OFF') 
			+ "\n" + (FlxG.save.data.ogHold ? "OG Hold Note Style ON" : "OG Hold Note Style OFF")
			+ "\n" + ("Sustain Transparency")
			+ "\n" + (FlxG.save.data.freeplayCuts ? "Freeplay Cutscenes ON" : "Freeplay Cutscenes OFF")
			+ "\n" + (FlxG.save.data.hideHud ? "Hide Hud ON" : "Hide Hud OFF")
			+ "\n" + (FlxG.save.data.showcaseMode ? "Showcase Mode ON" : "Showcase Mode OFF")
			+ "\n" + (FlxG.save.data.creditsPop ? "Credits Popup ON" : "Credits Popup OFF")
			//+ "\n" + ("Note Splash Transparency")
			+ "\n" + (FlxG.save.data.flashing ? "Flashing Lights ON" : "Flashing Lights OFF")
			+ "\n" + (FlxG.save.data.cameraZoom ? "Camera Zooms ON" : "Camera Zooms OFF")
			+ "\n" + (FlxG.save.data.comboStack ? "Combo Stacking ON" : "Combo Stacking OFF")
			+ "\n" + (FlxG.save.data.discord ? "Discord Rich Presence ON" : "Discord Rich Presence OFF")
			+ "\n" + ("Health Bar and Icon Transparency")
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

		versionShit = new FlxText(5, FlxG.height - 35, 0, numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.BACK)
		{
			FlxG.save.flush();
			CompatTool.save.flush();
			FlxG.switchState(new OptionsMenu());
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
					FlxG.save.data.songPosition = !FlxG.save.data.songPosition;
					updateGroupControls((FlxG.save.data.songPosition ? LanguageManager.getTextString('option_songPosition_on') : LanguageManager.getTextString('option_songPosition_off')), 3, 'Vertical');	
				case 1:
					curSongBarOptionSelected++;
					if (curSongBarOptionSelected > songBarOptions.length - 1)
					{
						curSongBarOptionSelected = 0;
					}
					FlxG.save.data.songBarOption = songBarOptions[curSongBarOptionSelected];
					updateGroupControls(LanguageManager.getTextString('option_songBarType_${songBarOptions[curSongBarOptionSelected]}'), 4, 'Vertical');	
				case 2:
					FlxG.save.data.noteCamera = !FlxG.save.data.noteCamera;
					updateGroupControls((FlxG.save.data.noteCamera ? LanguageManager.getTextString('option_noteCamera_on') : LanguageManager.getTextString('option_noteCamera_off')), 8, 'Vertical');
					case 3:
					FlxG.save.data.disableFps = !FlxG.save.data.disableFps;
					Main.fps.visible = !FlxG.save.data.disableFps;
					updateGroupControls(FlxG.save.data.disableFps ? LanguageManager.getTextString('option_enable_fps') : LanguageManager.getTextString('option_disable_fps'), 10, 'Vertical');	
					case 4:
					FlxG.save.data.noteSplash = !FlxG.save.data.noteSplash;
					updateGroupControls((FlxG.save.data.noteSplash ? 'Note Splash ON' : 'Note Splash OFF'), 1, 'Vertical');		
					case 5:
					FlxG.save.data.ogHold = !FlxG.save.data.ogHold;
					updateGroupControls(FlxG.save.data.ogHold ? 'OG Hold Note Style ON' : 'OG Hold Note Style OFF', 12, 'Vertical');	
					case 6:
					if (FlxG.save.data.susTransparent < 0.9) {
					FlxG.save.data.susTransparent += 0.1;
					} else {
					FlxG.save.data.susTransparent = 0.1;	
					}
					updateGroupControls('Sustain Transparency', 12, 'Vertical');
					numberOption = 'Sustain Transparency: ' + FlxG.save.data.susTransparent;
					versionShit.text = numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset;
					case 7:
					FlxG.save.data.freeplayCuts = !FlxG.save.data.freeplayCuts;
					updateGroupControls(FlxG.save.data.freeplayCuts ? 'Freeplay Cutscenes ON' : 'Freeplay Cutscenes OFF', 12, 'Vertical');
					case 8:
						FlxG.save.data.hideHud = !FlxG.save.data.hideHud;
						updateGroupControls(FlxG.save.data.hideHud ? 'Hide Hud ON' : 'Hide Hud OFF', 12, 'Vertical');	
						case 9:
						FlxG.save.data.showcaseMode = !FlxG.save.data.showcaseMode;
						updateGroupControls(FlxG.save.data.showcaseMode ? 'Showcase Mode ON' : 'Showcase Mode OFF', 12, 'Vertical');
						case 10:
							FlxG.save.data.creditsPop = !FlxG.save.data.creditsPop;
							updateGroupControls(FlxG.save.data.creditsPop ? 'Credits Popup ON' : 'Credits Popup OFF', 12, 'Vertical');	
					/*	case 11:
					if (FlxG.save.data.noteSplashTransparent < 0.9) {
					FlxG.save.data.noteSplashTransparent += 0.1;
					} else {
					FlxG.save.data.noteSplashTransparent = 0.1;	
					}
					updateGroupControls('Note Splash Transparency', 12, 'Vertical');
					numberOption = 'Note Splash Transparency: ' + FlxG.save.data.noteSplashTransparent;
					versionShit.text = numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset;		
					*/
					case 11:
							FlxG.save.data.flashing = !FlxG.save.data.flashing;
							updateGroupControls(FlxG.save.data.flashing ? 'Flashing Lights ON' : 'Flashing Lights OFF', 12, 'Vertical');
							case 12:
							FlxG.save.data.cameraZoom = !FlxG.save.data.cameraZoom;
							updateGroupControls(FlxG.save.data.cameraZoom ? 'Camera Zooms ON' : 'Camera Zooms OFF', 12, 'Vertical');		
							case 13:
							FlxG.save.data.comboStack = !FlxG.save.data.comboStack;
							updateGroupControls(FlxG.save.data.comboStack ? 'Combo Stacking ON' : 'Combo Stacking OFF', 12, 'Vertical');
							case 14:
							FlxG.save.data.discord = !FlxG.save.data.discord;
							updateGroupControls(FlxG.save.data.discord ? 'Discord Rich Presence ON' : 'Discord Rich Presence OFF', 12, 'Vertical');
							case 15:
								if (FlxG.save.data.healthBO < 0.9) {
								FlxG.save.data.healthBO += 0.1;
								} else {
								FlxG.save.data.healthBO = 0;	
								} 
								updateGroupControls('Health Bar and Icon Transparency', 12, 'Vertical');
								numberOption = 'Health Bar and Icon Transparency: ' + FlxG.save.data.healthBO;
								versionShit.text = numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset;
			}
		}
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
		#if !switch
		// NGio.logEvent('Fresh');
		#end
		
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