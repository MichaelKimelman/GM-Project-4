/// @description Insert description here
// You can write your code in this editor


state = STATE.IDLE;

hp = 10;
maxHP = 10;

target = noone;
targetX = 0;
targetY= 0;
markedForDestruction = false;

moveDir = 0;
moveSpd = 1;

stunCD = 0;
attackInProgress = false;

entityScript[STATE.IDLE] = baseState;
entityScript[STATE.ATTACK] = EnemyAttackState;
entityScript[STATE.ACTION] = -1;
entityScript[STATE.MOVETOTARGET] = EnemyMove;
entityScript[STATE.MOVETOPOSITION] = EnemyMovePosition;
entityScript[STATE.KNOCKEDDOWN] = KnockedDown;
entityScript[STATE.COOLDOWN] = EnemyCooldown;
entityScript[STATE.DEAD] = -1;
entityScript[STATE.RETURN] = ReturnState;