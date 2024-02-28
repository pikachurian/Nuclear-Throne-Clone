event_inherited();

//Enemy State.
enum ES 
{
	setRoamGoal,
	roam,
	wait,
	chasePlayer
}

state = ES.setRoamGoal;
spd = 1;

goalMinDistance = 64;//32;
goalMaxDistance = 176;//128;
goalX = x;
goalY = y;
setGoalAttempts = 0;
setGoalAttemptsMax = 10;

waitTick = 0;
waitTime = 1 * game_get_speed(gamespeed_fps);
waitTimeMin = 1 * game_get_speed(gamespeed_fps);
waitTimeMax = 2 * game_get_speed(gamespeed_fps);
waitNextState = ES.setRoamGoal;

lastX = x;
lastY = y;

stuckTick = 0;
stuckTime = 1 * game_get_speed(gamespeed_fps);

detectPlayerRange = 256;

//Create gun.
gunInstance = instance_create_depth(x, y, depth - 10, obj_gun);
gunInstance.ownerInstance = id;

function SetNewRandomGoal()
{
	var _goalX = x;
	var _goalY = y;
	
	for(var _i = 0; _i < 1; _i ++)
	{
		var _dist = random_range(goalMinDistance, goalMaxDistance);
		var _dir = random_range(0, 359);
		
		_goalX = x + lengthdir_x(_dist, _dir);
		_goalY = y + lengthdir_y(_dist, _dir);
		
		_goalX = clamp(_goalX, 0, room_width);
		_goalY = clamp(_goalY, 0, room_height);
		
		if(!place_meeting(_goalX, _goalY, obj_wall))
			break;
		else
		{
			_goalX = x;
			_goalY = y;
		}
	}
	
	goalX = _goalX;
	goalY = _goalY;
	
	stuckTick = 0;
}

function ChangeState(_state)
{
	switch(_state)
	{
		case ES.wait:
			//
			break;
	}
	
	state = _state;
}

function MoveTowardsPoint(_x, _y)
{
	mp_potential_step(_x, _y, spd, false);
}

function Wait(_nextState, _time)
{
	waitTime = _time;
	waitTick = 0;
	waitNextState = _nextState;
	ChangeState(ES.wait);
}

function DetectPlayer()
{
	if(point_distance(x, y, obj_player.x, obj_player.y) <= detectPlayerRange)
	{
		ChangeState(ES.chasePlayer);
	}
}