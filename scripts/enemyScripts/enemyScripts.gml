// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyScripts(){

}




///
/// ENEMY MOVE
///
function EnemyMove()
{
	if(!instance_exists(target))
	{
		target = noone;
		state = STATE.IDLE;
	}
	
	if(target != noone && target != undefined)
	{
		if(instance_exists(target))
		{
			moveDir = point_direction(x, y, target.x, target.y);
			
			if(point_distance(x, y, target.x, target.y) <= 128)
			{
				stunCD = 20;
				state = STATE.ATTACK;
			}
		}
		
	}
	else
	{
		state = STATE.IDLE;
	}
	
	
	
	xSpd = lengthdir_x(moveSpd, moveDir);
	ySpd = lengthdir_y(moveSpd, moveDir);
	
	x += xSpd;
	y += ySpd;
	
	if(hp <= 0)
	{
		instance_destroy();
	}
}




///
/// ENEMY MOVE TO POSITION
///
function EnemyMovePosition()
{
	//if(oPlayer.state == STATE.DEAD)
	//{
	//	target = noone;
	//	state = STATE.IDLE;
	//}
	
	if(targetX != 0 && targetY != 0)
	{
		
		moveDir = point_direction(x, y, targetX, targetY);
		
		if(point_distance(x, y, targetX, targetY) < 10)
		{
			stunCD = 20;
			targetX = 0;
			targetY = 0;
			state = STATE.IDLE;
		}
		
	}
	else
	{
		state = STATE.IDLE;
	}
	
	
	
	xSpd = lengthdir_x(moveSpd, moveDir);
	ySpd = lengthdir_y(moveSpd, moveDir);
	
	x += xSpd;
	y += ySpd;
	
	if(hp <= 0)
	{
		instance_destroy();
	}
}




///
///ENEMY ATTACK 1
///
function EnemyAttackState()
{
	if(stunCD > 0)
	{
		stunCD--;
	}
	if(!attackInProgress && stunCD == 0)
	{
		if(target != noone && target != undefined)
		{
			if(instance_exists(target))
			{
				var attack = instance_create_layer(x, y, "Instances", oAttack1 );
				attack.image_angle = point_direction(x,y,target.x ,target.y);
				attack.creatorId = id;
				attackInProgress = true;
			}
		}
		else
		{
			state = STATE.RETURN;
		}
	}
}




///
///Cooldown After Enemy Attack
///
function EnemyCooldown()
{
	if(stunCD > 0)
	{
		stunCD--;
	}
	
	if(stunCD == 0)
	{
		state = STATE.IDLE;
	}
}




///
///RETURN TO START POSITION
///
function ReturnState()
{
	targetX = xstart;
	targetY = ystart;
	state = STATE.MOVETOPOSITION;
}