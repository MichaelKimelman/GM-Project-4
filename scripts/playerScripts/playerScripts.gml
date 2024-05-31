// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerScripts(){

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
	if(inputMagnitude != 0)
	{
		lastDir = inputDir;
		image_index = floor(inputDir/90);

	}
	

	
	x += xSpd;
	y += ySpd;
	
	//ATTACKINITIATE
	if(attackKey && !rightMouseButton)
	{
		state = STATE.ATTACK;
		//attackInProgress = true;
	}
	
	if(oneButton)
	{
		ability = ABILITY.ONE;
		if(abilityScript[ability] != -1)
		{
			state = STATE.ACTION;
		}
		
	}
	
	if(rightMouseButton)
	{
		if(attackKey)
		{
			
		}
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
///USE ABILITIES
///
function useAbility()
{
	if(abilityScript[ability] != -1)
	{
		script_execute(abilityScript[ability]);
	}
	
}




///
///Ability numba one
///
function AbilityOne()
{
	if(!attackInProgress)
	{
		var attack = instance_create_layer(x, y, "Instances", oAttack3 );
		attack.image_angle = point_direction(x,y,mouse_x,mouse_y);
		attack.creatorId = id;
		attackInProgress = true;
	}
}




///
/// Shoot gun
///
function ShootGun()
{
	
}