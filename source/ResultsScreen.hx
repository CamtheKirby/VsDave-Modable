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
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.math.FlxRandom;
import Song.SwagSong;
import flixel.math.FlxRandom;

/**
 * result screen similar to the og fnf one
 */
class ResultsScreen extends FlxState
{
	var bg:FlxSprite;
	var score:Int = 0;
	var info:FlxText;
	var info2:FlxText;
	var notesTxt:FlxText;
	var bf:Character;
	var gf:HealthIcon;
    var theNotes:Float;
    var theNotess:Float;
	var characterStuff:Bool;
	var misses:Array<String> = ['singDOWNmiss', 'singLEFTmiss', 'singRIGHTmiss', 'singUPmiss'];
	var misses2:Array<String> = ['singDOWN', 'singLEFT', 'singRIGHT', 'singUP'];
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();

		Main.toggleFuckedFPS(false);

		theNotes = (PlayState.rssicks + PlayState.rsgoods) / PlayState.allNotes * 100;

		theNotess = Math.floor(theNotes);

		if (theNotess > 100) {
			theNotess = 100;
		}

		bg = new FlxSprite(-80).loadGraphic(MainMenuState.randomizeBG());
		bg.scrollFactor.set();
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = 0xFF7F7F7F;
		add(bg);

	    info = new FlxText(FlxG.width - 1850, FlxG.height - 420, 0, !PlayState.isStoryMode ? 'Total Notes Hit: ${PlayState.rstotalNotesHit}\nMax Combo: ${PlayState.rscombo}\nScore: ${PlayState.rssongScore}\nMisses: ${PlayState.rsmisses}\nAccuracy: ${PlayState.rsaccuracy}%\nSicks: ${PlayState.rssicks}\nGoods: ${PlayState.rsgoods}\nBads: ${PlayState.rsbads}\nShits: ${PlayState.rsshits}' : 'Total Notes Hit: ${PlayState.rstotalNotesHit}\nMax Combo: ${PlayState.rscombo}\nScore: ${PlayState.rssongScore}\nMisses: ${PlayState.rsmisses}\nBest Accuracy: ${PlayState.rsaccuracy}%\nSicks: ${PlayState.rssicks}\nGoods: ${PlayState.rsgoods}\nBads: ${PlayState.rsbads}\nShits: ${PlayState.rsshits}', 12);
		info.antialiasing = true;
		info.scrollFactor.set();
		info.setFormat("Comic Sans MS Bold", 30, FlxColor.BLACK, LEFT);
		info.alpha = 1;
		add(info);

		if (PlayState.isHighscore) {
			info.text += "\nNEW HIGHSCORE!!";
		}

		var credit = '(By ${CreditsPopUp.songCreator})';
		if (PlayState.isStoryMode) {
			credit = '';
		}

		info2 = new FlxText(FlxG.width - 1850, FlxG.height - 630, 0, '${score}% - ${PlayState.rssong} ${credit}', 12);
		info2.antialiasing = true;
		info2.scrollFactor.set();
		info2.setFormat("Comic Sans MS Bold", 25, FlxColor.BLACK, LEFT);
		info2.alpha = 1;
		add(info2);

		notesTxt = new FlxText(0, 0, 0, score + '%', 12);
		notesTxt.antialiasing = true;
		notesTxt.scrollFactor.set();
		notesTxt.setFormat("Comic Sans MS Bold", 200, FlxColor.BLACK, CENTER);
		notesTxt.screenCenter();
		add(notesTxt);

		if (PlayState.formoverride == "none" || PlayState.formoverride == "bf" || PlayState.formoverride == PlayState.SONG.player1)
			{
				bf = new Boyfriend(930, 1000, PlayState.SONG.player1);
			}
			else
			{
				bf = new Boyfriend(930, 1000, PlayState.formoverride);
			}
		bf.setGraphicSize(Std.int(bf.width / 2));
		bf.updateHitbox();
		add(bf);

		if (HealthIcon.iconExists(PlayState.gfVersion)) {
		gf = new HealthIcon(PlayState.gfVersion, true);
		gf.x = 1500;
		gf.y = 550;
		gf.setGraphicSize(Std.int(gf.width / 2));
		gf.updateHitbox();
		add(gf);
		}

		//Math.floor((rssicks + rsgoods) / allNotes * 100)

        tally();
		//FlxTween.tween(info,{alpha: 1}, 1, {ease: FlxEase.expoInOut});
		//FlxTween.tween(info2,{alpha: 1}, 1, {ease: FlxEase.expoInOut});
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		notesTxt.text = score + '%';
		if (FlxG.keys.pressed.ENTER)
		{
			endIt();
		}
		if (characterStuff) {
		if (theNotes == 100) {
			var hitAnimation:Bool = bf.animation.getByName("dodge") != null;
			var heyAnimation:Bool = bf.animation.getByName("hey") != null;
			if (bf.animation.finished) {
			bf.playAnim(hitAnimation ? 'dodge' : (heyAnimation ? 'hey' : 'singUP'), true);
			}
		} else if (theNotes >= 90) {
		var heyAnimation:Bool = bf.animation.getByName("hey") != null;
		if (bf.animation.finished) {
		bf.playAnim(heyAnimation ? 'hey' : 'singUP', true);
		}
		} else if (theNotes >= 80) {
			if (bf.animation.finished) {
				bf.playAnim('idle', true);
				}
		} else if (theNotes >= 60) {
			var sAnimation:Bool = bf.animation.getByName("scared") != null;
			if (bf.animation.finished || sAnimation) {
			bf.playAnim(sAnimation ? 'scared' : 'singDOWN', true);
			}
		} else {
			var random = misses[FlxG.random.int(0, misses.length - 1)];
			var missAnimation:Bool = bf.animation.getByName(random) != null;
			if (bf.animation.finished) {
				bf.playAnim(missAnimation ? random : misses2[FlxG.random.int(0, misses2.length - 1)], true);
				if (!missAnimation) {
					bf.color = 0xFF000084;
				}
				}
		}
	}
	}
	
	public function endIt()
	{
		if(FlxG.sound.music != null)
			FlxG.sound.music.stop();

		PlayState.allNotes = 0;
		PlayState.isHighscore = false;
if (!PlayState.isStoryMode) {
        FlxG.switchState(new FreeplayState());
} else {
	FlxG.switchState(new StoryMenuState());	
}
	}

	public function tally() // hall
		{
			var theScore = { value: score };
			var shakeDistance:Float = 0.5;

			FlxG.sound.play(Paths.sound('riser'));

			FlxTween.color(notesTxt, 2.1, notesTxt.color, FlxColor.WHITE);
			FlxTween.tween(theScore,{ value: theNotess }, 2.1, {ease: FlxEase.expoInOut});

			FlxTween.tween(theScore, { value: theNotess }, 2.1, {
				ease: FlxEase.expoInOut,
				onUpdate: function(tween:FlxTween) {
					score = theScore.value;
					var originalX:Float = notesTxt.x;
					var originalY:Float = notesTxt.y;
					
					notesTxt.x = originalX + FlxG.random.float(-shakeDistance, shakeDistance);
					notesTxt.y = originalY + FlxG.random.float(-shakeDistance, shakeDistance);
				},
				onComplete: function(tween:FlxTween) {
					notesTxt.screenCenter();
					if (theNotes >= 60) {
					FlxG.sound.play(Paths.sound('confirmMenu'));
					} else {
				    var deathSound:FlxSound = new FlxSound();
				    deathSound.loadEmbedded(Paths.soundRandom('missnote', 1, 3));
				    deathSound.volume = FlxG.random.float(0.6, 1);
				    deathSound.play();

					FlxG.camera.shake(0.05, 0.1);
					}
					
					
                    if (theNotes == 100) {
						bg.color = 0xFFD4D400;
						FlxTween.color(notesTxt, 0.3, notesTxt.color, FlxColor.YELLOW);
					} else if (theNotes >= 90) {
						bg.color = 0xFF500050;
						FlxTween.color(notesTxt, 0.3, notesTxt.color, FlxColor.PURPLE);
					} else if (theNotes >= 80) {
						bg.color = 0xFFB1B7D9;
						FlxTween.color(notesTxt, 0.3, notesTxt.color, 0xFFCED5FF);
					} else if (theNotes >= 60) {
						bg.color = 0xFFD06F00;
						FlxTween.color(notesTxt, 0.3, notesTxt.color, 0xFFE57A00);
					} else {
						bg.color = 0xFF1A1AC1;
						FlxTween.color(notesTxt, 0.3, notesTxt.color, 0xFF1E1EDB);
					}

					FlxTween.tween(notesTxt,{ size: 230 }, 0.2, {ease: FlxEase.expoInOut,onComplete: function(tween:FlxTween) {
					FlxTween.tween(notesTxt,{ size: 200 }, 1.6, {ease: FlxEase.expoInOut,onComplete: function(tween:FlxTween) {
						info2.text = '${score}% - ${PlayState.rssong} (By ${CreditsPopUp.songCreator})';
						otherStuff();
					}});
					}});
					
				}
			});
		}

		public function otherStuff()
			{
				if(FlxG.sound.music != null)
					FlxG.sound.music.stop();

				if (theNotes == 100) {
				FlxG.sound.playMusic(Paths.music('cornGame'),1,true); // banger
				if (HealthIcon.iconExists(PlayState.gfVersion)) {
					gf.changeState('winning');
				}
				} else if (theNotes >= 90) {
				FlxG.sound.playMusic(Paths.music('goodEnding'),1,true);
				if (HealthIcon.iconExists(PlayState.gfVersion)) {
					gf.changeState('winning');
				}
				} else if (theNotes >= 80) {
				FlxG.sound.playMusic(Paths.music('goodEnding'),1,true);
				} else if (theNotes >= 60) {
				FlxG.sound.playMusic(Paths.music('breakfast'),1,true);
				} else {
				FlxG.sound.playMusic(Paths.music('badEnding'),1,true);
				if (HealthIcon.iconExists(PlayState.gfVersion)) {
					gf.changeState('losing');
					gf.color = 0xFF000084;
				}
				}
					

				FlxTween.tween(notesTxt,{alpha: 0}, 2, {ease: FlxEase.expoInOut});
				FlxTween.tween(info2,{x: FlxG.width - 1220}, 1.5, {ease: FlxEase.expoInOut});
				FlxTween.tween(info,{x: FlxG.width - 1220}, 1.5, {ease: FlxEase.expoInOut});
				characterStuff = true;
				FlxTween.tween(bf,{y: 360}, 2.5, {ease: FlxEase.expoInOut});
				if (HealthIcon.iconExists(PlayState.gfVersion)) {
				FlxTween.tween(gf,{x: 1100}, 3.2, {ease: FlxEase.expoInOut});
				if (theNotes == 100) {
				gfStuff();
				}
				}
			}

		public function gfStuff()
		{
			FlxTween.tween(gf,{y: 590}, 0.7, {ease: FlxEase.expoInOut,onComplete: function(tween:FlxTween) {
			FlxTween.tween(gf,{y: 550}, 0.7, {ease: FlxEase.expoInOut,onComplete: function(tween:FlxTween) {
				 gfStuff();
				}});
			}});
	
        }
	}