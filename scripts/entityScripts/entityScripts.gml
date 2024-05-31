// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information




///
///BASE STATE NO CODE RUN
///
function baseState()
{
	if(instance_exists(oPlayer) && oPlayer.state != STATE.DEAD)
	{
		target = oPlayer.id;
		//CHANGE STATE TO MOVE
		
		if(entityScript[STATE.MOVETOTARGET] != -1)
		{
			state = STATE.MOVETOTARGET;
		}
	}
	else if(!instance_exists(target))/////FIXA
	{
		if(target != noone)
		{
			target = noone;
		}

		if(point_distance(x, y, xstart, ystart) > 20)
		{
			state = STATE.RETURN;
		}
	}
	
	if(hp <= 0)
	{
		instance_destroy();
	}
}




///
///Knocked Down
///
function KnockedDown()
{
	//if(hp <= 0)
	//{
	//	instance_destroy();
	//}
	//if(stunCD == 0)
	//{
	//	stunCD = 60;
	//	moveDir = point_direction( xVariable, yVariable, x, y);
	//}
	
	if(stunCD != 0)
	{
		stunCD--;
		if(stunCD > 40)
		{
			x += lengthdir_x(2, moveDir);
			y += lengthdir_y(2, moveDir);
		}
		
	}
	
	if(stunCD == 0)
	{
		state = STATE.IDLE;
	}
}