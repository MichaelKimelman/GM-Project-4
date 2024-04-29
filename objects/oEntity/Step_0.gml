/// @description Insert description here
// You can write your code in this editor

if(markedForDestruction)
{
	instance_destroy();
}

if(!global.gamePaused)
{
	if(entityScript[state] != -1)
	{
		script_execute(entityScript[state]);
	}
}

if(hp <= 0)
{
	markedForDestruction = true;
}