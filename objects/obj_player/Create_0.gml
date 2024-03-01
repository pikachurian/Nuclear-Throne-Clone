event_inherited();

isPlayer = true;

hpMax = 100;
hp = hpMax;

bulletDamage = 10;
bulletSpeed = 4;//5;

walkSprite = spr_player_walk;
idleSprite = spr_player_idle;
hurtSprite = spr_player_hurt;
deadSprite = spr_player_dead;

//Player State.
enum PS 
{
	main
}

state = PS.main;

spd = 2;

gunInstance = instance_create_depth(x, y, depth - 10, obj_gun);
gunInstance.ownerInstance = id;

function UpdateSprite()
{
	//Face mouse.
	image_xscale = 1;
	if(mouse_x < x)
		image_xscale = -1;
		
	sprite_index = idleSprite;
	if(hspd != 0) || (vspd != 0)
		sprite_index = walkSprite;
}