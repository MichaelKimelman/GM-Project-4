/// @description Insert description here
// You can write your code in this editor


//HITLIST CHECKAR COLLISION MED ENEMIES
var _stepHitList = ds_list_create();

var _hits = instance_place_list(x, y, oEnemy0, _stepHitList,false);

if(_hits > 0)
{
	for(var i = 0; i < _hits; i++)
	{
		var _hit = _stepHitList[| i];
		//ds_list_find_value(_stepHitList, i);
		
		if(ds_list_find_index(hitList, _hit) == -1)
		{
			ds_list_add(hitList, _hit);
			_hit.hp -= 1;
			
		}
	}
}