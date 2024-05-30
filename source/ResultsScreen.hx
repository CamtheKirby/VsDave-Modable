package;
#if sys
import sys.io.File;
import sys.io.Process;
#end
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;

/**
 * lol!!!
 */
class ResultsScreen extends FlxState
{
	var bg:FlxSprite;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();

		bg = new FlxSprite(-80).loadGraphic(MainMenuState.randomizeBG());
		bg.scrollFactor.set();
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = 0xFFD8D8D8;
		add(bg);

		if(FlxG.sound.music != null)
		FlxG.sound.music.stop();
		FlxG.sound.playMusic(Paths.music('goodEnding'),1,true);

		var info:FlxText = new FlxText(FlxG.width - 820, FlxG.height - 720, 0, 'Total Notes Hit: ${PlayState.rstotalNotesHit}\nMax Combo: ${PlayState.rscombo}\nScore: ${PlayState.rssongScore}\nMisses: ${PlayState.rsmisses}\nAccuracy: ${PlayState.rsaccuracy}%\nSicks: ${PlayState.rssicks}\nGoods: ${PlayState.rsgoods}\nBads: ${PlayState.rsbads}\nShits: ${PlayState.rsshits}', 12);
		info.antialiasing = true;
		info.scrollFactor.set();
		info.setFormat("Comic Sans MS Bold", 45, FlxColor.BLACK, LEFT);
		info.alpha = 0;
		add(info);

		var info2:FlxText = new FlxText(FlxG.width - 1250, FlxG.height - 160, 0, '${PlayState.rssong} (By ${CreditsPopUp.songCreator})', 12);
		info2.antialiasing = true;
		info2.scrollFactor.set();
		info2.setFormat("Comic Sans MS Bold", 45, FlxColor.BLACK, LEFT);
		info2.alpha = 0;
		add(info2);

		FlxTween.tween(info,{alpha: 1}, 1, {ease: FlxEase.expoInOut});
		FlxTween.tween(info2,{alpha: 1}, 1, {ease: FlxEase.expoInOut});
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER)
		{
			endIt();
		}
		
	}
	
	public function endIt()
	{
		if(FlxG.sound.music != null)
			FlxG.sound.music.stop();

        FlxG.switchState(new FreeplayState());
	}
	
}