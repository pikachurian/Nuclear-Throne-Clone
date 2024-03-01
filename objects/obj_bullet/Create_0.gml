//Bullet Target.
enum BT 
{
	player,
	enemy
}

bulletTarget = BT.enemy;

dir = 0;
spd = 4;
damage = 10;

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