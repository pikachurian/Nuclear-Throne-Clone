function DrawMiniMap()
{
	draw_set_alpha(1);
	
	var _x = camera_get_view_x(view_camera[0]) + 4;
	var _y = camera_get_view_y(view_camera[0]) + 4;
	
	var _tileDrawSize = 2;

	for(var _i = 0; _i < obj_level_generator.gridWidth; _i ++)
	{
		for(var _j = 0; _j < obj_level_generator.gridHeight; _j ++)
		{
			if(obj_level_generator.grid[_i][_j] == TILE.floor)
			{
				draw_set_color(c_gray);
				draw_circle(_x + _i * 1, _y + _j * 1, 2, false);
			}
		}
		
	}
	
	draw_set_alpha(1);
}