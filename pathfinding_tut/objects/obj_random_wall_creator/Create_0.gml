/// @description Insert description here
// You can write your code in this editor
for(i = 0; i < 40; i++){
	X = 32+64*irandom(29);
	Y = 32+64*irandom(16);
	if(position_meeting(X,Y,obj_wall)){
		i--;
		continue;
	}
	
	instance_create_layer(X,Y,"Instances", obj_wall);
}