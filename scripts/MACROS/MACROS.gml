// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro CARDINAL_DIR round(direction/90)

enum ABILITY
{
	ONE,
	TWO,
	THREE,
	FOUR,
}

enum STATE
{
	IDLE,
	ATTACK,
	ACTION,
	COOLDOWN,
	MOVETOTARGET,
	MOVETOPOSITION,
	KNOCKEDDOWN,
	DEAD,
	RETURN
	
}