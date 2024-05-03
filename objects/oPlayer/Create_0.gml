/// @description Insert description here
// You can write your code in this editor

event_inherited();

state = STATE.IDLE;

moveSpd = 4;

lastDir = 0;

boost = false;
boostValue = 1;
boostTime = 0;

attackInProgress = false;

attackCD = 0;

entityScript[STATE.IDLE] = PlayerFreeState;
entityScript[STATE.ATTACK] = AttackState;
entityScript[STATE.ACTION] = -1;
entityScript[STATE.MOVETOTARGET] = -1;
entityScript[STATE.COOLDOWN] = AttackCoolDown;
entityScript[STATE.DEAD] = DeadState;