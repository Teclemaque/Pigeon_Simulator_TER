
for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        var type = map_get_terrain_type(i,j)
        if(type == 0 and random(100) < 0.1){
            ds_grid_set(terrain_map,i,j,2)
        }
    }
}
//expending forest
show_debug_message("--begin expend forest")
for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        if(ds_grid_get(terrain_map,i,j) == 2 and ds_grid_get(done,i,j) == 0){
            expend_forest(i,j,3200)
        }
    }
}
