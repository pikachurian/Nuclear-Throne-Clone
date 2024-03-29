event_inherited();

switch(state)
{
	case PS.main:
		hspd = GetInput(INPUT.horizontalAxis) * spd;
		vspd = GetInput(INPUT.verticalAxis) * spd;
		MoveAndSlide();
		CheckBulletHit();
		gunInstance.PointToPosition(mouse_x, mouse_y);
		UpdateForce();
		
		//Shooting.
		if(GetInput(INPUT.shoot))
		{
			gunInstance.Shoot(BT.enemy, bulletSpeed, gunInstance.dir, bulletDamage);
			obj_cam.Shake(10);
			audio_play_sound(sfx_shoot, 12, false);
		}
			
		UpdateSprite();
		break;
}