isPlayer = false;

hspd = 0;
vspd = 0;

hpMax = 30;
hp = 30;

//Move using hspd and vspd.
function MoveAndSlide()
{
	//X collisions.
	if(place_meeting(x + hspd, y, obj_wall))
	{
		while(!place_meeting(x + sign(hspd), y, obj_wall))
			x += sign(hspd);
			
		hspd = 0;
	}
	
	x += hspd;
	
	//Y collisions.
	if(place_meeting(x, y + vspd, obj_wall))
	{
		while(!place_meeting(x, y + sign(vspd), obj_wall))
			y += sign(vspd);
			
		vspd = 0;
	}
	
	y += vspd;
}

function TakeDamage(_amount)
{
	hp -= _amount;
}

function CheckBulletHit()
{
	var _bulletHit = instance_place(x, y, obj_bullet);
	
	if(_bulletHit != noone)
	{
		//Take damage.
		TakeDamage(_bulletHit.damage);
		
		instance_destroy(_bulletHit);
	}
}