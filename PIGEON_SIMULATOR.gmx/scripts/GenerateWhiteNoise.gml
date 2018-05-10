var rand = random(0) // seed

var noise = ds_grid_create(global.MAP_Width,global.MAP_Height)

var i
var j

for(i = 0; i < global.MAP_Width; i++){
    for(j = 0; j < global.MAP_Width; j++){    
        ds_grid_set(noise,i,j, random(1) / 1)
    }
}

return noise