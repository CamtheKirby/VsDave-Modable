/*package; not used
import flixel.group.FlxGroup.FlxTypedGroup;
#if sys
import sys.io.File;
import sys.io.Process;
#end
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
#if sys import sys.FileSystem; #end


class ModState extends FlxState //why did this extend music beat state?
{
	var bg:FlxSprite;
	var controlsStrings:Array<String> = [];
	private var grpControls:FlxTypedGroup<Alphabet>;

	public static var bgPaths:Array<String> = [
		'Aadsta',
		'ArtiztGmer',
		'DeltaKastel',
		'DeltaKastel2',
		'DeltaKastel3',
		'DeltaKastel4',
		'DeltaKastel5',
		'diamond man',
		'Jukebox',
		'kiazu',
		'Lancey',
		'mamakotomi',
		'mantis',
		'mepperpint',
		'morie',
		'neon',
		'Onuko',
		'ps',
		'ricee_png',
		'sk0rbias',
		'SwagnotrllyTheMod',
		'zombought',
	];
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{

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

		if(FlxG.sound.music != null)
			FlxG.sound.music.stop();
		    bg = new FlxSprite(-80).loadGraphic(randomizeBG());
			bg.scrollFactor.set();
			bg.setGraphicSize(Std.int(bg.width * 1.1));
			bg.updateHitbox();
			bg.screenCenter();
			bg.antialiasing = true;
			bg.color = 0xFFB271FD;
			add(bg);
			super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ESCAPE)
		{
			endIt();
		}
		
	}

	public static function randomizeBG():flixel.system.FlxAssets.FlxGraphicAsset
		{
			var date = Date.now();
			var chance:Int = FlxG.random.int(0, bgPaths.length - 1);
			if(date.getMonth() == 3 && date.getDate() == 1)
			{
				return Paths.image('backgrounds/ramzgaming');
			}
			else
			{
				return Paths.image('backgrounds/${bgPaths[chance]}');
			}
		}
	public function endIt()
	{
        FlxG.switchState(new MainMenuState());
	}
	
} */