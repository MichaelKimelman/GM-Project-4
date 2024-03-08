// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///
///BASE STATE NO CODE RUN
///
function baseState()
{
	if(instance_exists(oPlayer))
	{
		target = oPlayer;
		//CHANGE STATE TO MOVE
	}
	else
	{
		target = noone;
	}
	
	if(hp <= 0)
	{
		instance_destroy();
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
		state = AttackState;
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