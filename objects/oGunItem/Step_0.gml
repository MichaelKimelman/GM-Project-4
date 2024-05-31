/// @description Insert description here
// You can write your code in this editor






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
			ds_list_add(global.playerInventory, item);
			markedForDestruction = true;
			
		}
	//}
}