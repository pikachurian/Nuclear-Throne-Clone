if(canHurt)
{
	UpdateMovement();

	//Wall collision.
	var _imageIndex = image_index;
	sprite_index = wallCollisionSprite;
	if(place_meeting(x, y, obj_wall))
		Destroy();
	else
	{
		sprite_index = bulletSprite;
		image_index = _imageIndex;
	}
}