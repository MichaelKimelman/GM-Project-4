// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemCreate( _name = "item", _level = 1,) constructor
{
	name = _name;
	level = _level;
	
}

global.items =
{
	itemOne : new itemCreate( 
		"Gun"
		),
};
