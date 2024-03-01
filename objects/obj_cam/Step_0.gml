/// @description Insert description here
// You can write your code in this editor


if(!instance_exists(obj_player))
	exit;
x = obj_player.x - (camera_get_view_width(view_camera[0]) / 2);
y = obj_player.y - (camera_get_view_height(view_camera[0]) / 2);;

camera_set_view_pos(view_camera[0], x, y);
