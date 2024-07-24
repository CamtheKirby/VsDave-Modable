package options;

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
#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

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
			+ "\n" + ("UI Selecter")
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

		versionShit = new FlxText(5, FlxG.height - 35, 0, numberOption + "\nOffset (Left, Right): " + FlxG.save.data.offset, 12);
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
						if (FileSystem.exists('mods/global/UI.json')) {
					FlxG.switchState(new UISelectState());
						}
					updateGroupControls("UI Selecter", 12, 'Vertical');
					case 3:
					FlxG.switchState(new GamePlay());
					updateGroupControls("Gameplay", 12, 'Vertical');	
					case 4:
					FlxG.switchState(new Visuals());
					updateGroupControls("Visuals", 12, 'Vertical');	
					case 5:
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