package;

import flixel.input.gamepad.FlxGamepad;
import openfl.Lib;
import flixel.FlxG;

/**
 * handles save data initialization
*/
class SaveDataHandler
{
    public static function initSave()
    {
      if (FlxG.save.data.newInput == null)
			FlxG.save.data.newInput = true;
		
		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.eyesores == null)
			FlxG.save.data.eyesores = true;

		if (FlxG.save.data.donoteclick == null)
			FlxG.save.data.donoteclick = false;

		if (FlxG.save.data.newInput != null && FlxG.save.data.lastversion == null)
			FlxG.save.data.lastversion = "pre-beta2";
		
		if (FlxG.save.data.newInput == null && FlxG.save.data.lastversion == null)
			FlxG.save.data.lastversion = "beta2";
		
		if (FlxG.save.data.songPosition == null)
			FlxG.save.data.songPosition = true;
		
		if (FlxG.save.data.noteCamera == null)
			FlxG.save.data.noteCamera = true;
		
		if (FlxG.save.data.offset == null)
			FlxG.save.data.offset = 0;

		if (FlxG.save.data.selfAwareness == null)
			FlxG.save.data.selfAwareness = true;
		
		if (FlxG.save.data.wasInCharSelect == null)
			FlxG.save.data.wasInCharSelect = false;

		if (FlxG.save.data.charactersUnlocked == null)
			FlxG.save.data.charactersUnlocked = ['bf', 'bf-pixel'];

		if (FlxG.save.data.disableFps == null)
			FlxG.save.data.disableFps = false;
		
		if (FlxG.save.data.masterWeekUnlocked == null)
			FlxG.save.data.masterWeekUnlocked = false;

		if (FlxG.save.data.enteredTerminalCheatingState == null)
			FlxG.save.data.enteredTerminalCheatingState = false;
			
		if (FlxG.save.data.hasSeenCreditsMenu == null)
			FlxG.save.data.hasSeenCreditsMenu = false;
		
		if (FlxG.save.data.songBarOption == null)
			FlxG.save.data.songBarOption = 'ShowTime';

		if (FlxG.save.data.adminMode == null) {
			#if debug
			FlxG.save.data.adminMode = true;
			#else
			FlxG.save.data.adminMode = false;
			#end
		}

		if (FlxG.save.data.practiceMode == null)
			FlxG.save.data.practiceMode = false;

		if (FlxG.save.data.lessLag == null)
			FlxG.save.data.lesslag = false;

		if (FlxG.save.data.freeplayCuts == null)
			FlxG.save.data.freeplayCuts = false;

		if (FlxG.save.data.ogHold == null)
			FlxG.save.data.ogHold = true;

		if (FlxG.save.data.susTransparent == null)
			FlxG.save.data.susTransparent = 1;

		if (FlxG.save.data.vanScoreSys == null)
			FlxG.save.data.vanScoreSys = true;
		
		if (FlxG.save.data.vanMissSys == null)
			FlxG.save.data.vanMissSys = true;
		
		if (FlxG.save.data.noteSplash == null)
			FlxG.save.data.noteSplash = true;
    }
}