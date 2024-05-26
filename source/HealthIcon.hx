package;

import sys.FileSystem;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;


class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;

	public var noAaChars:Array<String> = [
		'dave-angey',
		'bambi-3d',
		'bf-pixel',
		'gf-pixel',
		'bambi-unfair',
		'expunged',
		'nofriend',
		'dave-festival-3d'
	];
	var char:String;
	var state:String;
	public var isPlayer:Bool;
	
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}

	public function changeIcon(char:String)
	{
		if (this.char != char)
		{
			if (char != "none") {
				if (FileSystem.exists('assets/images/ui/iconGrid/' + char + '.png')) {
				loadGraphic(FlxGraphic.fromBitmapData(BitmapData.fromFile(Paths.image('ui/iconGrid/' + char, 'preload'))), true, 150, 150);
				} else if (FileSystem.exists('mods/global characters/images/icons/' + char + '.png')) {
					loadGraphic(Paths.customImage('mods/global characters/images/icons/' + char), true, 150, 150);
				} else if  (FileSystem.exists(TitleState.modFolder + '/images/icons/' + char + '.png')) {
					loadGraphic(Paths.customImage(TitleState.modFolder + '/images/icons/' + char), true, 150, 150);
				} else {
					loadGraphic(Paths.image('blank', 'shared'));
				}
			} else {
				loadGraphic(Paths.image('blank', 'shared'));
			}
	
			if (char != "none")
			{
				antialiasing = !noAaChars.contains(char);
				animation.add(char, [0, 1], 0, false, isPlayer);
				animation.play(char);
			}
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		offset.set(Std.int(FlxMath.bound(width - 150, 0)), Std.int(FlxMath.bound(height - 150, 0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
	public function changeState(charState:String)
	{
		switch (charState)
		{
			case 'normal':
				animation.curAnim.curFrame = 0;
			case 'losing':
				animation.curAnim.curFrame = 1;
		}
		state = charState;
	}
	public function getState()
	{
		return state;
	}
	public function getChar():String
	{
		return char;
	}
}