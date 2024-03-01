event_inherited();

isPlayer = true;

//Player State.
enum PS 
{
	main
}

state = PS.main;

spd = 2;

gunInstance = instance_create_depth(x, y, depth - 10, obj_gun);
gunInstance.ownerInstance = id;
