if(keyboard_check_pressed(vk_f4))
	window_set_fullscreen(!window_get_fullscreen());
	
if(keyboard_check_pressed(vk_alt))
{
	game_restart();
}

switch(state)
{
	case GS.setup:
		obj_level_generator.GenerateLevel();
		ChangeState(GS.main);
		break;
}