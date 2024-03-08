/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

imageTimer++;

if(imageTimer%10==0)
{
	image_index = irandom(5);
}

if(imageTimer >= 60)
{
	imageTimer = 0;
}