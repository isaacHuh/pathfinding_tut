/// @description Insert description here
// You can write your code in this editor
player = obj_player;

//create node_grid
for(_y = 0; 32+_y*64 < room_height; _y++){
	for(_x = 0; 32+_x*64 < room_width; _x++){
			node_grid[_x][_y] = instance_create_depth(32+_x*64, 32+_y*64, 0, obj_node);
	}
}

grid_height = array_length_2d(node_grid,0);
grid_width = array_height_2d(node_grid);

// assign nodes
for ( _y = 0; _y < grid_height; _y++) {
	for ( _x = 0; _x < grid_width; _x++) {
		node = node_grid[_x][_y];
		
		// find and add adj nodes
		if(_x-1 >= 0){
			ds_list_add(node.adj_nodes, node_grid[_x-1][_y]); 
		}
			
		if(_x+1 >= 0 && _x+1 < grid_width){
			ds_list_add(node.adj_nodes, node_grid[_x+1][_y]); 
		}
			
		if(_y-1 >= 0){
			ds_list_add(node.adj_nodes, node_grid[_x][_y-1]); 
		}
			
		if(_y+1 >= 0 && _y+1 < grid_height){
				ds_list_add(node.adj_nodes, node_grid[_x][_y+1]); 
		}
		
		//diagonal
		if(_x-1 >= 0 && _y-1 >= 0){
			ds_list_add(node.adj_nodes, node_grid[_x-1][_y-1]); 
		}
		if((_x+1 >= 0 && _x+1 < grid_width) && _y-1 >= 0){
			ds_list_add(node.adj_nodes, node_grid[_x+1][_y-1]); 
		}
		
		if(_x-1 >= 0 && (_y+1 >= 0 && _y+1 < grid_height)){
				ds_list_add(node.adj_nodes, node_grid[_x][_y+1]); 
		}
		if((_x+1 >= 0 && _x+1 < grid_width) && (_y+1 >= 0 && _y+1 < grid_height)){
				ds_list_add(node.adj_nodes, node_grid[_x][_y+1]); 
		}
	}
}


//start pathfinding
alarm[0] = 5;
