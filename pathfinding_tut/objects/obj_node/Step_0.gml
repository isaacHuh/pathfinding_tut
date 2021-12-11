/// @description Insert description here
// You can write your code in this editor
draw = true;
if(position_meeting(x,y,obj_wall)){
	draw = false;
	node_weight = 2000;
	instance_destroy();
}
