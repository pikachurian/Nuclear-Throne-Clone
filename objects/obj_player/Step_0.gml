switch(state)
{
	case PS.main:
		hspd = GetInput(INPUT.horizontalAxis) * spd;
		vspd = GetInput(INPUT.verticalAxis) * spd;
		MoveAndSlide();
		gunInstance.PointToPosition(mouse_x, mouse_y);
		break;
}