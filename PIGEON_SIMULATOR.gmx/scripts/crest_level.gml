crest = ds_grid_create(width,height)
for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        ds_grid_set(crest,i,j,0)    
    }
}

//maxi min pour range
var maxi = -1
var mini = -1

for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        if(ds_grid_get(terrain_map,i,j) == 1 or ds_grid_get(terrain_map,i,j) == 3){
            var test = ds_grid_get(grid,i,j)
            if(maxi < test or maxi == -1) maxi = test
            if(mini > test or maxi == -1) mini = test
        }
    }
}
var range = (maxi - mini) * 0.10
var r = maxi - range

for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        var cre = 0
        if(ds_grid_get(terrain_map,i,j) == 1 or ds_grid_get(terrain_map,i,j) == 3){
            cre = 1
        }
        
        if(cre !=0){
            var test = ds_grid_get(grid,i,j)
            if(test > r) ds_grid_set(crest,i,j,cre+4)
            else if (test > r-range) ds_grid_set(crest,i,j,cre+3)
            else if (test > r-range*2) ds_grid_set(crest,i,j,cre+2)
            else if (test > r-range*3) ds_grid_set(crest,i,j,cre+1)
            else  ds_grid_set(crest,i,j,cre)
        }
    }
}
