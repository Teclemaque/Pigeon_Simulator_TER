for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        ds_grid_set(done,i,j,0)
    }
}
var chance = 15
for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        var type = ds_grid_get(terrain_map,i,j)
        if(type == -2 and ds_grid_get(done,i,j)==0){
            ds_grid_set(done,i,j,0)
            if(i>0 and j>0 and ds_grid_get(terrain_map,i-1,j-1) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i-1,j-1,-2)
                ds_grid_set(done,i-1,j-1,1)
            }
           if(j>0 and ds_grid_get(terrain_map,i,j-1) != -2and random(100)>chance){
                ds_grid_set(terrain_map,i,j-1,-2)
                ds_grid_set(done,i,j-1,1)
           }
           if(i<width and j>0 and ds_grid_get(terrain_map,i+1,j-1) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i+1,j-1,-2)
                ds_grid_set(done,i+1,j-1,1)
           }
           if(i>0 and ds_grid_get(terrain_map,i-1,j) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i-1,j,-2)
                ds_grid_set(done,i-1,j,1)
           }
          if(i<width and ds_grid_get(terrain_map,i+1,j) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i+1,j,-2)
                ds_grid_set(done,i+1,j,1)
           }
           if(i>0 and j<height and ds_grid_get(terrain_map,i-1,j+1) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i-1,j+1,-2)
                ds_grid_set(done,i-1,j+1,1)
           }
           if(j<height and ds_grid_get(terrain_map,i,j+1) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i,j+1,-2)
                ds_grid_set(done,i,j+1,1)
           }
           if(i<width and j<height and ds_grid_get(terrain_map,i+1,j+1) != -2 and random(100)>chance){
                ds_grid_set(terrain_map,i+1,j+1,-2)
                ds_grid_set(done,i+1,j+1,1)
           }
        }
    }
}
for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        if(ds_grid_get(terrain_map,i,j) == -2)
            ds_grid_set(terrain_map,i,j,-1)
    }
}
