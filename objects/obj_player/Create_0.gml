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
	main,
	dead
}

state = PS.main;

spd = 2;

gunInstance = instance_create_depth(x, y, depth - 10, obj_gun);
gunInstance.ownerInstance = id;

function UpdateSprite()
{
	if(sprite_index == hurtSprite) ||
	(sprite_index == deadSprite)
		return;
		
	//Face mouse.
	image_xscale = 1;
	if(mouse_x < x)
		image_xscale = -1;
		
	sprite_index = idleSprite;
	if(hspd != 0) || (vspd != 0)
		sprite_index = walkSprite;
}

function TakeDamage(_amount)
{
	if(state != PS.dead)
	{
		audio_play_sound(sfx_player_hurt, 8, false);
		
		sprite_index = hurtSprite;
	
		hp -= _amount;
	
		if(hp <= 0)
			Die();
	}
}


function Die()
{
	ChangeState(PS.dead);
	sprite_index = deadSprite;
	
	instance_create_depth(x, y, depth, obj_game_over);
}

function ChangeState(_state)
{
	state = _state;
}