///@description Checks if you pressed a key, but will only activate once per step
global.pressedThisStep = false; ///@is {bool}

function keyboard_check_pressed_once(keyChar/*: string*/){
	if (keyboard_check_pressed(ord(keyChar)) && global.pressedThisStep == false) {
		global.pressedThisStep = true;
		return true;
	}
	return false;
}