//reinitialisation de done
for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        ds_grid_set(done,i,j,0)
    }
}

//dillatation de la plaine
for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        var type = ds_grid_get(terrain_map,i,j)
        if(type = 0 and ds_grid_get(done,i,j) == 0){
            if(i > 0){
                ds_grid_set(terrain_map,i-1,j,0)
                ds_grid_set(done,i-1,j,1)
            }
            if(i < width){
                ds_grid_set(terrain_map,i+1,j,0)
                ds_grid_set(done,i+1,j,1)
            }
            if(j > 0){
                ds_grid_set(terrain_map,i,j-1,0)
                ds_grid_set(done,i,j-1,1)
            }
            if(i < height){
                ds_grid_set(terrain_map,i,j+1,0)
                ds_grid_set(done,i,j+1,1)
            }
        }
    }
}



//erosion de la plaine
for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        ds_grid_set(done,i,j,0)
    }
}
for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        var type = ds_grid_get(terrain_map,i,j)
        if(type != 0 and ds_grid_get(done,i,j) == 0){
            if(i > 0){
                ds_grid_set(terrain_map,i-1,j,type)
                ds_grid_set(done,i-1,j,1)
            }
            if(i < width){
                ds_grid_set(terrain_map,i+1,j,type)
                ds_grid_set(done,i+1,j,1)
            }
            if(j > 0){
                ds_grid_set(terrain_map,i,j-1,type)
                ds_grid_set(done,i,j-1,1)
            }
            if(i < height){
                ds_grid_set(terrain_map,i,j+1,type)
                ds_grid_set(done,i,j+1,1)
            }
        }
    }
}

//uniform

for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
            var somme = round(ds_grid_get_mean(terrain_map,j-1,i-1,j+1,i+1))
            ds_grid_set(terrain_map,j,i,somme)
    }
}
