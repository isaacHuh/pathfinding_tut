/// @description Insert description here
// You can write your code in this editor

// choose player
node = instance_nearest(x,y,obj_node).parent_node;
if(node != pointer_null){
	player = node;
}


//move towards direction
dir = point_direction(x,y,player.x,player.y);

target_x = x + lengthdir_x(spd,dir);
target_y = y + lengthdir_y(spd,dir);
		
if(!position_meeting(target_x,target_y, obj_wall)){
	x = target_x;
	y = target_y;
}

//make sure they don't collide
collide_obj = collision_circle(x,y,collision_radius,obj_enemy,0,1);
count = 0;
while(collide_obj != noone && count < 15){
	count++;
	avoid_dir = point_direction(x,y,collide_obj.x,collide_obj.y)+180;
	avoid_x = x + lengthdir_x(1,avoid_dir);
	avoid_y = y + lengthdir_y(1,avoid_dir);
	
	if(!position_meeting(avoid_x, avoid_y, obj_wall)){
		x = avoid_x;
		y = avoid_y;
	}
	
	collide_obj = collision_circle(x,y,collision_radius,obj_enemy,0,1);
}
