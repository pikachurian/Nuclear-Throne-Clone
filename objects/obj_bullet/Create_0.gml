//Bullet Target.
enum BT 
{
	player,
	enemy
}

bulletTarget = BT.enemy;
bulletSprite = spr_player_bullet;
wallCollisionSprite = spr_bullet_wall_collision;
explodeSprite = spr_enemy_bullet_explode;

dir = 0;
spd = 4;
damage = 10;

canHurt = true;

function UpdateMovement()
{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}

function SetDirection(_dir)
{
	dir = _dir;
	image_angle = dir;
}

function Destroy()
{
	image_index = 0;
	image_speed = 1;
	canHurt = false;
	sprite_index = explodeSprite;
}