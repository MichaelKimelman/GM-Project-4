/// @description Insert description here
// You can write your code in this editor


state = STATE.IDLE;

hp = 10;
maxHP = 10;

target = noone;
markedForDestruction = false;

moveDir = 0;
moveSpd = 2;

stunCD = 0;
attackInProgress = false;

entityScript[STATE.IDLE] = baseState;
entityScript[STATE.ATTACK] = EnemyAttackState;
entityScript[STATE.ACTION] = -1;
entityScript[STATE.MOVE] = EnemyMove;
entityScript[STATE.KNOCKEDDOWN] = KnockedDown;
entityScript[STATE.COOLDOWN] = EnemyCooldown;