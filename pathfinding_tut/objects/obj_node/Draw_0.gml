/// @description Insert description here
// You can write your code in this editor

if(draw){
	draw_set_color(c_white);
	draw_circle(x,y,5,0);

	/*
	for(i = 0; i < ds_list_size(adj_nodes); i++){
		node = ds_list_find_value(adj_nodes, i)
		draw_line_width(x,y,node.x, node.y,2);
	}
	*/
	if(parent_node != pointer_null){
		//draw_set_color(c_red);
		dir = point_direction(x,y,parent_node.x, parent_node.y);
		draw_line_width(x,y,x + lengthdir_x(32,dir), y + lengthdir_y(32,dir),2);
	}
}