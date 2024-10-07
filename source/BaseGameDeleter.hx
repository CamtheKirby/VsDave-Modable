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
			var deldata = new FlxUICheckBox(300, 300, null, null, "Delete Charts (assets/data/charts)", 100);
			deldata.checked = false;
			deldata.callback = function()
			{
				deleteData = deldata.checked;
			};
			add(deldata);

			//var box = new FlxUITabMenu(null, [{name: "S", label: 'Song Data'}], true);
			var delsongs = new FlxUICheckBox(deldata.x + 300, 300, null, null, "Delete Songs (assets/songs)", 100);
			delsongs.checked = false;
			delsongs.callback = function()
			{
				deleteSongs = delsongs.checked;
			};
			add(delsongs);

			var del = new FlxButton(570, deldata.y + 250, "Delete Base Game Stuff", function()
				{
					dBGS();
				});
			add(del);

		}

		function dBGS():Void
			{		
				var json = {
					"DeletedCharts": deleteData,
					"DeletedSongs": deleteSongs,
				}
				var jon:String = Json.stringify(json);
				File.saveContent(Paths.json('BaseGameDeleter'), jon.trim());
				if (deleteData && FileSystem.exists('assets/data/charts')) {
					for (file in FileSystem.readDirectory('assets/data/charts')) {
                      FileSystem.deleteFile('assets/data/charts/' + file);
					}
					FileSystem.deleteDirectory('assets/data/charts');
				}

				if (deleteSongs && FileSystem.exists('assets/songs')) {
					for (folder in FileSystem.readDirectory('assets/songs')) {
                      for (file in FileSystem.readDirectory('assets/songs/' + folder)) {
						FileSystem.deleteFile('assets/songs/${folder}/${file}');
					  }
					  FileSystem.deleteDirectory('assets/songs/${folder}');
					}
					FileSystem.deleteDirectory('assets/songs');
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