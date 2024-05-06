package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Boyfriend extends Character
{
	public var stunned:Bool = false;
	public var curBf:String = 'bf';

	public function new(x:Float, y:Float, ?char:String = 'bf')
	{
		super(x, y, char, true);
		curBf = char;
	}

	override function update(elapsed:Float)
	{
		if (!debugMode)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}
			else
				holdTimer = 0;

			if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
			{
				playAnim('idle', true, false, 10);
			}

			if (curBf == 'shaggy-lose' || curBf == 'redshaggy-lose') {
				if ((animation.curAnim.name == 'firstDeath' || animation.curAnim.name == 'deathLoopRight' || animation.curAnim.name == 'deathLoopLeft') && animation.curAnim.finished)
				{
					danceLose();
				}
			}
			else if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished)
			{
				playAnim('deathLoop');
			}

		}

		super.update(elapsed);
	}
}
