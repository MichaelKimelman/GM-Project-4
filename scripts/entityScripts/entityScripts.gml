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
	else if(oPlayer.state == STATE.DEAD)/////FIXA
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
/// ENEMY MOVE
///
function EnemyMove()
{
	if(oPlayer.state == STATE.DEAD)
	{
		target = noone;
		state = STATE.IDLE;
	}
	
	if(target != noone && target != undefined)
	{
		
		moveDir = point_direction(x, y, target.x, target.y);
		
		if(point_distance(x, y, target.x, target.y) <= 128)
		{
			stunCD = 20;
			state = STATE.ATTACK;
		}
		
	}
	else
	{
		//state = STATE.IDLE;
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




///
/// PLAYER FREE STATE
///
function PlayerFreeState()
{
	//DASH/BOOST MECHANIC
	if(spaceKey)
	{
		boost = true;
	}
	
	if(boost)
	{
		boostValue = 5;
		boostTime++;
		
		if(inputMagnitude == 0)
		{
			inputDir = lastDir;
			inputMagnitude = 1;
		}
		
		if(boostTime >= 120)
		{
			boost = false;
			boostTime = 0;
		}
		
	}
	else
	{
		boostValue = 1;	
	}
	
	//MOVEMENT
	xSpd = lengthdir_x(moveSpd * inputMagnitude * boostValue, inputDir);
	ySpd = lengthdir_y(moveSpd * inputMagnitude * boostValue, inputDir);
	
	//REMEMBER LAST DIRECTION IF BOOST AND STOP MOVING
	lastDir = inputDir;
	
	x += xSpd;
	y += ySpd;
	
	//ATTACKINITIATE
	if(attackKey)
	{
		state = STATE.ATTACK;
		//attackInProgress = true;
	}
}




///
///Attack State
///
function AttackState()
{
	if(!attackInProgress)
	{
		var attack = instance_create_layer(x, y, "Instances", oAttack0 );
		attack.image_angle = point_direction(x,y,mouse_x,mouse_y);
		attack.creatorId = id;
		attackInProgress = true;
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
			var attack = instance_create_layer(x, y, "Instances", oAttack1 );
			attack.image_angle = point_direction(x,y,target.x ,target.y);
			attack.creatorId = id;
			attackInProgress = true;
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
///Attack Cooldown
///
function AttackCoolDown()
{
	if(attackCD > 0)
	{
		attackCD--;
	}
	
	if(attackCD < 15 && attackKey)
	{
		state = STATE.ATTACK;
		attackCD = 0;
	}
	
	if(attackCD == 0)
	{
		state = STATE.IDLE;
	}
}




///
///DEAD
///
function DeadState()
{
	if(object_get_name(object_index) == "oPlayer")
	{
		sprite_index = sPlayerDead0;
	}
	
	if(leftKey)
	{
		hp = 10;
		sprite_index = sPlayer0;
		state = STATE.IDLE;
	}
}




///
///RETURN TO START POSITION
///
function ReturnState()
{
	targetX = id.xstart;
	targetY = id.ystart;
	state = STATE.MOVETOPOSITION;
}