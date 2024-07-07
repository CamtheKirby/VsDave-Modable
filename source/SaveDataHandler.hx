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

		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.playerLight == null)
			FlxG.save.data.playerLight = true;

		if (FlxG.save.data.cpuLight == null)
			FlxG.save.data.cpuLight = true;

		if (FlxG.save.data.ratingsPopUp == null)
			FlxG.save.data.ratingsPopUp = true;

		if (FlxG.save.data.stage == null)
			FlxG.save.data.stage = true;

		if (FlxG.save.data.chars == null)
			FlxG.save.data.chars = true;

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
		
		if (FlxG.save.data.oppM == null)
			FlxG.save.data.oppM = false;
		
		if (FlxG.save.data.middleScroll == null)
			FlxG.save.data.middleScroll = false;

		if (FlxG.save.data.randomNotes == null)
			FlxG.save.data.randomNotes = false;

		if (FlxG.save.data.maniabutyeah == null)
			FlxG.save.data.maniabutyeah = 0;

		if (FlxG.save.data.randomNoteTypes == null)
			FlxG.save.data.randomNoteTypes = 0;

		if (FlxG.save.data.bothSides == null)
			FlxG.save.data.bothSides = false;
		
		if (FlxG.save.data.wantShaders == null)
			FlxG.save.data.wantShaders = true;

		if (FlxG.save.data.hideHud == null)
			FlxG.save.data.hideHud = false;

		if (FlxG.save.data.showcaseMode == null)
			FlxG.save.data.showcaseMode = false;

		if (FlxG.save.data.creditsPop == null)
			FlxG.save.data.creditsPop = true;

		/*if (FlxG.save.data.noteSplashTransparent == null)
			FlxG.save.data.noteSplashTransparent = 1; */

			if (FlxG.save.data.flashing == null)
				FlxG.save.data.flashing = true;

			if (FlxG.save.data.cameraZoom == null)
				FlxG.save.data.cameraZoom = true;

			if (FlxG.save.data.comboStack == null)
				FlxG.save.data.comboStack = true;

			if (FlxG.save.data.discord == null)
				FlxG.save.data.discord = false;

			if (FlxG.save.data.antialiasing == null)
				FlxG.save.data.antialiasing = true;

			if (FlxG.save.data.healthBO == null)
				FlxG.save.data.healthBO = 1;

			if (FlxG.save.data.lowQ == null)
				FlxG.save.data.lowQ = false;
    }
}