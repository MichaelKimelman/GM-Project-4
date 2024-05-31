/// @description Insert description here
// You can write your code in this editor

//event_inherited();
if(!global.gamePaused)
{
	if(markedForDestruction)
	{
		instance_destroy();
	}
	//if(place_meeting(x, y, oPlayer))
	//{
		var _player = instance_place(x, y, oPlayer);
		if(_player != noone)
		{
			if(script_get_name(_player.entityScript[ABILITY.ONE]) != "AbilityOne")
			{
				_player.abilityScript[ABILITY.ONE] = AbilityOne;
				markedForDestruction = true;
			}
		}
	//}
}