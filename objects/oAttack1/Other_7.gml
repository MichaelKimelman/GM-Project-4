/// @description Insert description here
// You can write your code in this editor





creatorId.attackInProgress = false;
creatorId.stunCD = 30;
creatorId.state = STATE.COOLDOWN;


//ds_list_clear(hitList);
ds_list_destroy(hitList);

instance_destroy();