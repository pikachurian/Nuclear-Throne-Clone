part1Sprite = spr_game_over_part_1;
part2Sprite = spr_game_over_part_2;

sprite_index = part1Sprite;

audio_play_sound(sfx_shoot, 10, false);

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

image_xscale = 10;
image_yscale = 10;