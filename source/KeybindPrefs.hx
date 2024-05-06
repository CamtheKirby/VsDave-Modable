package;
import Controls.KeyboardScheme;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;

class KeybindPrefs
{
   public static var keybinds:Map<String, Array<FlxKey>> = new Map<String, Array<FlxKey>>();

   public static var defaultKeybinds:Map<String, Array<FlxKey>> = [
		'left'		=> [A, LEFT],
		'down'		=> [S, DOWN],
		'up'		   => [W, UP],
		'right'	   => [D, RIGHT],
		'accept'		=> [SPACE, ENTER],
		'key5'		=> [SPACE, SHIFT],
		'center'		=> [SPACE, SHIFT],
		'back'	   => [BACKSPACE, ESCAPE],
		'pause'		=> [ENTER, ESCAPE],
		'reset'		=> [R, DELETE],
		'lefta1'		=> [S, NONE],
		'upa'		=> [D, NONE],
		'righta1'		=> [F, NONE],
		'centera'		=> [SPACE, NONE],
		'lefta2'		=> [J, LEFT],
		'downa'		=> [K, DOWN],
		'righta2'		=> [L, RIGHT],
		'leftb1'		=> [A, NONE],
		'downb1'		=> [S, NONE],
		'upb1'		   => [D, NONE],
		'rightb1'	   => [F, NONE],
		'centerb'		=> [SPACE, NONE],
		'leftb2'		=> [H, NONE],
		'downb2'		=> [J, NONE],
		'upb2'		   => [K, NONE],
		'rightb2'	   => [L, NONE],
		'leftc1'		=> [A, NONE],
		'downc1'		=> [S, NONE],
		'upc1'		   => [D, NONE],
		'rightc1'	   => [F, NONE],
		'leftc2'		=> [C, NONE],
		'downc2'		=> [V, NONE],
		'upc2'		   => [B, NONE],
		'rightc2'	   => [N, NONE],
		'leftc3'		=> [J, NONE],
		'downc3'		=> [K, NONE],
		'upc3'		   => [L, NONE],
		'rightc3'	   => [SEMICOLON, NONE]
	];
	public static var controlNames:Array<String> = ['left', 'down', 'up', 'right', 'key5', 'accept', 'back', 'pause', 'reset', 'lefta1', 'upa', 'righta1', 'centera', 'lefta2', 'downa', 'righta2', 'leftb1', 'downb1', 'upb1', 'rightb1', 'centerb', 'leftb2', 'downb2', 'upb2', 'rightb2', 'leftc1', 'downc1', 'upc1', 'rightc1', 'leftc2', 'downc2', 'upc2', 'rightc2', 'leftc3', 'downc3', 'upc3', 'rightc3'];

	public static function saveControls()
	{
		var controlsSave:FlxSave = new FlxSave();
		controlsSave.bind('controls', 'ninjamuffin99');
		controlsSave.data.keybinds = keybinds;
		controlsSave.flush();
	}
	public static function loadControls()
	{
		var controlsSave:FlxSave = new FlxSave();
		controlsSave.bind('controls', 'ninjamuffin99');
		if (controlsSave != null && controlsSave.data.keybinds != null)
		{
			var funnyKeybinds:Map<String, Array<FlxKey>> = controlsSave.data.keybinds;
			for (control in defaultKeybinds.keys())
			{
				if (!funnyKeybinds.exists(control))
				{
					funnyKeybinds.set(control, defaultKeybinds.get(control));
				}
			}
			setKeybinds(funnyKeybinds);
		}
		else
		{
			keybinds = defaultKeybinds.copy();
			saveControls();
		}
	}
	public static function setKeybinds(customControls:Map<String, Array<FlxKey>>)
	{
		for (controlName => key in customControls)
		{
			keybinds.set(controlName, key);
		}
		PlayerSettings.player1.controls.setKeyboardScheme(Custom);
	}
	public static function setKeybindPreset(scheme:KeyboardScheme)
	{
		PlayerSettings.player1.controls.setKeyboardScheme(scheme);

		var controls:Controls = PlayerSettings.player1.controls;
		for (control in controlNames)
		{
			keybinds.set(control, controls.getInputsFor(Controls.stringControlToControl(control), Controls.Device.Keys));
		}
	}
}