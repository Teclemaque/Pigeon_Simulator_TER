var chance = argument2
var xx = argument0
var yy = argument1

if(xx - 1 >= 0 and ds_grid_get(done,xx-1,yy) = 0 and ds_grid_get(terrain_map,xx-1,yy)==0){
    if(random(100) < chance){
        ds_grid_set(terrain_map,xx-1,yy,2)
        ds_grid_set(done,xx-1,yy,1)
        expend_forest(xx-1,yy,chance/1.5)
    }
}

if(xx + 1 < room_width + 1 and ds_grid_get(done,xx+1,yy) = 0 and ds_grid_get(terrain_map,xx+1,yy)==0){
    if(random(100) < chance){
        ds_grid_set(terrain_map,xx+1,yy,2)
        ds_grid_set(done,xx+1,yy,1)
        expend_forest(xx+1,yy,chance/1.5)
    }
}

if(yy - 1 >= 0 and ds_grid_get(done,xx,yy-1) = 0 and ds_grid_get(terrain_map,xx,yy-1)==0){
    if(random(100) < chance){
        ds_grid_set(terrain_map,xx,yy-1,2)
        ds_grid_set(done,xx,yy-1,1)
        expend_forest(xx,yy-1,chance/1.5)
    }    
}

if(yy + 1 <= room_height and ds_grid_get(done,xx,yy+1) = 0 and ds_grid_get(terrain_map,xx,yy+1)==0){
    if(random(100) < chance){
        ds_grid_set(terrain_map,xx,yy+1,2)
        ds_grid_set(done,xx,yy+1,1)
        expend_forest(xx,yy+1,chance/1.5)
    }    
}
