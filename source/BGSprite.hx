package;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import sys.io.File;
import sys.FileSystem;
import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;

using StringTools;

class BGSprite extends FlxSprite
{
	public var spriteName:String;
	var customPath:String;
	public function new(spriteName:String, posX:Float, posY:Float, path:String = '', animations:Array<Animation>, scrollX:Float = 1, scrollY:Float = 1, antialiasing:Bool = true, active:Bool = false)
	{
		super(posX, posY);
		
		this.spriteName = spriteName;
		var hasAnimations:Bool = animations != null;
		var toTrim = StringTools.replace(path, 'shared:', '');
        customPath = StringTools.trim(toTrim);
		if (path != '')
		{
			if (hasAnimations)
			{
				var theActualPath:String = '';
				if (FileSystem.exists(TitleState.modFolder + '/' + customPath)) {
				theActualPath = customPath;
				} else {
				theActualPath = path;
				}
				frames = Paths.getSparrowAtlas(theActualPath);
				for (i in 0...animations.length)
				{
					var curAnim = animations[i];
					if (curAnim != null)
					{
						if (curAnim.indices != null)
						{
							animation.addByIndices(curAnim.name, curAnim.prefixName, curAnim.indices, "", curAnim.frames, curAnim.looped, curAnim.flip[0], curAnim.flip[1]);
						}
						else
						{
							animation.addByPrefix(curAnim.name, curAnim.prefixName, curAnim.frames, curAnim.looped, curAnim.flip[0], curAnim.flip[1]);
						}
					}
				}
			}
			else
			{
				//trace(TitleState.modFolder + '/' + customPath);
				//trace(path);
				if (FileSystem.exists(TitleState.modFolder + '/' + customPath)) {
				loadGraphic((FlxGraphic.fromBitmapData(BitmapData.fromFile(TitleState.modFolder + '/' + customPath))));
				} else {
				loadGraphic(path);
				}
			}
		}
		this.antialiasing = antialiasing;
		scrollFactor.set(scrollX, scrollY);
		this.active = active;
	}
	public static function getBGSprite(spriteGroup:FlxTypedGroup<BGSprite>, spriteName:String):BGSprite
	{
		for (bgSprite in spriteGroup.members)
		{
			if (bgSprite.spriteName == spriteName)
			{
				return bgSprite;
			}
		}
		return null;
	}
}