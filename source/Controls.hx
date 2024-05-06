package;

import ChangeKeybinds.KeybindState;
import flixel.FlxG;
import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionInputDigital;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxActionSet;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;

#if (haxe >= "4.0.0")
enum abstract Action(String) to String from String
{
	var UP = "up";
	var LEFT = "left";
	var RIGHT = "right";
	var DOWN = "down";
	var UP_P = "up-press";
	var LEFT_P = "left-press";
	var RIGHT_P = "right-press";
	var DOWN_P = "down-press";
	var UP_R = "up-release";
	var LEFT_R = "left-release";
	var RIGHT_R = "right-release";
	var DOWN_R = "down-release";
	var ACCEPT = "accept";
	var BACK = "back";
	var PAUSE = "pause";
	var RESET = "reset";
	var CHEAT = "cheat";
	var KEY5 = "key5";
	var CENTER = "center";
	var CENTER_P = "center-press";
	var CENTER_R = "center-release";

	var L1 = "l1";
	var U1 = "u";
	var R1 = "r1";
	var L2 = "l2";
	var D1 = "d";
	var R2 = "r2";

	var L1_P = "l1-press";
	var U1_P = "u-press";
	var R1_P = "r1-press";
	var L2_P = "l2-press";
	var D1_P = "d-press";
	var R2_P = "r2-press";

	var L1_R = "l1-release";
	var U1_R = "u-release";
	var R1_R = "r1-release";
	var L2_R = "l2-release";
	var D1_R = "d-release";
	var R2_R = "r2-release";

	var A0 = "a0";
	var A1 = "a1";
	var A2 = "a2";
	var A3 = "a3";
	var A4 = "a4";
	var A5 = "a5";
	var A6 = "a6";

	var A0_P = "a0-press";
	var A1_P = "a1-press";
	var A2_P = "a2-press";
	var A3_P = "a3-press";
	var A4_P = "a4-press";
	var A5_P = "a5-press";
	var A6_P = "a6-press";

	var A0_R = "a0-release";
	var A1_R = "a1-release";
	var A2_R = "a2-release";
	var A3_R = "a3-release";
	var A4_R = "a4-release";
	var A5_R = "a5-release";
	var A6_R = "a6-release";

	var N0 = "n0";
	var N1 = "n1";
	var N2 = "n2";
	var N3 = "n3";
	var N4 = "n4";
	var N5 = "n5";
	var N6 = "n6";
	var N7 = "n7";
	var N8 = "n8";

	var N0_P = "n0-press";
	var N1_P = "n1-press";
	var N2_P = "n2-press";
	var N3_P = "n3-press";
	var N4_P = "n4-press";
	var N5_P = "n5-press";
	var N6_P = "n6-press";
	var N7_P = "n7-press";
	var N8_P = "n8-press";

	var N0_R = "n0-release";
	var N1_R = "n1-release";
	var N2_R = "n2-release";
	var N3_R = "n3-release";
	var N4_R = "n4-release";
	var N5_R = "n5-release";
	var N6_R = "n6-release";
	var N7_R = "n7-release";
	var N8_R = "n8-release";

	var T0 = "t0";
	var T1 = "t1";
	var T2 = "t2";
	var T3 = "t3";
	var T4 = "t4";
	var T5 = "t5";
	var T6 = "t6";
	var T7 = "t7";
	var T8 = "t8";
	var T9 = "t9";
	var T10 = "t10";
	var T11 = "t11";

	var T0_P = "t0-press";
	var T1_P = "t1-press";
	var T2_P = "t2-press";
	var T3_P = "t3-press";
	var T4_P = "t4-press";
	var T5_P = "t5-press";
	var T6_P = "t6-press";
	var T7_P = "t7-press";
	var T8_P = "t8-press";
	var T9_P = "t9-press";
	var T10_P = "t10-press";
	var T11_P = "t11-press";

	var T0_R = "t0-release";
	var T1_R = "t1-release";
	var T2_R = "t2-release";
	var T3_R = "t3-release";
	var T4_R = "t4-release";
	var T5_R = "t5-release";
	var T6_R = "t6-release";
	var T7_R = "t7-release";
	var T8_R = "t8-release";
	var T9_R = "t9-release";
	var T10_R = "t10-release";
	var T11_R = "t11-release";
}
#else
@:enum
abstract Action(String) to String from String
{
	var UP = "up";
	var LEFT = "left";
	var RIGHT = "right";
	var DOWN = "down";
	var UP_P = "up-press";
	var LEFT_P = "left-press";
	var RIGHT_P = "right-press";
	var DOWN_P = "down-press";
	var UP_R = "up-release";
	var LEFT_R = "left-release";
	var RIGHT_R = "right-release";
	var DOWN_R = "down-release";
	var ACCEPT = "accept";
	var BACK = "back";
	var PAUSE = "pause";
	var RESET = "reset";
	var CHEAT = "cheat";
	var CENTER = "center";
	var CENTER_P = "center-press";
	var CENTER_R = "center-release";
	
	var L1 = "l1";
	var U1 = "u";
	var R1 = "r1";
	var L2 = "l2";
	var D1 = "d";
	var R2 = "r2";

	var L1_P = "l1-press";
	var U1_P = "u-press";
	var R1_P = "r1-press";
	var L2_P = "l2-press";
	var D1_P = "d-press";
	var R2_P = "r2-press";

	var L1_R = "l1-release";
	var U1_R = "u-release";
	var R1_R = "r1-release";
	var L2_R = "l2-release";
	var D1_R = "d-release";
	var R2_R = "r2-release";

	var A0 = "a0";
	var A1 = "a1";
	var A2 = "a2";
	var A3 = "a3";
	var A4 = "a4";
	var A5 = "a5";
	var A6 = "a6";

	var A0_P = "a0-press";
	var A1_P = "a1-press";
	var A2_P = "a2-press";
	var A3_P = "a3-press";
	var A4_P = "a4-press";
	var A5_P = "a5-press";
	var A6_P = "a6-press";

	var A0_R = "a0-release";
	var A1_R = "a1-release";
	var A2_R = "a2-release";
	var A3_R = "a3-release";
	var A4_R = "a4-release";
	var A5_R = "a5-release";
	var A6_R = "a6-release";

	var N0 = "n0";
	var N1 = "n1";
	var N2 = "n2";
	var N3 = "n3";
	var N4 = "n4";
	var N5 = "n5";
	var N6 = "n6";
	var N7 = "n7";
	var N8 = "n8";

	var N0_P = "n0-press";
	var N1_P = "n1-press";
	var N2_P = "n2-press";
	var N3_P = "n3-press";
	var N4_P = "n4-press";
	var N5_P = "n5-press";
	var N6_P = "n6-press";
	var N7_P = "n7-press";
	var N8_P = "n8-press";

	var N0_R = "n0-release";
	var N1_R = "n1-release";
	var N2_R = "n2-release";
	var N3_R = "n3-release";
	var N4_R = "n4-release";
	var N5_R = "n5-release";
	var N6_R = "n6-release";
	var N7_R = "n7-release";
	var N8_R = "n8-release";

	var T0 = "t0";
	var T1 = "t1";
	var T2 = "t2";
	var T3 = "t3";
	var T4 = "t4";
	var T5 = "t5";
	var T6 = "t6";
	var T7 = "t7";
	var T8 = "t8";
	var T9 = "t9";
	var T10 = "t10";
	var T11 = "t11";

	var T0_P = "t0-press";
	var T1_P = "t1-press";
	var T2_P = "t2-press";
	var T3_P = "t3-press";
	var T4_P = "t4-press";
	var T5_P = "t5-press";
	var T6_P = "t6-press";
	var T7_P = "t7-press";
	var T8_P = "t8-press";
	var T9_P = "t9-press";
	var T10_P = "t10-press";
	var T11_P = "t11-press";

	var T0_R = "t0-release";
	var T1_R = "t1-release";
	var T2_R = "t2-release";
	var T3_R = "t3-release";
	var T4_R = "t4-release";
	var T5_R = "t5-release";
	var T6_R = "t6-release";
	var T7_R = "t7-release";
	var T8_R = "t8-release";
	var T9_R = "t9-release";
	var T10_R = "t10-release";
	var T11_R = "t11-release";
}
#end

enum Device
{
	Keys;
	Gamepad(id:Int);
}

/**
 * Since, in many cases multiple actions should use similar keys, we don't want the
 * rebinding UI to list every action. ActionBinders are what the user percieves as
 * an input so, for instance, they can't set jump-press and jump-release to different keys.
 */
enum Control
{
	UP;
	LEFT;
	RIGHT;
	DOWN;
	RESET;
	ACCEPT;
	BACK;
	PAUSE;
	CHEAT;
	KEY5;
	CENTER;
	L1;
	U1;
	R1;
	L2;
	D1;
	R2;
	A0;
	A1;
	A2;
	A3;
	A4;
	A5;
	A6;
	N0;
	N1;
	N2;
	N3;
	N4;
	N5;
	N6;
	N7;
	N8;
	T0;
	T1;
	T2;
	T3;
	T4;
	T5;
	T6;
	T7;
	T8;
	T9;
	T10;
	T11;
}

enum KeyboardScheme
{
	Solo;
	Duo(first:Bool);
	None;
	Custom;
	Askl;
	ZxCommaDot;
}

/**
 * A list of actions that a player would invoke via some input device.
 * Uses FlxActions to funnel various inputs to a single action.
 */
class Controls extends FlxActionSet
{
	var _up = new FlxActionDigital(Action.UP);
	var _left = new FlxActionDigital(Action.LEFT);
	var _right = new FlxActionDigital(Action.RIGHT);
	var _down = new FlxActionDigital(Action.DOWN);
	var _upP = new FlxActionDigital(Action.UP_P);
	var _leftP = new FlxActionDigital(Action.LEFT_P);
	var _rightP = new FlxActionDigital(Action.RIGHT_P);
	var _downP = new FlxActionDigital(Action.DOWN_P);
	var _upR = new FlxActionDigital(Action.UP_R);
	var _leftR = new FlxActionDigital(Action.LEFT_R);
	var _rightR = new FlxActionDigital(Action.RIGHT_R);
	var _downR = new FlxActionDigital(Action.DOWN_R);
	var _accept = new FlxActionDigital(Action.ACCEPT);
	var _back = new FlxActionDigital(Action.BACK);
	var _pause = new FlxActionDigital(Action.PAUSE);
	var _reset = new FlxActionDigital(Action.RESET);
	var _cheat = new FlxActionDigital(Action.CHEAT);
	var _key5 = new FlxActionDigital(Action.KEY5);
	var _center = new FlxActionDigital(Action.CENTER);
	var _centerP = new FlxActionDigital(Action.CENTER_P);
	var _centerR = new FlxActionDigital(Action.CENTER_R);

	var _l1 = new FlxActionDigital(Action.L1);
	var _l1P = new FlxActionDigital(Action.L1_P);
	var _l1R = new FlxActionDigital(Action.L1_R);

	var _u = new FlxActionDigital(Action.U1);
	var _uP = new FlxActionDigital(Action.U1_P);
	var _uR = new FlxActionDigital(Action.U1_R);

	var _r1 = new FlxActionDigital(Action.R1);
	var _r1P = new FlxActionDigital(Action.R1_P);
	var _r1R = new FlxActionDigital(Action.R1_R);

	var _l2 = new FlxActionDigital(Action.L2);
	var _l2P = new FlxActionDigital(Action.L2_P);
	var _l2R = new FlxActionDigital(Action.L2_R);

	var _d = new FlxActionDigital(Action.D1);
	var _dP = new FlxActionDigital(Action.D1_P);
	var _dR = new FlxActionDigital(Action.D1_R);

	var _r2 = new FlxActionDigital(Action.R2);
	var _r2P = new FlxActionDigital(Action.R2_P);
	var _r2R = new FlxActionDigital(Action.R2_R);


	var _a0 = new FlxActionDigital(Action.A0);
	var _a1 = new FlxActionDigital(Action.A1);
	var _a2 = new FlxActionDigital(Action.A2);
	var _a3 = new FlxActionDigital(Action.A3);
	var _a4 = new FlxActionDigital(Action.A4);
	var _a5 = new FlxActionDigital(Action.A5);
	var _a6 = new FlxActionDigital(Action.A6);

	var _a0P = new FlxActionDigital(Action.A0_P);
	var _a1P = new FlxActionDigital(Action.A1_P);
	var _a2P = new FlxActionDigital(Action.A2_P);
	var _a3P = new FlxActionDigital(Action.A3_P);
	var _a4P = new FlxActionDigital(Action.A4_P);
	var _a5P = new FlxActionDigital(Action.A5_P);
	var _a6P = new FlxActionDigital(Action.A6_P);

	var _a0R = new FlxActionDigital(Action.A0_R);
	var _a1R = new FlxActionDigital(Action.A1_R);
	var _a2R = new FlxActionDigital(Action.A2_R);
	var _a3R = new FlxActionDigital(Action.A3_R);
	var _a4R = new FlxActionDigital(Action.A4_R);
	var _a5R = new FlxActionDigital(Action.A5_R);
	var _a6R = new FlxActionDigital(Action.A6_R);

	var _n0 = new FlxActionDigital(Action.N0);
	var _n1 = new FlxActionDigital(Action.N1);
	var _n2 = new FlxActionDigital(Action.N2);
	var _n3 = new FlxActionDigital(Action.N3);
	var _n4 = new FlxActionDigital(Action.N4);
	var _n5 = new FlxActionDigital(Action.N5);
	var _n6 = new FlxActionDigital(Action.N6);
	var _n7 = new FlxActionDigital(Action.N7);
	var _n8 = new FlxActionDigital(Action.N8);

	var _n0P = new FlxActionDigital(Action.N0_P);
	var _n1P = new FlxActionDigital(Action.N1_P);
	var _n2P = new FlxActionDigital(Action.N2_P);
	var _n3P = new FlxActionDigital(Action.N3_P);
	var _n4P = new FlxActionDigital(Action.N4_P);
	var _n5P = new FlxActionDigital(Action.N5_P);
	var _n6P = new FlxActionDigital(Action.N6_P);
	var _n7P = new FlxActionDigital(Action.N7_P);
	var _n8P = new FlxActionDigital(Action.N8_P);

	var _n0R = new FlxActionDigital(Action.N0_R);
	var _n1R = new FlxActionDigital(Action.N1_R);
	var _n2R = new FlxActionDigital(Action.N2_R);
	var _n3R = new FlxActionDigital(Action.N3_R);
	var _n4R = new FlxActionDigital(Action.N4_R);
	var _n5R = new FlxActionDigital(Action.N5_R);
	var _n6R = new FlxActionDigital(Action.N6_R);
	var _n7R = new FlxActionDigital(Action.N7_R);
	var _n8R = new FlxActionDigital(Action.N8_R);

	var _t0 = new FlxActionDigital(Action.T0);
	var _t1 = new FlxActionDigital(Action.T1);
	var _t2 = new FlxActionDigital(Action.T2);
	var _t3 = new FlxActionDigital(Action.T3);
	var _t4 = new FlxActionDigital(Action.T4);
	var _t5 = new FlxActionDigital(Action.T5);
	var _t6 = new FlxActionDigital(Action.T6);
	var _t7 = new FlxActionDigital(Action.T7);
	var _t8 = new FlxActionDigital(Action.T8);
	var _t9 = new FlxActionDigital(Action.T9);
	var _t10 = new FlxActionDigital(Action.T10);
	var _t11 = new FlxActionDigital(Action.T11);

	var _t0P = new FlxActionDigital(Action.T0_P);
	var _t1P = new FlxActionDigital(Action.T1_P);
	var _t2P = new FlxActionDigital(Action.T2_P);
	var _t3P = new FlxActionDigital(Action.T3_P);
	var _t4P = new FlxActionDigital(Action.T4_P);
	var _t5P = new FlxActionDigital(Action.T5_P);
	var _t6P = new FlxActionDigital(Action.T6_P);
	var _t7P = new FlxActionDigital(Action.T7_P);
	var _t8P = new FlxActionDigital(Action.T8_P);
	var _t9P = new FlxActionDigital(Action.T9_P);
	var _t10P = new FlxActionDigital(Action.T10_P);
	var _t11P = new FlxActionDigital(Action.T11_P);

	var _t0R = new FlxActionDigital(Action.T0_R);
	var _t1R = new FlxActionDigital(Action.T1_R);
	var _t2R = new FlxActionDigital(Action.T2_R);
	var _t3R = new FlxActionDigital(Action.T3_R);
	var _t4R = new FlxActionDigital(Action.T4_R);
	var _t5R = new FlxActionDigital(Action.T5_R);
	var _t6R = new FlxActionDigital(Action.T6_R);
	var _t7R = new FlxActionDigital(Action.T7_R);
	var _t8R = new FlxActionDigital(Action.T8_R);
	var _t9R = new FlxActionDigital(Action.T9_R);
	var _t10R = new FlxActionDigital(Action.T10_R);
	var _t11R = new FlxActionDigital(Action.T11_R);

	#if (haxe >= "4.0.0")
	var byName:Map<String, FlxActionDigital> = [];
	#else
	var byName:Map<String, FlxActionDigital> = new Map<String, FlxActionDigital>();
	#end

	public var gamepadsAdded:Array<Int> = [];
	public var keyboardScheme = KeyboardScheme.None;

	public var UP(get, never):Bool;

	inline function get_UP()
		return _up.check();

	public var LEFT(get, never):Bool;

	inline function get_LEFT()
		return _left.check();

	public var RIGHT(get, never):Bool;

	inline function get_RIGHT()
		return _right.check();

	public var DOWN(get, never):Bool;

	inline function get_DOWN()
		return _down.check();

	public var UP_P(get, never):Bool;

	inline function get_UP_P()
		return _upP.check();

	public var LEFT_P(get, never):Bool;

	inline function get_LEFT_P()
		return _leftP.check();

	public var RIGHT_P(get, never):Bool;

	inline function get_RIGHT_P()
		return _rightP.check();

	public var DOWN_P(get, never):Bool;

	inline function get_DOWN_P()
		return _downP.check();

	public var UP_R(get, never):Bool;

	inline function get_UP_R()
		return _upR.check();

	public var LEFT_R(get, never):Bool;

	inline function get_LEFT_R()
		return _leftR.check();

	public var RIGHT_R(get, never):Bool;

	inline function get_RIGHT_R()
		return _rightR.check();

	public var DOWN_R(get, never):Bool;

	inline function get_DOWN_R()
		return _downR.check();

	public var ACCEPT(get, never):Bool;

	inline function get_ACCEPT()
		return _accept.check();

	public var BACK(get, never):Bool;

	inline function get_BACK()
		return _back.check();

	public var PAUSE(get, never):Bool;

	inline function get_PAUSE()
		return _pause.check();

	public var RESET(get, never):Bool;

	inline function get_RESET()
		return _reset.check();

	public var KEY5(get, never):Bool;

	inline function get_KEY5()
		return _key5.check();

	public var CHEAT(get, never):Bool;

	inline function get_CHEAT()
		return _cheat.check();

	public var CENTER(get, never):Bool;

	inline function get_CENTER()
		return _center.check();

	public var CENTER_P(get, never):Bool;

	inline function get_CENTER_P()
		return _centerP.check();

	public var CENTER_R(get, never):Bool;

	inline function get_CENTER_R()
		return _centerR.check();	

	public var L1(get, never):Bool;

	inline function get_L1()
		return _l1.check();

	public var L1_P(get, never):Bool;

	inline function get_L1_P()
		return _l1P.check();

	public var L1_R(get, never):Bool;

	inline function get_L1_R()
		return _l1R.check();	

	public var D1(get, never):Bool;

	inline function get_D1()
		return _d.check();

	public var D1_P(get, never):Bool;

	inline function get_D1_P()
		return _dP.check();

	public var D1_R(get, never):Bool;

	inline function get_D1_R()
		return _dR.check();

	public var R1(get, never):Bool;

	inline function get_R1()
		return _r1.check();

	public var R1_P(get, never):Bool;

	inline function get_R1_P()
		return _r1P.check();

	public var R1_R(get, never):Bool;

	inline function get_R1_R()
		return _r1R.check();	


	public var L2(get, never):Bool;

	inline function get_L2()
		return _l2.check();

	public var L2_P(get, never):Bool;

	inline function get_L2_P()
		return _l2P.check();

	public var L2_R(get, never):Bool;

	inline function get_L2_R()
		return _l2R.check();	

	public var U1(get, never):Bool;

	inline function get_U1()
		return _u.check();

	public var U1_P(get, never):Bool;

	inline function get_U1_P()
		return _uP.check();

	public var U1_R(get, never):Bool;

	inline function get_U1_R()
		return _uR.check();

	public var R2(get, never):Bool;

	inline function get_R2()
		return _r2.check();

	public var R2_P(get, never):Bool;

	inline function get_R2_P()
		return _r2P.check();

	public var R2_R(get, never):Bool;

	inline function get_R2_R()
		return _r2R.check();


	public var A0(get, never):Bool;
	public var A1(get, never):Bool;
	public var A2(get, never):Bool;
	public var A3(get, never):Bool;
	public var A4(get, never):Bool;
	public var A5(get, never):Bool;
	public var A6(get, never):Bool;

	public var A0_P(get, never):Bool;
	public var A1_P(get, never):Bool;
	public var A2_P(get, never):Bool;
	public var A3_P(get, never):Bool;
	public var A4_P(get, never):Bool;
	public var A5_P(get, never):Bool;
	public var A6_P(get, never):Bool;

	public var A0_R(get, never):Bool;
	public var A1_R(get, never):Bool;
	public var A2_R(get, never):Bool;
	public var A3_R(get, never):Bool;
	public var A4_R(get, never):Bool;
	public var A5_R(get, never):Bool;
	public var A6_R(get, never):Bool;

	inline function get_A0() return _a0.check();
	inline function get_A1() return _a1.check();
	inline function get_A2() return _a2.check();
	inline function get_A3() return _a3.check();
	inline function get_A4() return _a4.check();
	inline function get_A5() return _a5.check();
	inline function get_A6() return _a6.check();

	inline function get_A0_P() return _a0P.check();
	inline function get_A1_P() return _a1P.check();
	inline function get_A2_P() return _a2P.check();
	inline function get_A3_P() return _a3P.check();
	inline function get_A4_P() return _a4P.check();
	inline function get_A5_P() return _a5P.check();
	inline function get_A6_P() return _a6P.check();

	inline function get_A0_R() return _a0R.check();
	inline function get_A1_R() return _a1R.check();
	inline function get_A2_R() return _a2R.check();
	inline function get_A3_R() return _a3R.check();
	inline function get_A4_R() return _a4R.check();
	inline function get_A5_R() return _a5R.check();
	inline function get_A6_R() return _a6R.check();

	public var N0(get, never):Bool;
	public var N1(get, never):Bool;
	public var N2(get, never):Bool;
	public var N3(get, never):Bool;
	public var N4(get, never):Bool;
	public var N5(get, never):Bool;
	public var N6(get, never):Bool;
	public var N7(get, never):Bool;
	public var N8(get, never):Bool;

	public var N0_P(get, never):Bool;
	public var N1_P(get, never):Bool;
	public var N2_P(get, never):Bool;
	public var N3_P(get, never):Bool;
	public var N4_P(get, never):Bool;
	public var N5_P(get, never):Bool;
	public var N6_P(get, never):Bool;
	public var N7_P(get, never):Bool;
	public var N8_P(get, never):Bool;

	public var N0_R(get, never):Bool;
	public var N1_R(get, never):Bool;
	public var N2_R(get, never):Bool;
	public var N3_R(get, never):Bool;
	public var N4_R(get, never):Bool;
	public var N5_R(get, never):Bool;
	public var N6_R(get, never):Bool;
	public var N7_R(get, never):Bool;
	public var N8_R(get, never):Bool;

	inline function get_N0() return _n0.check();
	inline function get_N1() return _n1.check();
	inline function get_N2() return _n2.check();
	inline function get_N3() return _n3.check();
	inline function get_N4() return _n4.check();
	inline function get_N5() return _n5.check();
	inline function get_N6() return _n6.check();
	inline function get_N7() return _n7.check();
	inline function get_N8() return _n8.check();

	inline function get_N0_P() return _n0P.check();
	inline function get_N1_P() return _n1P.check();
	inline function get_N2_P() return _n2P.check();
	inline function get_N3_P() return _n3P.check();
	inline function get_N4_P() return _n4P.check();
	inline function get_N5_P() return _n5P.check();
	inline function get_N6_P() return _n6P.check();
	inline function get_N7_P() return _n7P.check();
	inline function get_N8_P() return _n8P.check();

	inline function get_N0_R() return _n0R.check();
	inline function get_N1_R() return _n1R.check();
	inline function get_N2_R() return _n2R.check();
	inline function get_N3_R() return _n3R.check();
	inline function get_N4_R() return _n4R.check();
	inline function get_N5_R() return _n5R.check();
	inline function get_N6_R() return _n6R.check();
	inline function get_N7_R() return _n7R.check();
	inline function get_N8_R() return _n8R.check();

	public var T0(get, never):Bool;
	public var T1(get, never):Bool;
	public var T2(get, never):Bool;
	public var T3(get, never):Bool;
	public var T4(get, never):Bool;
	public var T5(get, never):Bool;
	public var T6(get, never):Bool;
	public var T7(get, never):Bool;
	public var T8(get, never):Bool;
	public var T9(get, never):Bool;
	public var T10(get, never):Bool;
	public var T11(get, never):Bool;

	public var T0_P(get, never):Bool;
	public var T1_P(get, never):Bool;
	public var T2_P(get, never):Bool;
	public var T3_P(get, never):Bool;
	public var T4_P(get, never):Bool;
	public var T5_P(get, never):Bool;
	public var T6_P(get, never):Bool;
	public var T7_P(get, never):Bool;
	public var T8_P(get, never):Bool;
	public var T9_P(get, never):Bool;
	public var T10_P(get, never):Bool;
	public var T11_P(get, never):Bool;

	public var T0_R(get, never):Bool;
	public var T1_R(get, never):Bool;
	public var T2_R(get, never):Bool;
	public var T3_R(get, never):Bool;
	public var T4_R(get, never):Bool;
	public var T5_R(get, never):Bool;
	public var T6_R(get, never):Bool;
	public var T7_R(get, never):Bool;
	public var T8_R(get, never):Bool;
	public var T9_R(get, never):Bool;
	public var T10_R(get, never):Bool;
	public var T11_R(get, never):Bool;

	inline function get_T0() return _t0.check();
	inline function get_T1() return _t1.check();
	inline function get_T2() return _t2.check();
	inline function get_T3() return _t3.check();
	inline function get_T4() return _t4.check();
	inline function get_T5() return _t5.check();
	inline function get_T6() return _t6.check();
	inline function get_T7() return _t7.check();
	inline function get_T8() return _t8.check();
	inline function get_T9() return _t9.check();
	inline function get_T10() return _t10.check();
	inline function get_T11() return _t11.check();

	inline function get_T0_P() return _t0P.check();
	inline function get_T1_P() return _t1P.check();
	inline function get_T2_P() return _t2P.check();
	inline function get_T3_P() return _t3P.check();
	inline function get_T4_P() return _t4P.check();
	inline function get_T5_P() return _t5P.check();
	inline function get_T6_P() return _t6P.check();
	inline function get_T7_P() return _t7P.check();
	inline function get_T8_P() return _t8P.check();
	inline function get_T9_P() return _t9P.check();
	inline function get_T10_P() return _t10P.check();
	inline function get_T11_P() return _t11P.check();

	inline function get_T0_R() return _t0R.check();
	inline function get_T1_R() return _t1R.check();
	inline function get_T2_R() return _t2R.check();
	inline function get_T3_R() return _t3R.check();
	inline function get_T4_R() return _t4R.check();
	inline function get_T5_R() return _t5R.check();
	inline function get_T6_R() return _t6R.check();
	inline function get_T7_R() return _t7R.check();
	inline function get_T8_R() return _t8R.check();
	inline function get_T9_R() return _t9R.check();
	inline function get_T10_R() return _t10R.check();
	inline function get_T11_R() return _t11R.check();

	#if (haxe >= "4.0.0")
	public function new(name, scheme = None)
	{
		super(name);

		add(_up);
		add(_left);
		add(_right);
		add(_down);
		add(_upP);
		add(_leftP);
		add(_rightP);
		add(_downP);
		add(_upR);
		add(_leftR);
		add(_rightR);
		add(_downR);
		add(_accept);
		add(_back);
		add(_pause);
		add(_reset);
		add(_cheat);
		add(_key5);
		add(_center);
		add(_centerP);
		add(_centerR);

		add(_l1);
		add(_l1P);
		add(_l1R);
		add(_d);
		add(_dP);
		add(_dR);
		add(_r1);
		add(_r1P);
		add(_r1R);

		add(_l2);
		add(_l2P);
		add(_l2R);
		add(_u);
		add(_uP);
		add(_uR);
		add(_r2);
		add(_r2P);
		add(_r2R);


		add(_a0);
		add(_a1);
		add(_a2);
		add(_a3);
		add(_a4);
		add(_a5);
		add(_a6);

		add(_a0P);
		add(_a1P);
		add(_a2P);
		add(_a3P);
		add(_a4P);
		add(_a5P);
		add(_a6P);

		add(_a0R);
		add(_a1R);
		add(_a2R);
		add(_a3R);
		add(_a4R);
		add(_a5R);
		add(_a6R);

		add(_n0);
		add(_n1);
		add(_n2);
		add(_n3);
		add(_n4);
		add(_n5);
		add(_n6);
		add(_n7);
		add(_n8);

		add(_n0P);
		add(_n1P);
		add(_n2P);
		add(_n3P);
		add(_n4P);
		add(_n5P);
		add(_n6P);
		add(_n7P);
		add(_n8P);

		add(_n0R);
		add(_n1R);
		add(_n2R);
		add(_n3R);
		add(_n4R);
		add(_n5R);
		add(_n6R);
		add(_n7R);
		add(_n8R);

		add(_t0);
		add(_t1);
		add(_t2);
		add(_t3);
		add(_t4);
		add(_t5);
		add(_t6);
		add(_t7);
		add(_t8);
		add(_t9);
		add(_t10);
		add(_t11);

		add(_t0P);
		add(_t1P);
		add(_t2P);
		add(_t3P);
		add(_t4P);
		add(_t5P);
		add(_t6P);
		add(_t7P);
		add(_t8P);
		add(_t9P);
		add(_t10P);
		add(_t11P);

		add(_t0R);
		add(_t1R);
		add(_t2R);
		add(_t3R);
		add(_t4R);
		add(_t5R);
		add(_t6R);
		add(_t7R);
		add(_t8R);
		add(_t9R);
		add(_t10R);
		add(_t11R);

		for (action in digitalActions)
			byName[action.name] = action;

		setKeyboardScheme(scheme, false);
	}
	#else
	public function new(name, scheme:KeyboardScheme = null)
	{
		super(name);

		add(_up);
		add(_left);
		add(_right);
		add(_down);
		add(_upP);
		add(_leftP);
		add(_rightP);
		add(_downP);
		add(_upR);
		add(_leftR);
		add(_rightR);
		add(_downR);
		add(_accept);
		add(_back);
		add(_pause);
		add(_reset);
		add(_cheat);
		add(_center);
		add(_centerP);
		add(_centerR);

		add(_l1);
		add(_l1P);
		add(_l1R);
		add(_d);
		add(_dP);
		add(_dR);
		add(_r1);
		add(_r1P);
		add(_r1R);

		add(_l2);
		add(_l2P);
		add(_l2R);
		add(_u);
		add(_uP);
		add(_uR);
		add(_r2);
		add(_r2P);
		add(_r2R);


		add(_a0);
		add(_a1);
		add(_a2);
		add(_a3);
		add(_a4);
		add(_a5);
		add(_a6);

		add(_a0P);
		add(_a1P);
		add(_a2P);
		add(_a3P);
		add(_a4P);
		add(_a5P);
		add(_a6P);

		add(_a0R);
		add(_a1R);
		add(_a2R);
		add(_a3R);
		add(_a4R);
		add(_a5R);
		add(_a6R);

		add(_n0);
		add(_n1);
		add(_n2);
		add(_n3);
		add(_n4);
		add(_n5);
		add(_n6);
		add(_n7);
		add(_n8);

		add(_n0P);
		add(_n1P);
		add(_n2P);
		add(_n3P);
		add(_n4P);
		add(_n5P);
		add(_n6P);
		add(_n7P);
		add(_n8P);

		add(_n0R);
		add(_n1R);
		add(_n2R);
		add(_n3R);
		add(_n4R);
		add(_n5R);
		add(_n6R);
		add(_n7R);
		add(_n8R);

		add(_t0);
		add(_t1);
		add(_t2);
		add(_t3);
		add(_t4);
		add(_t5);
		add(_t6);
		add(_t7);
		add(_t8);
		add(_t9);
		add(_t10);
		add(_t11);

		add(_t0P);
		add(_t1P);
		add(_t2P);
		add(_t3P);
		add(_t4P);
		add(_t5P);
		add(_t6P);
		add(_t7P);
		add(_t8P);
		add(_t9P);
		add(_t10P);
		add(_t11P);

		add(_t0R);
		add(_t1R);
		add(_t2R);
		add(_t3R);
		add(_t4R);
		add(_t5R);
		add(_t6R);
		add(_t7R);
		add(_t8R);
		add(_t9R);
		add(_t10R);
		add(_t11R);

		for (action in digitalActions)
			byName[action.name] = action;
			
		if (scheme == null)
			scheme = None;
		setKeyboardScheme(scheme, false);
	}
	#end

	override function update()
	{
		super.update();
	}

	// inline
	public function checkByName(name:Action):Bool
	{
		#if debug
		if (!byName.exists(name))
			throw 'Invalid name: $name';
		#end
		return byName[name].check();
	}

	public function getDialogueName(action:FlxActionDigital):String
	{
		var input = action.inputs[0];
		return switch input.device
		{
			case KEYBOARD: return '[${(input.inputID : FlxKey)}]';
			case GAMEPAD: return '(${(input.inputID : FlxGamepadInputID)})';
			case device: throw 'unhandled device: $device';
		}
	}

	public function getDialogueNameFromToken(token:String):String
	{
		return getDialogueName(getActionFromControl(Control.createByName(token.toUpperCase())));
	}

	function getActionFromControl(control:Control):FlxActionDigital
	{
		return switch (control)
		{
			case UP: _up;
			case DOWN: _down;
			case LEFT: _left;
			case RIGHT: _right;
			case ACCEPT: _accept;
			case BACK: _back;
			case PAUSE: _pause;
			case RESET: _reset;
			case CHEAT: _cheat;
			case KEY5: _key5;
			case CENTER: _center;

			case L1: _l1;
			case D1: _d;
			case R1: _r1;
			case L2: _l2;
			case U1: _u;
			case R2: _r2;

			case A0: _a0;
			case A1: _a1;
			case A2: _a2;
			case A3: _a3;
			case A4: _a4;
			case A5: _a5;
			case A6: _a6;

			case N0: _n0;
			case N1: _n1;
			case N2: _n2;
			case N3: _n3;
			case N4: _n4;
			case N5: _n5;
			case N6: _n6;
			case N7: _n7;
			case N8: _n8;

			case T0: _t0;
			case T1: _t1;
			case T2: _t2;
			case T3: _t3;
			case T4: _t4;
			case T5: _t5;
			case T6: _t6;
			case T7: _t7;
			case T8: _t8;
			case T9: _t9;
			case T10: _t10;
			case T11: _t11;
		}
	}

	static function init():Void
	{
		var actions = new FlxActionManager();
		FlxG.inputs.add(actions);
	}

	/**
	 * Calls a function passing each action bound by the specified control
	 * @param control
	 * @param func
	 * @return ->Void)
	 */
	function forEachBound(control:Control, func:FlxActionDigital->FlxInputState->Void)
	{
		switch (control)
		{
			case UP:
				func(_up, PRESSED);
				func(_upP, JUST_PRESSED);
				func(_upR, JUST_RELEASED);
			case LEFT:
				func(_left, PRESSED);
				func(_leftP, JUST_PRESSED);
				func(_leftR, JUST_RELEASED);
			case RIGHT:
				func(_right, PRESSED);
				func(_rightP, JUST_PRESSED);
				func(_rightR, JUST_RELEASED);
			case DOWN:
				func(_down, PRESSED);
				func(_downP, JUST_PRESSED);
				func(_downR, JUST_RELEASED);
			case ACCEPT:
				func(_accept, JUST_PRESSED);
			case BACK:
				func(_back, JUST_PRESSED);
			case PAUSE:
				func(_pause, JUST_PRESSED);
			case RESET:
				func(_reset, JUST_PRESSED);
			case CHEAT:
				func(_cheat, JUST_PRESSED);
			case KEY5:
				func(_key5, PRESSED);
			case CENTER:
				func(_center, PRESSED);
				func(_centerP, JUST_PRESSED);
				func(_centerR, JUST_RELEASED);
			case L1:
				func(_l1, PRESSED);
				func(_l1P, JUST_PRESSED);
				func(_l1R, JUST_RELEASED);
			case U1:
				func(_u, PRESSED);
				func(_uP, JUST_PRESSED);
				func(_uR, JUST_RELEASED);
			case R1:
				func(_r1, PRESSED);
				func(_r1P, JUST_PRESSED);
				func(_r1R, JUST_RELEASED);
			case L2:
				func(_l2, PRESSED);
				func(_l2P, JUST_PRESSED);
				func(_l2R, JUST_RELEASED);
			case D1:
				func(_d, PRESSED);
				func(_dP, JUST_PRESSED);
				func(_dR, JUST_RELEASED);
			case R2:
				func(_r2, PRESSED);
				func(_r2P, JUST_PRESSED);
				func(_r2R, JUST_RELEASED);

			case A0:
				func(_a0, PRESSED);
				func(_a0P, JUST_PRESSED);
				func(_a0R, JUST_RELEASED);
			case A1:
				func(_a1, PRESSED);
				func(_a1P, JUST_PRESSED);
				func(_a1R, JUST_RELEASED);
			case A2:
				func(_a2, PRESSED);
				func(_a2P, JUST_PRESSED);
				func(_a2R, JUST_RELEASED);
			case A3:
				func(_a3, PRESSED);
				func(_a3P, JUST_PRESSED);
				func(_a3R, JUST_RELEASED);
			case A4:
				func(_a4, PRESSED);
				func(_a4P, JUST_PRESSED);
				func(_a4R, JUST_RELEASED);
			case A5:
				func(_a5, PRESSED);
				func(_a5P, JUST_PRESSED);
				func(_a5R, JUST_RELEASED);
			case A6:
				func(_a6, PRESSED);
				func(_a6P, JUST_PRESSED);
				func(_a6R, JUST_RELEASED);

			case N0:
				func(_n0, PRESSED);
				func(_n0P, JUST_PRESSED);
				func(_n0R, JUST_RELEASED);
			case N1:
				func(_n1, PRESSED);
				func(_n1P, JUST_PRESSED);
				func(_n1R, JUST_RELEASED);
			case N2:
				func(_n2, PRESSED);
				func(_n2P, JUST_PRESSED);
				func(_n2R, JUST_RELEASED);
			case N3:
				func(_n3, PRESSED);
				func(_n3P, JUST_PRESSED);
				func(_n3R, JUST_RELEASED);
			case N4:
				func(_n4, PRESSED);
				func(_n4P, JUST_PRESSED);
				func(_n4R, JUST_RELEASED);
			case N5:
				func(_n5, PRESSED);
				func(_n5P, JUST_PRESSED);
				func(_n5R, JUST_RELEASED);
			case N6:
				func(_n6, PRESSED);
				func(_n6P, JUST_PRESSED);
				func(_n6R, JUST_RELEASED);
			case N7:
				func(_n7, PRESSED);
				func(_n7P, JUST_PRESSED);
				func(_n7R, JUST_RELEASED);
			case N8:
				func(_n8, PRESSED);
				func(_n8P, JUST_PRESSED);
				func(_n8R, JUST_RELEASED);

			case T0:
				func(_t0, PRESSED);
				func(_t0P, JUST_PRESSED);
				func(_t0R, JUST_RELEASED);
			case T1:
				func(_t1, PRESSED);
				func(_t1P, JUST_PRESSED);
				func(_t1R, JUST_RELEASED);
			case T2:
				func(_t2, PRESSED);
				func(_t2P, JUST_PRESSED);
				func(_t2R, JUST_RELEASED);
			case T3:
				func(_t3, PRESSED);
				func(_t3P, JUST_PRESSED);
				func(_t3R, JUST_RELEASED);
			case T4:
				func(_t4, PRESSED);
				func(_t4P, JUST_PRESSED);
				func(_t4R, JUST_RELEASED);
			case T5:
				func(_t5, PRESSED);
				func(_t5P, JUST_PRESSED);
				func(_t5R, JUST_RELEASED);
			case T6:
				func(_t6, PRESSED);
				func(_t6P, JUST_PRESSED);
				func(_t6R, JUST_RELEASED);
			case T7:
				func(_t7, PRESSED);
				func(_t7P, JUST_PRESSED);
				func(_t7R, JUST_RELEASED);
			case T8:
				func(_t8, PRESSED);
				func(_t8P, JUST_PRESSED);
				func(_t8R, JUST_RELEASED);
			case T9:
				func(_t9, PRESSED);
				func(_t9P, JUST_PRESSED);
				func(_t9R, JUST_RELEASED);
			case T10:
				func(_t10, PRESSED);
				func(_t10P, JUST_PRESSED);
				func(_t10R, JUST_RELEASED);
			case T11:
				func(_t11, PRESSED);
				func(_t11P, JUST_PRESSED);
				func(_t11R, JUST_RELEASED);
		}
	}

	public function replaceBinding(control:Control, device:Device, ?toAdd:Int, ?toRemove:Int)
	{
		if (toAdd == toRemove)
			return;

		switch (device)
		{
			case Keys:
				if (toRemove != null)
					unbindKeys(control, [toRemove]);
				if (toAdd != null)
					bindKeys(control, [toAdd]);

			case Gamepad(id):
				if (toRemove != null)
					unbindButtons(control, id, [toRemove]);
				if (toAdd != null)
					bindButtons(control, id, [toAdd]);
		}
	}

	public function copyFrom(controls:Controls, ?device:Device)
	{
		#if (haxe >= "4.0.0")
		for (name => action in controls.byName)
		{
			for (input in action.inputs)
			{
				if (device == null || isDevice(input, device))
					byName[name].add(cast input);
			}
		}
		#else
		for (name in controls.byName.keys())
		{
			var action = controls.byName[name];
			for (input in action.inputs)
			{
				if (device == null || isDevice(input, device))
				byName[name].add(cast input);
			}
		}
		#end

		switch (device)
		{
			case null:
				// add all
				#if (haxe >= "4.0.0")
				for (gamepad in controls.gamepadsAdded)
					if (!gamepadsAdded.contains(gamepad))
						gamepadsAdded.push(gamepad);
				#else
				for (gamepad in controls.gamepadsAdded)
					if (gamepadsAdded.indexOf(gamepad) == -1)
					  gamepadsAdded.push(gamepad);
				#end

				mergeKeyboardScheme(controls.keyboardScheme);

			case Gamepad(id):
				gamepadsAdded.push(id);
			case Keys:
				mergeKeyboardScheme(controls.keyboardScheme);
		}
	}

	inline public function copyTo(controls:Controls, ?device:Device)
	{
		controls.copyFrom(this, device);
	}

	function mergeKeyboardScheme(scheme:KeyboardScheme):Void
	{
		if (scheme != None)
		{
			switch (keyboardScheme)
			{
				case None:
					keyboardScheme = scheme;
				default:
					keyboardScheme = Custom;
			}
		}
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function bindKeys(control:Control, keys:Array<FlxKey>)
	{
		var copyKeys:Array<FlxKey> = keys.copy();
		for (i in 0...copyKeys.length) {
			if(i == NONE) copyKeys.remove(i);
		}

		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, state) -> addKeys(action, keys, state));
		#else
		forEachBound(control, function(action, state) addKeys(action, keys, state));
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function unbindKeys(control:Control, keys:Array<FlxKey>)
	{
		var copyKeys:Array<FlxKey> = keys.copy();
		for (i in 0...copyKeys.length) {
			if(i == NONE) copyKeys.remove(i);
		}

		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, _) -> removeKeys(action, keys));
		#else
		forEachBound(control, function(action, _) removeKeys(action, keys));
		#end
	}

	inline static function addKeys(action:FlxActionDigital, keys:Array<FlxKey>, state:FlxInputState)
	{
		for (key in keys)
			if(key != NONE)
				action.addKey(key, state);
	}

	static function removeKeys(action:FlxActionDigital, keys:Array<FlxKey>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (input.device == KEYBOARD && keys.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function setKeyboardScheme(scheme:KeyboardScheme, reset = true)
	{
		if (reset)
			removeKeyboard();

		keyboardScheme = scheme;
		
		switch (scheme)
		{
			case Solo:
				inline bindKeys(Control.UP, [J, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [F, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [D, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [K, FlxKey.RIGHT]);
				inline bindKeys(Control.ACCEPT, [SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [SPACE, SHIFT]);
				inline bindKeys(Control.CENTER, [SPACE, SHIFT]);
				inline bindKeys(Control.L1, [S, NONE]);
				inline bindKeys(Control.U1, [D, NONE]);
				inline bindKeys(Control.R1, [F, NONE]);
				inline bindKeys(Control.L2, [J, NONE]);
				inline bindKeys(Control.D1, [K, NONE]);
				inline bindKeys(Control.R2, [L, NONE]);

				inline bindKeys(Control.A0, [S, NONE]);
				inline bindKeys(Control.A1, [D, NONE]);
				inline bindKeys(Control.A2, [F, NONE]);
				inline bindKeys(Control.A3, [SPACE, NONE]);
				inline bindKeys(Control.A4, [J, NONE]);
				inline bindKeys(Control.A5, [K, NONE]);
				inline bindKeys(Control.A6, [L, NONE]);
		
				inline bindKeys(Control.N0, [A, NONE]);
				inline bindKeys(Control.N1, [S, NONE]);
				inline bindKeys(Control.N2, [D, NONE]);
				inline bindKeys(Control.N3, [F, NONE]);
				inline bindKeys(Control.N4, [SPACE, NONE]);
				inline bindKeys(Control.N5, [H, NONE]);
				inline bindKeys(Control.N6, [J, NONE]);
				inline bindKeys(Control.N7, [K, NONE]);
				inline bindKeys(Control.N8, [L, NONE]);
		
				inline bindKeys(Control.T0, [A, NONE]);
				inline bindKeys(Control.T1, [S, NONE]);
				inline bindKeys(Control.T2, [D, NONE]);
				inline bindKeys(Control.T3, [F, NONE]);
				inline bindKeys(Control.T4, [C, NONE]);
				inline bindKeys(Control.T5, [V, NONE]);
				inline bindKeys(Control.T6, [B, NONE]);
				inline bindKeys(Control.T7, [N, NONE]);
				inline bindKeys(Control.T8, [J, NONE]);
				inline bindKeys(Control.T9, [K, NONE]);
				inline bindKeys(Control.T10, [L, NONE]);
				inline bindKeys(Control.T11, [SEMICOLON, NONE]);
			case Duo(false):
				inline bindKeys(Control.KEY5, [SPACE, SHIFT]);

			case Duo(true):
				inline bindKeys(Control.UP, [W, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [S, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [A, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [D, FlxKey.RIGHT]);
				inline bindKeys(Control.ACCEPT, [SPACE, ENTER]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [SPACE, SHIFT]);
				inline bindKeys(Control.CENTER, [SPACE, SHIFT]);
				inline bindKeys(Control.L1, [A, NONE]);
				inline bindKeys(Control.U1, [S, NONE]);
				inline bindKeys(Control.R1, [D, NONE]);
				inline bindKeys(Control.L2, [FlxKey.LEFT, NONE]);
				inline bindKeys(Control.D1, [FlxKey.DOWN, NONE]);
				inline bindKeys(Control.R2, [FlxKey.RIGHT, NONE]);

				inline bindKeys(Control.A0, [S, NONE]);
				inline bindKeys(Control.A1, [D, NONE]);
				inline bindKeys(Control.A2, [F, NONE]);
				inline bindKeys(Control.A3, [SPACE, NONE]);
				inline bindKeys(Control.A4, [J, NONE]);
				inline bindKeys(Control.A5, [K, NONE]);
				inline bindKeys(Control.A6, [L, NONE]);
		
				inline bindKeys(Control.N0, [A, NONE]);
				inline bindKeys(Control.N1, [S, NONE]);
				inline bindKeys(Control.N2, [D, NONE]);
				inline bindKeys(Control.N3, [F, NONE]);
				inline bindKeys(Control.N4, [SPACE, NONE]);
				inline bindKeys(Control.N5, [H, NONE]);
				inline bindKeys(Control.N6, [J, NONE]);
				inline bindKeys(Control.N7, [K, NONE]);
				inline bindKeys(Control.N8, [L, NONE]);
		
				inline bindKeys(Control.T0, [A, NONE]);
				inline bindKeys(Control.T1, [S, NONE]);
				inline bindKeys(Control.T2, [D, NONE]);
				inline bindKeys(Control.T3, [F, NONE]);
				inline bindKeys(Control.T4, [C, NONE]);
				inline bindKeys(Control.T5, [V, NONE]);
				inline bindKeys(Control.T6, [B, NONE]);
				inline bindKeys(Control.T7, [N, NONE]);
				inline bindKeys(Control.T8, [J, NONE]);
				inline bindKeys(Control.T9, [K, NONE]);
				inline bindKeys(Control.T10, [L, NONE]);
				inline bindKeys(Control.T11, [SEMICOLON, NONE]);
			case None: // nothing
			case Custom:
				inline bindKeys(Control.UP, KeybindPrefs.keybinds.get('up'));
				inline bindKeys(Control.DOWN, KeybindPrefs.keybinds.get('down'));
				inline bindKeys(Control.LEFT, KeybindPrefs.keybinds.get('left'));
				inline bindKeys(Control.RIGHT, KeybindPrefs.keybinds.get('right'));
				inline bindKeys(Control.ACCEPT, [SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, KeybindPrefs.keybinds.get('reset'));
				inline bindKeys(Control.KEY5, KeybindPrefs.keybinds.get('key5'));
				inline bindKeys(Control.CENTER, KeybindPrefs.keybinds.get('center'));
				inline bindKeys(Control.L1, KeybindPrefs.keybinds.get('lefta1'));
				inline bindKeys(Control.U1, KeybindPrefs.keybinds.get('upa'));
				inline bindKeys(Control.R1, KeybindPrefs.keybinds.get('righta1'));
				inline bindKeys(Control.L2, KeybindPrefs.keybinds.get('lefta2'));
				inline bindKeys(Control.D1, KeybindPrefs.keybinds.get('downa'));
				inline bindKeys(Control.R2, KeybindPrefs.keybinds.get('righta2'));

				inline bindKeys(Control.A0, KeybindPrefs.keybinds.get('lefta1'));
				inline bindKeys(Control.A1, KeybindPrefs.keybinds.get('upa'));
				inline bindKeys(Control.A2, KeybindPrefs.keybinds.get('righta1'));
				inline bindKeys(Control.A3, KeybindPrefs.keybinds.get('centera'));
				inline bindKeys(Control.A4, KeybindPrefs.keybinds.get('lefta2'));
				inline bindKeys(Control.A5, KeybindPrefs.keybinds.get('downa'));
				inline bindKeys(Control.A6, KeybindPrefs.keybinds.get('righta2'));
		
				inline bindKeys(Control.N0, KeybindPrefs.keybinds.get('leftb1'));
				inline bindKeys(Control.N1, KeybindPrefs.keybinds.get('downb1'));
				inline bindKeys(Control.N2, KeybindPrefs.keybinds.get('upb1'));
				inline bindKeys(Control.N3, KeybindPrefs.keybinds.get('rightb1'));
				inline bindKeys(Control.N4, KeybindPrefs.keybinds.get('centerb'));
				inline bindKeys(Control.N5, KeybindPrefs.keybinds.get('leftb2'));
				inline bindKeys(Control.N6, KeybindPrefs.keybinds.get('downb2'));
				inline bindKeys(Control.N7, KeybindPrefs.keybinds.get('upb2'));
				inline bindKeys(Control.N8, KeybindPrefs.keybinds.get('rightb2'));
		
				inline bindKeys(Control.T0, KeybindPrefs.keybinds.get('leftc1'));
				inline bindKeys(Control.T1, KeybindPrefs.keybinds.get('downc1'));
				inline bindKeys(Control.T2, KeybindPrefs.keybinds.get('upc1'));
				inline bindKeys(Control.T3, KeybindPrefs.keybinds.get('rightc1'));
				inline bindKeys(Control.T4, KeybindPrefs.keybinds.get('leftc2'));
				inline bindKeys(Control.T5, KeybindPrefs.keybinds.get('downc2'));
				inline bindKeys(Control.T6, KeybindPrefs.keybinds.get('upc2'));
				inline bindKeys(Control.T7, KeybindPrefs.keybinds.get('rightc2'));
				inline bindKeys(Control.T8, KeybindPrefs.keybinds.get('leftc3'));
				inline bindKeys(Control.T9, KeybindPrefs.keybinds.get('downc3'));
				inline bindKeys(Control.T10, KeybindPrefs.keybinds.get('upc3'));
				inline bindKeys(Control.T11, KeybindPrefs.keybinds.get('rightc3'));
			case Askl:
				inline bindKeys(Control.UP, [K, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [S, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [A, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [L, FlxKey.RIGHT]);
				inline bindKeys(Control.ACCEPT, [SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [SPACE, SHIFT]);
				inline bindKeys(Control.CENTER, [SPACE, SHIFT]);
				inline bindKeys(Control.L1, [S, NONE]);
				inline bindKeys(Control.U1, [D, NONE]);
				inline bindKeys(Control.R1, [F, NONE]);
				inline bindKeys(Control.L2, [J, NONE]);
				inline bindKeys(Control.D1, [K, NONE]);
				inline bindKeys(Control.R2, [L, NONE]);

				inline bindKeys(Control.A0, [S, NONE]);
				inline bindKeys(Control.A1, [D, NONE]);
				inline bindKeys(Control.A2, [F, NONE]);
				inline bindKeys(Control.A3, [SPACE, NONE]);
				inline bindKeys(Control.A4, [J, NONE]);
				inline bindKeys(Control.A5, [K, NONE]);
				inline bindKeys(Control.A6, [L, NONE]);
		
				inline bindKeys(Control.N0, [A, NONE]);
				inline bindKeys(Control.N1, [S, NONE]);
				inline bindKeys(Control.N2, [D, NONE]);
				inline bindKeys(Control.N3, [F, NONE]);
				inline bindKeys(Control.N4, [SPACE, NONE]);
				inline bindKeys(Control.N5, [H, NONE]);
				inline bindKeys(Control.N6, [J, NONE]);
				inline bindKeys(Control.N7, [K, NONE]);
				inline bindKeys(Control.N8, [L, NONE]);
		
				inline bindKeys(Control.T0, [A, NONE]);
				inline bindKeys(Control.T1, [S, NONE]);
				inline bindKeys(Control.T2, [D, NONE]);
				inline bindKeys(Control.T3, [F, NONE]);
				inline bindKeys(Control.T4, [C, NONE]);
				inline bindKeys(Control.T5, [V, NONE]);
				inline bindKeys(Control.T6, [B, NONE]);
				inline bindKeys(Control.T7, [N, NONE]);
				inline bindKeys(Control.T8, [J, NONE]);
				inline bindKeys(Control.T9, [K, NONE]);
				inline bindKeys(Control.T10, [L, NONE]);
				inline bindKeys(Control.T11, [SEMICOLON, NONE]);
			case ZxCommaDot:
				inline bindKeys(Control.UP, [FlxKey.COMMA, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [X, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [Z, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [FlxKey.PERIOD, FlxKey.RIGHT]);
				inline bindKeys(Control.ACCEPT, [SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [SPACE, SHIFT]);
				inline bindKeys(Control.CENTER, [SPACE, SHIFT]);
				inline bindKeys(Control.L1, [S, NONE]);
				inline bindKeys(Control.U1, [D, NONE]);
				inline bindKeys(Control.R1, [F, NONE]);
				inline bindKeys(Control.L2, [J, NONE]);
				inline bindKeys(Control.D1, [K, NONE]);
				inline bindKeys(Control.R2, [L, NONE]);

				inline bindKeys(Control.A0, [S, NONE]);
				inline bindKeys(Control.A1, [D, NONE]);
				inline bindKeys(Control.A2, [F, NONE]);
				inline bindKeys(Control.A3, [SPACE, NONE]);
				inline bindKeys(Control.A4, [J, NONE]);
				inline bindKeys(Control.A5, [K, NONE]);
				inline bindKeys(Control.A6, [L, NONE]);
		
				inline bindKeys(Control.N0, [A, NONE]);
				inline bindKeys(Control.N1, [S, NONE]);
				inline bindKeys(Control.N2, [D, NONE]);
				inline bindKeys(Control.N3, [F, NONE]);
				inline bindKeys(Control.N4, [SPACE, NONE]);
				inline bindKeys(Control.N5, [H, NONE]);
				inline bindKeys(Control.N6, [J, NONE]);
				inline bindKeys(Control.N7, [K, NONE]);
				inline bindKeys(Control.N8, [L, NONE]);
		
				inline bindKeys(Control.T0, [A, NONE]);
				inline bindKeys(Control.T1, [S, NONE]);
				inline bindKeys(Control.T2, [D, NONE]);
				inline bindKeys(Control.T3, [F, NONE]);
				inline bindKeys(Control.T4, [C, NONE]);
				inline bindKeys(Control.T5, [V, NONE]);
				inline bindKeys(Control.T6, [B, NONE]);
				inline bindKeys(Control.T7, [N, NONE]);
				inline bindKeys(Control.T8, [J, NONE]);
				inline bindKeys(Control.T9, [K, NONE]);
				inline bindKeys(Control.T10, [L, NONE]);
				inline bindKeys(Control.T11, [SEMICOLON, NONE]);
		}
	}
	public static function stringControlToControl(control:String):Control
	{
		switch (control)
		{
			case 'left' | 'left-press' | "left-release":
				return Control.LEFT;
			case 'down' | 'down-press' | 'down-release':
				return Control.DOWN;
			case 'up' | 'up-press' | 'up-release':
				return Control.UP;
			case 'right' | 'right-press' | 'right-release':
				return Control.RIGHT;
			case 'accept':
				return Control.ACCEPT;
			case 'back':
				return Control.BACK;
			case 'reset':
				return Control.RESET;
			case 'cheat':
				return Control.CHEAT;
			case 'pause':
				return Control.PAUSE;
			case 'key5':
				return Control.KEY5;
			case 'center' | 'center-press' | 'center-release':
				return Control.CENTER;
			case 'lefta1':
				return Control.L1;
			case 'upa':
				return Control.U1;
			case 'righta1':
				return Control.R1;
			case 'centera':
				return Control.A3;
			case 'lefta2':
				return Control.L2;
			case 'downa':
				return Control.D1;
			case 'righta2':
				return Control.R2;
			case 'leftb1':
				return Control.N0;
			case 'downb1':
				return Control.N1;
			case 'upb1':
				return Control.N2;
			case 'rightb1':
				return Control.N3;
			case 'centerb':
				return Control.N4;
			case 'leftb2':
				return Control.N5;
			case 'downb2':
				return Control.N6;
			case 'upb2':
				return Control.N7;
			case 'rightb2':
				return Control.N8;
			case 'leftc1':
				return Control.T0;
			case 'downc1':
				return Control.T1;
			case 'upc1':
				return Control.T2;
			case 'rightc1':
				return Control.T3;
			case 'leftc2':
				return Control.T4;
			case 'downc2':
				return Control.T5;
			case 'upc2':
				return Control.T6;
			case 'rightc2':
				return Control.T7;
			case 'leftc3':
				return Control.T8;
			case 'downc3':
				return Control.T9;
			case 'upc3':
				return Control.T10;
			case 'rightc3':
				return Control.T11;
			default:
				return null;
		}
	}

	function removeKeyboard()
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == KEYBOARD)
					action.remove(input);
			}
		}
	}

	public function addGamepad(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
	{
		gamepadsAdded.push(id);
		
		#if (haxe >= "4.0.0")
		for (control => buttons in buttonMap)
			inline bindButtons(control, id, buttons);
		#else
		for (control in buttonMap.keys())
			bindButtons(control, id, buttonMap[control]);
		#end
	}

	inline function addGamepadLiteral(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
	{
		gamepadsAdded.push(id);

		#if (haxe >= "4.0.0")
		for (control => buttons in buttonMap)
			inline bindButtons(control, id, buttons);
		#else
		for (control in buttonMap.keys())
			bindButtons(control, id, buttonMap[control]);
		#end
	}

	public function removeGamepad(deviceID:Int = FlxInputDeviceID.ALL):Void
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID))
					action.remove(input);
			}
		}

		gamepadsAdded.remove(deviceID);
	}

	public function addDefaultGamepad(id):Void
	{
		#if !switch
		addGamepadLiteral(id, [
			Control.ACCEPT => [A],
			Control.BACK => [B],
			Control.KEY5 => [LEFT_STICK_CLICK],
			Control.CENTER => [LEFT_STICK_CLICK],
			Control.UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP],
			Control.DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN],
			Control.LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT],
			Control.RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT],
			Control.PAUSE => [START],
			Control.RESET => [Y]
		]);
		#else
		addGamepadLiteral(id, [
			//Swap A and B for switch
			Control.ACCEPT => [B],
			Control.BACK => [A],
			Control.UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP],
			Control.DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN],
			Control.LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT],
			Control.RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT],
			Control.PAUSE => [START],
			//Swap Y and X for switch
			Control.RESET => [Y],
			Control.CHEAT => [X]
		]);
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function bindButtons(control:Control, id, buttons)
	{
		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, state) -> addButtons(action, buttons, state, id));
		#else
		forEachBound(control, function(action, state) addButtons(action, buttons, state, id));
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function unbindButtons(control:Control, gamepadID:Int, buttons)
	{
		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, _) -> removeButtons(action, gamepadID, buttons));
		#else
		forEachBound(control, function(action, _) removeButtons(action, gamepadID, buttons));
		#end
	}

	inline static function addButtons(action:FlxActionDigital, buttons:Array<FlxGamepadInputID>, state, id)
	{
		for (button in buttons)
			action.addGamepad(button, state, id);
	}

	static function removeButtons(action:FlxActionDigital, gamepadID:Int, buttons:Array<FlxGamepadInputID>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (isGamepad(input, gamepadID) && buttons.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function getInputsFor(control:Control, device:Device, ?list:Array<Int>):Array<Int>
	{
		if (list == null)
			list = [];

		switch (device)
		{
			case Keys:
				for (input in getActionFromControl(control).inputs)
				{
					if (input.device == KEYBOARD)
						list.push(input.inputID);
				}
			case Gamepad(id):
				for (input in getActionFromControl(control).inputs)
				{
					if (input.deviceID == id)
						list.push(input.inputID);
				}
		}
		return list;
	}

	public function removeDevice(device:Device)
	{
		switch (device)
		{
			case Keys:
				setKeyboardScheme(None);
			case Gamepad(id):
				removeGamepad(id);
		}
	}

	static function isDevice(input:FlxActionInput, device:Device)
	{
		return switch device
		{
			case Keys: input.device == KEYBOARD;
			case Gamepad(id): isGamepad(input, id);
		}
	}

	inline static function isGamepad(input:FlxActionInput, deviceID:Int)
	{
		return input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID);
	}
}
