package;

import sys.FileSystem;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;
import flixel.FlxG;


class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;

	public static var noAaChars:Array<String> = [
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
	var winningIcon:Bool;
	
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
			var file:Dynamic = '';

			if (char != "none") {
				if (FileSystem.exists('assets/images/ui/iconGrid/' + char + '.png')) {
                if (FileSystem.exists(TitleState.modFolder + '/assets/images/ui/iconGrid/' + char + '.png')) {
					//trace('found');
					file = Paths.customImage(TitleState.modFolder + '/assets/images/ui/iconGrid/' + char);
				} else {
					file = FlxGraphic.fromBitmapData(BitmapData.fromFile(Paths.image('ui/iconGrid/' + char, 'preload')));
				}
				} else if (FileSystem.exists('mods/global/images/icons/' + char + '.png')) {
				file = Paths.customImage('mods/global/images/icons/' + char);
				} else if  (FileSystem.exists(TitleState.modFolder + '/images/icons/' + char + '.png')) {
				file = Paths.customImage(TitleState.modFolder + '/images/icons/' + char);
				} else {
					//trace('lol');
					file = FlxGraphic.fromBitmapData(BitmapData.fromFile(Paths.image('ui/iconGrid/face', 'preload')));
				}
			} else {
				file = Paths.image('blank', 'shared');
			}

			if (char != "none") {
			loadGraphic(file);	
			if (width == 450) {
			loadGraphic(file, true, Math.floor(width / 3), 150);	
			winningIcon = true;
			} else {
			loadGraphic(file, true, 150, 150);	
			}
		}
			
			if (char != "none")
			{
				antialiasing = !noAaChars.contains(char) ? FlxG.save.data.antialiasing : !noAaChars.contains(char);
				//trace('Graphic width before setting: ' + width);
				if (winningIcon) {
				//trace('winning :) added');
				animation.add(char, [0, 1, 2], 0, false, isPlayer);
				} else {
				animation.add(char, [0, 1], 0, false, isPlayer);	
				}
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
		if (char != "none") {
		switch (charState)
		{
			case 'normal':
				animation.curAnim.curFrame = 0;
			case 'losing':
				animation.curAnim.curFrame = 1;
			case 'winning':
				if (winningIcon) {
				//trace('winning :)');
				animation.curAnim.curFrame = 2;
				} else {
				animation.curAnim.curFrame = 0;	
				}
		}
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

	public static function iconExists(check:String):Bool
	{
if (FileSystem.exists('assets/images/ui/iconGrid/' + check + '.png') || FileSystem.exists('mods/global/images/icons/' + check + '.png') || (FileSystem.exists(TitleState.modFolder + '/images/icons/' + check + '.png'))) {
	return true;
} else {
	return false;
}
	}
}