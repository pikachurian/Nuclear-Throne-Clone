ownerInstance = noone;
bulletTarget = BT.enemy;

dir = 0;

function MoveToOwner()
{
	if(ownerInstance != noone)
	{
		x = lerp(x, ownerInstance.x, 0.5);
		y = lerp(y, ownerInstance.y, 0.5);
	}
}

function PointToPosition(_x, _y)
{
	image_angle = point_direction(x, y, _x, _y);
	dir = image_angle;
	if(image_angle > 90 && image_angle < 270)
		image_yscale = -1;
	else
		image_yscale = 1;
}

function Shoot(_bulletTarget, _speed, _direction, _damage)
{
	var _offset = 24;
	var _spawnX = x + lengthdir_x(_offset, image_angle);
	var _spawnY = y + lengthdir_y(_offset, image_angle);
	
	var _bullet = instance_create_depth(_spawnX, _spawnY, depth + 5, obj_bullet);
	_bullet.SetDirection(_direction);
	_bullet.spd = _speed;
	_bullet.damage = _damage;
	_bullet.bulletTarget = _bulletTarget;
	
	_bullet.bulletSprite = spr_player_bullet;
	if(_bulletTarget == BT.player)
		_bullet.bulletSprite = spr_enemy_bullet;
	
	_bullet.sprite_index = _bullet.bulletSprite;
	
	return _bullet;
}