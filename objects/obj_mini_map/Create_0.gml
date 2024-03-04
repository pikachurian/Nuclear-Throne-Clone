function DrawMiniMap()
{
	draw_set_alpha(0.5);
	
	var _mapX = camera_get_view_x(view_camera[0]) + 1;
	var _mapY = camera_get_view_y(view_camera[0]) + 1;
	
	var _tileDrawSize = 2;

	for(var _i = 0; _i < obj_level_generator.gridWidth; _i ++)
	{
		for(var _j = 0; _j < obj_level_generator.gridHeight; _j ++)
		{
			if(obj_level_generator.grid[_i][_j] == TILE.floor)
			{
				var _x1 = _mapX + (_i * _tileDrawSize);
				var _y1 = _mapY + (_j * _tileDrawSize);
				var _x2 = _x1 + _tileDrawSize * 0.5;
				var _y2 = _y1 + _tileDrawSize * 0.5;
				draw_set_color(c_gray);
				//draw_circle(_x + _i * 1, _y + _j * 1, 2, false);
				draw_rectangle(_x1, _y1, _x2, _y2, false);
			}
		}
		
	}
	
	//Draw player.
	var _playerX1 = _mapX + ((obj_player.x / obj_level_generator.tileSize) * _tileDrawSize);
	var _playerY1 = _mapY + ((obj_player.y / obj_level_generator.tileSize) * _tileDrawSize);
	var _playerX2 = _playerX1 + _tileDrawSize * 0.5;
	var _playerY2 = _playerY1 + _tileDrawSize * 0.5;
	draw_set_color(c_green);
	draw_rectangle(_playerX1, _playerY1, _playerX2, _playerY2, false);
	
	draw_set_alpha(1);
}