//Tile Type.
enum TILE
{
	floor,
	wall,
	empty,
	enemy
}

//Mover Direction.
enum DIR
{
	up,
	down,
	left,
	right
}

tileSize = 16;
gridWidth = floor(room_width / tileSize);
gridHeight = floor(room_height / tileSize);

//The percentage of the grid to fill with floors.
percentFill = 0.2;

turnChance = 0.4;
spawnMoverChance = 0.2;
maxMovers = 7;
deleteMoverChance = 0.2;
spawnEnemyChance = 0.1;//0.4;
maxEnemies = 12;
enemyCount = 12;

playerSpawnX = 0;
playerSpawnY = 0;

grid = [];

movers = ds_list_create();

//Creates a mover.  A mover is used to spawn tiles and other movers.
function Mover(_x, _y, _directionEnum) constructor
{
	x = _x;
	y = _y;
	dirEnum = _directionEnum;
	
	Move = function()
	{
		switch(dirEnum)
		{
			case DIR.up: y -= 1; break;
			case DIR.down: y += 1; break;
			case DIR.left: x -= 1; break;
			case DIR.right: x += 1; break;
		}
		
		//Clamp to grid and leave a 1 tile border for walls.
		x = clamp(x, 1, obj_level_generator.gridWidth - 3);
		y = clamp(y, 1, obj_level_generator.gridHeight - 3);
	}
}

function RandomDirection()
{
	return irandom(3);
}
	
function SetupGrid()
{
	//Create grid.
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
			grid[_i][_j] = TILE.empty;
}

function FloorCount()
{
	var _count = 0;
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
			if(grid[_i][_j] == TILE.floor)
				_count += 1;
				
	return _count;
}

function GetFloorPositionsList()
{
	var _floorPositions = ds_list_create();
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
			if(grid[_i][_j] == TILE.floor)
			{
				var _position = 
				{
					x : _i,
					y : _j
				}
				ds_list_add(_floorPositions, _position);
			}
				
	return _floorPositions;
}

function EnemyCount()
{
	var _count = 0;
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
			if(grid[_i][_j] == TILE.enemy)
				_count += 1;
				
	return _count;
}

function SpawnMover(_x, _y)
{
	ds_list_add(movers, new Mover(_x, _y, RandomDirection()));
}

function GenerateLevel()
{
	SetupGrid();
	
	playerSpawnX = round(gridWidth / 2);
	playerSpawnY = round(gridHeight / 2);

	//ds_list_add(movers, new Mover(round(gridWidth / 2), round(gridHeight / 2), RandomDirection()));
	SpawnMover(playerSpawnX, playerSpawnY);
	
	playerSpawnX *= tileSize;
	playerSpawnY *= tileSize;

	var _tick = 0;

	do
	{
		
		for(var _i = 0; _i < ds_list_size(movers); _i ++)
		{
			var _mover = movers[|_i];
		
			//Place tile or enemy.
			grid[_mover.x][_mover.y] = TILE.floor;
			if(EnemyCount() < maxEnemies) && (_tick > 100)
			{
				if(random(1) <= spawnEnemyChance)
					grid[_mover.x][_mover.y] = TILE.enemy;
			}
		
			if(random(1) <= turnChance)
				_mover.dirEnum = RandomDirection();
			
			if(random(1) <= spawnMoverChance)
				SpawnMover(_mover.x, _mover.y);
			
			if(random(1) <= deleteMoverChance) && (ds_list_size(movers) > 1)
			{
				ds_list_delete(movers, _i);
				break;
			}
			
			_mover.Move();
			
		}
		
		show_debug_message("A");
	
		//Exit loop if a certain percentage of the grid is filled.
		if(FloorCount() / (gridWidth * gridHeight) >= percentFill)
			break;
	
		_tick += 1;
	}until (_tick > 10000);

	//Spawn. floors.
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
		{
			if(grid[_i][_j] == TILE.floor) ||
			(grid[_i][_j] == TILE.enemy)
			{
				var _x = _i * tileSize;
				var _y = _j * tileSize;
				instance_create_layer(_x, _y, "Floor", obj_floor_tile);
			}
		}
		
	//Place walls.
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
		{
			if(grid[_i][_j] == TILE.floor) ||
			(grid[_i][_j] == TILE.enemy)
			{
				//Check up.
				if(grid[_i][_j - 1] == TILE.empty){grid[_i][_j - 1] = TILE.wall};
			
				//Check down.
				if(grid[_i][_j + 1] == TILE.empty){grid[_i][_j + 1] = TILE.wall};
			
				//Check left.
				if(grid[_i - 1][_j] == TILE.empty){grid[_i - 1][_j] = TILE.wall};
			
				//Check right.
				if(grid[_i + 1][_j] == TILE.empty){grid[_i + 1][_j] = TILE.wall};
			}
		}
		
	//Spawn walls.
	for(var _i = 0; _i < gridWidth; _i ++)
		for(var _j = 0; _j < gridHeight; _j ++)
		{
			if(grid[_i][_j] == TILE.wall)
			{
				var _wall = instance_create_depth(_i * tileSize, _j * tileSize, depth, obj_wall_tile);
				if(grid[_i][_j + 1] == TILE.wall)
					_wall.sprite_index = spr_wall_tile_top;
			}
		}
		
	//Spawn Player.
	instance_create_depth(playerSpawnX, playerSpawnY, depth - 10, obj_player);
	
	//Spawn enemies.
	var _floors = GetFloorPositionsList();
	ds_list_shuffle(_floors);
	//show_debug_message(_floors[|0]);
	var _loops = min(enemyCount, FloorCount());
	for(var _i = 0; _i < _loops; _i ++)
	{
		var _spawnX = _floors[|_i].x * tileSize;
		var _spawnY = _floors[|_i].y * tileSize;
		instance_create_depth(_spawnX, _spawnY, depth - 10, obj_enemy);
	}
	ds_list_destroy(_floors);
}