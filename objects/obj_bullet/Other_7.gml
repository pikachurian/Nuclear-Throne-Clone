if(sprite_index == explodeSprite)
{
	instance_destroy();
}else
{
	image_speed = 0;
	image_index = image_number - 1;
}