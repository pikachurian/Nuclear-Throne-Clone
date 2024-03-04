isPlayer = false;

hspd = 0;
vspd = 0;

hpMax = 30;
hp = 30;

addedForceX = 0;
addedForceY = 0;
fric = 0.9;

//Move using hspd and vspd.
function MoveAndSlide()
{
	//X collisions.
	if(place_meeting(x + hspd, y, obj_wall))
	{
		while(!place_meeting(x + sign(hspd), y, obj_wall))
			x += sign(hspd);
			
		hspd = 0;
		addedForceX = 0;
	}
	
	x += hspd;
	
	//Y collisions.
	if(place_meeting(x, y + vspd, obj_wall))
	{
		while(!place_meeting(x, y + sign(vspd), obj_wall))
			y += sign(vspd);
			
		vspd = 0;
		addedForceY = 0;
	}
	
	y += vspd;
}

function UpdateForce()
{
	hspd += addedForceX;
	vspd += addedForceY;
	MoveAndSlide();
	addedForceX *= fric;
	addedForceY *= fric;
}

function TakeDamage(_amount)
{
	hp -= _amount;
	
	if(hp <= 0)
		Die();
}

function Die()
{
	instance_destroy();
}

function CheckBulletHit()
{
	var _bullets = ds_list_create();
	var _bulletsCount = instance_place_list(x, y, obj_bullet, _bullets, false);
	
	
	if(_bulletsCount > 0)
	{
		for(var _i = 0; _i < _bulletsCount; _i ++)
		{
			//Check bullet target against isPlayer.
			if(isPlayer) && (_bullets[|_i].bulletTarget == BT.player) ||
			(!isPlayer) && (_bullets[|_i].bulletTarget == BT.enemy)
			{
				if(_bullets[|_i].canHurt)
				{
					//Take damage.
					TakeDamage(_bullets[|_i].damage);
		
					_bullets[|_i].Destroy();
				
					break;
				}
			}
		}
	}
}

function AddForce(_x, _y)
{
	addedForceX = _x;
	addedForceY = _y;
}