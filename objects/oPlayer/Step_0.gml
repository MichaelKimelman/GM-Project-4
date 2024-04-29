/// @description Insert description here
// You can write your code in this editor

leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
rightKey = keyboard_check(ord("D"));
downKey = keyboard_check(ord("S"));

spaceKey = keyboard_check_pressed(vk_space);
attackKey = mouse_check_button(mb_left);

inputDir = point_direction(0, 0, rightKey - leftKey, downKey - upKey);
inputMagnitude = (rightKey - leftKey != 0) || (downKey - upKey != 0);

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