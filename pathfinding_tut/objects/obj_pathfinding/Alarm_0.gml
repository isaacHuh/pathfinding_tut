/// @description find path

// create list to hold node queue instead of recursion method because stack and stuff
node_queue = ds_list_create();

//reset nodes
for ( _y = 0; _y < grid_height; _y++) {
	for ( _x = 0; _x < grid_width; _x++) {
		node = node_grid[_x][_y];
		if(instance_exists(node)){
			node.path_weight = -1;
			node.parent_node = pointer_null;
		}
	}
}

//find nearest node
nearest_node = instance_nearest(player.x, player.y, obj_node);
nearest_node.path_weight = 0;
ds_list_add(node_queue, nearest_node);

while(ds_list_size(node_queue) > 0){
	curr_node = ds_list_find_value(node_queue, 0);
	ds_list_delete(node_queue, 0);
	
	for(i = 0; i < ds_list_size(curr_node.adj_nodes); i++){
		adj_node = ds_list_find_value(curr_node.adj_nodes,i);
		if(!instance_exists(adj_node)){
			ds_list_delete(curr_node.adj_nodes,i);
			i--;
			continue;
		}
		
		if(adj_node.path_weight == -1 || (curr_node.path_weight + curr_node.node_weight < adj_node.path_weight)){
			adj_node.path_weight = curr_node.path_weight + curr_node.node_weight;
			adj_node.parent_node = curr_node;
			ds_list_add(node_queue, adj_node);
		}
	}
            
}

alarm[0] = 5;
