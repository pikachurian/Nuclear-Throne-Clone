// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Input(){

}

enum INPUT
{
	left,
	right,
	up,
	down,
	horizontalAxis,
	verticalAxis,
	shoot
}

function GetInput(_inputEnum)
{
	var _input = 0;
	switch(_inputEnum)
	{
		case INPUT.left:
			_input = keyboard_check(ord("A"));
			break;
			
		case INPUT.right:
			_input = keyboard_check(ord("D"));
			break;
			
		case INPUT.up:
			_input = keyboard_check(ord("W"));
			break;
			
		case INPUT.down:
			_input = keyboard_check(ord("S"));
			break;
			
		case INPUT.horizontalAxis:
			_input = GetInput(INPUT.right) - GetInput(INPUT.left);
			break;
			
		case INPUT.verticalAxis:
			_input = GetInput(INPUT.down) - GetInput(INPUT.up);
			break;
			
		case INPUT.shoot:
			_input = mouse_check_button_pressed(mb_left);
			break;
	}
	
	return _input;
}