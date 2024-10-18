package;
#if sys
import sys.io.File;
import sys.io.Process;
#end
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.system.System;
import sys.io.File;
import sys.FileSystem;
import flixel.FlxCamera;
import flixel.addons.ui.FlxUIText;
import haxe.zip.Writer;
import Conductor.BPMChangeEvent;
import Section.SwagSection;
import Song.SwagSong;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxColor;
import haxe.Json;
import lime.utils.Assets;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.IOErrorEvent;
import openfl.events.IOErrorEvent;
import openfl.media.Sound;
import openfl.net.FileReference;
import openfl.utils.ByteArray;

using StringTools;
/**
 * scary!!!
 */
class BaseGameDeleter extends FlxState 
{
	var bga:FlxSprite;
	var deleteData:Bool = false;
	var deleteSongs:Bool = false;
	var deleteCharacterImages:Bool = false;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		FlxG.mouse.visible = true;
		bga = new FlxSprite(-80).loadGraphic(MainMenuState.randomizeBG());
		bga.scrollFactor.set();
		bga.setGraphicSize(Std.int(bga.width * 1.1));
		bga.updateHitbox();
		bga.screenCenter();
		bga.antialiasing = FlxG.save.data.antialiasing;
		bga.color = 0xFF1E1E1E;
		add(bga);

		//var spooky:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('dave/e', 'shared'));
        ///spooky.screenCenter();
        //add(spooky);
	
		addUI();
		
	}

	function addUI():Void
		{
			//var box = new FlxUITabMenu(null, [{name: "S", label: 'Song Data'}], true);
			var deldata = new FlxUICheckBox(430, 300, null, null, "Delete Charts (assets/data/charts)", 100);
			deldata.checked = false;
			deldata.callback = function()
			{
				deleteData = deldata.checked;
			};
			add(deldata);
			
			var delsongs = new FlxUICheckBox(deldata.x + 300, 300, null, null, "Delete Songs (assets/songs)", 100);
			delsongs.checked = false;
			delsongs.callback = function()
			{
				deleteSongs = delsongs.checked;
			};
			add(delsongs);

			var delcharimg = new FlxUICheckBox(deldata.x, deldata.y + 150, null, null, "Delete Character Images", 100);
			delcharimg.checked = false;
			delcharimg.callback = function()
			{
				deleteCharacterImages = delcharimg.checked;
			};
			add(delcharimg);

			var del = new FlxButton(570, deldata.y + 250, "Delete Base Game Stuff", function()
				{
					dBGS();
				});
			add(del);

		}

		function dBGS():Void
			{		
				var json = {
					"deletedCharts": deleteData,
					"deletedSongs": deleteSongs,
					"deletedCharacterImages": deleteCharacterImages,
				}
				var jon:String = Json.stringify(json);
				File.saveContent(Paths.json('BaseGameDeleter'), jon.trim());
				if (deleteData && FileSystem.exists('assets/data/charts')) {
					for (file in FileSystem.readDirectory('assets/data/charts')) {
					if (!file.startsWith('warmup'))
                    FileSystem.deleteFile('assets/data/charts/' + file);
					}
				//	FileSystem.deleteDirectory('assets/data/charts');
				}

				if (deleteSongs && FileSystem.exists('assets/songs')) {
					for (folder in FileSystem.readDirectory('assets/songs')) {
						if (!folder.startsWith('warmup')) {
                      for (file in FileSystem.readDirectory('assets/songs/' + folder)) {
						FileSystem.deleteFile('assets/songs/${folder}/${file}');
					  }
					  FileSystem.deleteDirectory('assets/songs/${folder}');
					}
				}
					//FileSystem.deleteDirectory('assets/songs');
				}

				if (deleteCharacterImages) {
					var charimg = [Paths.getSparrowAtlasPath('dave/characters/Dave_insanity_lol', 'shared'), Paths.getSparrowAtlasPath('dave/characters/davefriend', 'shared'), Paths.getSparrowAtlasPath('dave/characters/thecoolerdave', 'shared'), Paths.getSparrowAtlasPath('dave/characters/Dave_3D', 'shared'), Paths.getSparrowAtlasPath('fiveNights/dave_fnaf', 'shared'), Paths.getSparrowAtlasPath('splitathon/Splitathon_Dave', 'shared'), Paths.getSparrowAtlasPath('recursed/characters/Dave_Recursed', 'shared'), Paths.getSparrowAtlasPath('recursed/characters/Dave_3D_Recursed', 'shared'), Paths.getSparrowAtlasPath('festival/dave_festival', 'shared'), Paths.getSparrowAtlasPath('festival/dave_festival_3d', 'shared'), Paths.getSparrowAtlasPath('bambi/bambiRemake', 'shared'), Paths.getSparrowAtlasPath('bambi/fuckbi', 'shared'), Paths.getSparrowAtlasPath('bambi/im_gonna_break_me_phone', 'shared'), Paths.getSparrowAtlasPath('recursed/characters/Bambi_Recursed', 'shared'), Paths.getSparrowAtlasPath('characters/BaldiInRoof', 'shared'), Paths.getSparrowAtlasPath('splitathon/Splitathon_Bambi', 'shared'), Paths.getSparrowAtlasPath('bambi/Angry_Bambi', 'shared'), Paths.getSparrowAtlasPath('bambi/bambimaddddd', 'shared'), Paths.getSparrowAtlasPath('expunged/Cheating', 'shared'), Paths.getSparrowAtlasPath('expunged/unfair_bambi', 'shared'), Paths.getSparrowAtlasPath('expunged/ExpungedFinal', 'shared'), Paths.getSparrowAtlasPath('joke/bambi-joke', 'shared'), Paths.getSparrowAtlasPath('joke/bambi-joke-mad', 'shared'), Paths.getSparrowAtlasPath('festival/bambi_shredder', 'shared'), Paths.getSparrowAtlasPath('dave/TRISTAN', 'shared'), Paths.getSparrowAtlasPath('dave/TristanHairFlipped', 'shared'), Paths.getSparrowAtlasPath('dave/tristan_golden', 'shared'), Paths.getSparrowAtlasPath('dave/tristan_golden_glowing', 'shared'), Paths.getSparrowAtlasPath('festival/tristan_festival', 'shared'), Paths.getSparrowAtlasPath('festival/tristan_festival_playable', 'shared'), Paths.getSparrowAtlasPath('characters/exbungo', 'shared'), Paths.getSparrowAtlasPath('recursed/Recurser', "shared"), Paths.getSparrowAtlasPath('recursed/characters/TristanRecursed', 'shared'), Paths.getSparrowAtlasPath('characters/DONT_GO_SNOOPING_WHERE_YOURE_NOT_SUPPOSED_TO', 'shared'), Paths.getSparrowAtlasPath('recursed/characters/STOP_LOOKING_AT_THE_FILES', 'shared'), Paths.getSparrowAtlasPath('california/moldygh', 'shared'), Paths.getSparrowAtlasPath('playrobot/playbot', 'shared'), Paths.getSparrowAtlasPath('playrobot/playrobot_shadow', 'shared'),  Paths.getSparrowAtlasPath('dave/characters/dave_awesome', 'shared'), ];
					for (img in charimg) {
						//var charimagepath = img;
					//	if (folder.startsWith('shared:')) {
						var	charimagepath = StringTools.replace(img, 'shared:', '');
					//	}
					if (FileSystem.exists(charimagepath + '.png')) {
						FileSystem.deleteFile(charimagepath + '.png');
					}
					if (FileSystem.exists(charimagepath + '.xml')) {
						FileSystem.deleteFile(charimagepath + '.xml');
					}
					}
				}
				
		var versionShit:FlxText = new FlxText(300, 0, 0, 'CLOSING BOOT UP ENGINE AFTER', 12);
		versionShit.antialiasing = FlxG.save.data.antialiasing;
		versionShit.scrollFactor.set();
		versionShit.screenCenter();
		versionShit.setFormat("Comic Sans MS Bold", 30, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		new FlxTimer().start(2, function(timer:FlxTimer) {
			System.exit(0);
		});
	
			}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
			{
				FlxG.mouse.visible = false;
				FlxG.switchState(new MainMenuState());
			}
		
	}

	
	
}