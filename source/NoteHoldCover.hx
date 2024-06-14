package;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.input.gamepad.FlxGamepad;
import openfl.Lib;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.FlxObject;
import flixel.math.FlxRandom;
import flixel.addons.effects.FlxSkewedSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import PlayState;
import Note;

/**
 * Splash for Sustain Notes
*/
class NoteHoldCover extends FlxTypedSpriteGroup<FlxSprite>
{
	var holdCover:FlxSprite;

	public function new(note:Note, fin:Bool = false, theY:Float)
		{
		  super(0, 0);
	  if (!fin) {
		  make(note, theY);
	  } else {
		end(note);
	  }
		}
    function make(note:Note, theY):Void
    {
			var notesArrayThings = note.notesArray;
	
			var nots = note.noteData % Main.keyAmmo[PlayState.mania];
	
			holdCover = new FlxSprite(note.x, theY);
			holdCover.frames = Paths.getSparrowAtlas('notes/noteSplash/holdCover'+notesArrayThings[nots], 'shared');
			holdCover.animation.addByPrefix('holdCoverStart', 'holdCoverStart${notesArrayThings[nots]}0', 30, false, false, false);
			holdCover.animation.addByPrefix('holdCover', 'holdCover${notesArrayThings[nots]}0', 30, true, false, false);
			holdCover.animation.addByPrefix('holdCoverEnd', 'holdCoverEnd${notesArrayThings[nots]}0', 30, false, false, false);
			add(holdCover);
	
			holdCover.setGraphicSize(Std.int(note.width * 4), Std.int(note.height * 4));
	
			if (holdCover.animation.exists("holdCoverStart")) {
				holdCover.animation.play("holdCoverStart");
				holdCover.animation.finishCallback = function(name:String) {
					trace('finshed ' + name);
					holdCover.animation.play("holdCover");
					}
			}
	
			offset.x += 135;
			offset.y += 118;
    }
    function end(note:Note):Void
	{
		holdCover.animation.play("holdCoverEnd");
		holdCover.animation.finishCallback = function(name:String) {
		trace('finshed ' + name);
	    this.kill();
	}
	}
}