for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        var type = ds_grid_get(terrain_map,i,j)
        if(type == 1 and ds_grid_get(grid,i,j) < mountain_level){
            ds_grid_set(terrain_map,i,j,0)
        }    
    }
}
