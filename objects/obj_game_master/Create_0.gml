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

levelSong = audio_play_sound(sng_surfin_bird, 2, true);