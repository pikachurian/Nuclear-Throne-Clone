if(instance_exists(target))
{
	var _targetX = x;
	var _targetY = y;
	
	if(target == obj_player)
	{
		var _length = point_distance(target.x, target.y, mouse_x, mouse_y) * 0.25;
		var _direction = point_direction(target.x, target.y, mouse_x, mouse_y);
		
		_targetX = target.x + lengthdir_x(_length, _direction);
		_targetY = target.y + lengthdir_y(_length, _direction);
		
		_targetX -= viewWidth / 2;
		_targetY -= viewHeight / 2;
	}else
	{		
		_targetX = target.x - viewWidth / 2;
		_targetY = target.y - viewHeight / 2;
	}
	
	x = lerp(x, _targetX, 0.2);
	y = lerp(y, _targetY, 0.2);
	
	x = round(x);
	y = round(y);
}

camera_set_view_pos(view_camera[0], x, y);
