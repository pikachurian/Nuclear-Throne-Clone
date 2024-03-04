if(sprite_index == part1Sprite)
{
	sprite_index = part2Sprite;
	audio_play_sound(sfx_shoot, 10, false);
}else
{
	image_speed = 0;
	image_index = image_number - 1;
}