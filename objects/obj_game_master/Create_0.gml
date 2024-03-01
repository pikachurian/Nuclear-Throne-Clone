//Game State.
enum GS 
{
	setup,
	main
}

state = GS.setup;

function ChangeState(_state)
{
	state = _state;
}