package;

import flixel.FlxSprite;
import PlayState;

class StrumNote extends FlxSprite
{
	public var baseX:Float;
	public var baseY:Float;
	public var playerStrum:Bool;
	public var pressingKey5:Bool;
	public function new(x:Float, y:Float, type:String, strumID:Int, playerStrum:Bool)
	{
		super(x, y);
		baseY = y;
		pressingKey5 = false;

		ID = strumID;

		// get the frames and stuff
		switch (type)
		{
			case '3D':
				frames = Paths.getSparrowAtlas('notes/NOTE_assets_3D');
			case 'top10awesome':
				frames = Paths.getSparrowAtlas('notes/OMGtop10awesomehi');
			case 'gh':
				frames = Paths.getSparrowAtlas('notes/NOTEGH_assets');
			case 'shape':
				frames = Paths.getSparrowAtlas('notes/NOTE_assets_Shape');
			default:
				frames = Paths.getSparrowAtlas('notes/NOTE_assets');
		}
		// actually load in the animation
		switch (type)
		{
			case 'gh':
				animation.addByPrefix('green', 'A Strum');
				animation.addByPrefix('red', 'B Strum');
				animation.addByPrefix('yellow', 'C Strum');
				animation.addByPrefix('blue', 'D Strum');
				animation.addByPrefix('orange', 'E Strum');

				switch (Math.abs(strumID))
				{
					case 0:
						animation.addByPrefix('static', 'A Strum');
						animation.addByPrefix('pressed', 'A Press', 24, false);
						animation.addByPrefix('confirm', 'A Confirm', 24, false);
					case 1:
						animation.addByPrefix('static', 'B Strum');
						animation.addByPrefix('pressed', 'B Press', 24, false);
						animation.addByPrefix('confirm', 'B Confirm', 24, false);
					case 2:
						animation.addByPrefix('static', 'C Strum');
						animation.addByPrefix('pressed', 'C Press', 24, false);
						animation.addByPrefix('confirm', 'C Confirm', 24, false);
					case 3:
						animation.addByPrefix('static', 'D Strum');
						animation.addByPrefix('pressed', 'D Press', 24, false);
						animation.addByPrefix('confirm', 'D Confirm', 24, false);
					case 4:
						animation.addByPrefix('static', 'E Strum');
						animation.addByPrefix('pressed', 'E Press', 24, false);
						animation.addByPrefix('confirm', 'E Confirm', 24, false);
				}
			default:
				animation.addByPrefix('green', 'arrowUP');
				animation.addByPrefix('blue', 'arrowDOWN');
				animation.addByPrefix('purple', 'arrowLEFT');
				animation.addByPrefix('red', 'arrowRIGHT');

				var nSuf:Array<String> = ['LEFT0', 'DOWN0', 'UP0', 'RIGHT0'];
				var pPre:Array<String> = ['left', 'down', 'up', 'right'];
				switch (PlayState.SONG.mania)
				{
					case 1:
						nSuf = ['LEFT0', 'DOWN0', 'SPACE', 'UP0', 'RIGHT0'];
						pPre = ['left', 'down', 'white', 'up', 'right'];
					case 2:
						nSuf = ['LEFT0', 'UP0', 'RIGHT0', 'LEFT0', 'DOWN0', 'RIGHT0'];
						pPre = ['left', 'up', 'right', 'yel', 'down', 'dark'];
					case 3:
						nSuf = ['LEFT0', 'UP0', 'RIGHT0', 'SPACE', 'LEFT0', 'DOWN0', 'RIGHT0'];
						pPre = ['left', 'up', 'right', 'white', 'yel', 'down', 'dark'];
					case 4:
						nSuf = ['LEFT0', 'DOWN0', 'UP0', 'RIGHT0', 'SPACE', 'LEFT0', 'DOWN0', 'UP0', 'RIGHT0'];
						pPre = ['left', 'down', 'up', 'right', 'white', 'yel', 'violet', 'black', 'dark'];
					case 5:
						nSuf = ['LEFT0', 'DOWN0', 'UP0', 'RIGHT0', 'LEFTSHARP', 'DOWNSHARP', 'UPSHARP', 'RIGHTSHARP', 'LEFT0', 'DOWN0', 'UP0', 'RIGHT0'];
						pPre = ['left', 'down', 'up', 'right', 'pink', 'turq', 'emerald', 'lightred', 'yel', 'violet', 'black', 'dark'];
				}
				animation.addByPrefix('static', 'arrow' + nSuf[strumID]);
				animation.addByPrefix('pressed', pPre[strumID] + ' press', 24, false);
				animation.addByPrefix('confirm', pPre[strumID] + ' confirm', 24, false);
		}
		playAnim('static');

		antialiasing = type != '3D';

		setGraphicSize(Std.int(width * (type == 'gh' ? 0.7 : Note.noteSize)));
		updateHitbox();

		scrollFactor.set();

		this.playerStrum = playerStrum;
	}
	public function resetX()
	{
		x = baseX;
	}
	public function resetY()
	{
		y = baseY;
	}
	public function centerStrum()
	{
		x = baseX + 320 * (playerStrum ? -1 : 1) + 78 / 4;
	}
    public function playAnim(anim:String, ?force:Bool = false) {
        animation.play(anim, force);
        updateHitbox();
        offset.x = frameWidth / 2;
        offset.y = frameHeight / 2;

        offset.x -= 156 * Note.scales[PlayState.SONG.mania] / 2;
        offset.y -= 156 * Note.scales[PlayState.SONG.mania] / 2;
	}
}