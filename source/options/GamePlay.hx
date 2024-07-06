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

class GamePlay extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	var awaitingExploitation:Bool;

	var controlsStrings:Array<String> = [];

	private var grpControls:FlxTypedGroup<Alphabet>;
	
	override function create()
	{
		#if desktop
		if (FlxG.save.data.discord)
		DiscordClient.changePresence("In the Gameplay Options Menu", null);
		#end

		awaitingExploitation = (FlxG.save.data.exploitationState == 'awaiting');
		
		    var menuBG:FlxSprite = new FlxSprite();
			menuBG.color = 0xFFea71fd;
			menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
			menuBG.updateHitbox();
			menuBG.antialiasing = true;
			menuBG.loadGraphic(MainMenuState.randomizeBG());
			add(menuBG);

		controlsStrings = CoolUtil.coolStringFile( 
			(FlxG.save.data.newInput ? LanguageManager.getTextString('option_ghostTapping_on') : LanguageManager.getTextString('option_ghostTapping_off')) 
			+ "\n" + (FlxG.save.data.downscroll ? LanguageManager.getTextString('option_downscroll') : LanguageManager.getTextString('option_upscroll'))
			+ "\n" + (FlxG.save.data.middleScroll ? "Middlescroll ON" : "Middlescroll OFF")
			+ "\n" + (FlxG.save.data.eyesores ? LanguageManager.getTextString('option_eyesores_enabled') : LanguageManager.getTextString('option_eyesores_disabled')) 
			+ "\n" + (FlxG.save.data.donoteclick ? LanguageManager.getTextString('option_hitsound_on') : LanguageManager.getTextString('option_hitsound_off'))
			+ "\n" + (FlxG.save.data.selfAwareness ? LanguageManager.getTextString('option_selfAwareness_on') : LanguageManager.getTextString('option_selfAwareness_off'))
			+ "\n" + (FlxG.save.data.modchart ? 'Mod Chart OFF' : 'Mod Chart ON')
			+ "\n" + (FlxG.save.data.vanScoreSys ? "New Score System ON" : "New Score System OFF")
			+ "\n" + (FlxG.save.data.vanMissSys ? "New Miss System ON" : "New Miss System OFF")
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

		if (controls.ACCEPT)
		{
			grpControls.remove(grpControls.members[curSelected]);
			switch(curSelected)
			{
				case 0:
					FlxG.save.data.newInput = !FlxG.save.data.newInput;
					updateGroupControls((FlxG.save.data.newInput ? LanguageManager.getTextString('option_ghostTapping_on') : LanguageManager.getTextString('option_ghostTapping_off')), 1, 'Vertical');		
				case 1:
					FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
					updateGroupControls((FlxG.save.data.downscroll ? LanguageManager.getTextString('option_downscroll') : LanguageManager.getTextString('option_upscroll')), 2, 'Vertical');
					case 2:
						FlxG.save.data.middleScroll = !FlxG.save.data.middleScroll;
						updateGroupControls(FlxG.save.data.middleScroll ? 'Middlescroll ON' : 'Middlescroll OFF', 12, 'Vertical');	
					case 3:
					FlxG.save.data.eyesores = !FlxG.save.data.eyesores;
					updateGroupControls((FlxG.save.data.eyesores ? LanguageManager.getTextString('option_eyesores_enabled') : LanguageManager.getTextString('option_eyesores_disabled')), 5, 'Vertical');
					case 4:
					FlxG.save.data.donoteclick = !FlxG.save.data.donoteclick;
					updateGroupControls((FlxG.save.data.donoteclick ? LanguageManager.getTextString('option_hitsound_on') : LanguageManager.getTextString('option_hitsound_off')), 7, 'Vertical');
					case 5:
					FlxG.save.data.selfAwareness = !FlxG.save.data.selfAwareness;
					updateGroupControls((FlxG.save.data.selfAwareness ? LanguageManager.getTextString('option_selfAwareness_on') : LanguageManager.getTextString('option_selfAwareness_off')), 6, 'Vertical');
					case 6:
					if (!awaitingExploitation) FlxG.save.data.modchart = !FlxG.save.data.modchart;
					updateGroupControls(FlxG.save.data.modchart ? 'Mod Chart OFF' : 'Mod Chart ON', 12, 'Vertical');	
					case 7:
					FlxG.save.data.vanScoreSys = !FlxG.save.data.vanScoreSys;
					updateGroupControls(FlxG.save.data.vanScoreSys ? 'New Score System ON' : 'New Score System OFF', 12, 'Vertical');	
				case 8:
					FlxG.save.data.vanMissSys = !FlxG.save.data.vanMissSys;
					updateGroupControls(FlxG.save.data.vanMissSys ? 'New Miss System ON' : 'New Miss System OFF', 12, 'Vertical');	
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