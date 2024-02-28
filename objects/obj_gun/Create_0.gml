ownerInstance = noone;

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
	direction = image_angle;
	if(image_angle > 90 && image_angle < 270)
		image_yscale = -1;
	else
		image_yscale = 1;
}