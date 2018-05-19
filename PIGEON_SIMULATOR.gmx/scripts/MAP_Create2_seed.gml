var arg = argument0

toggle_papper = 0

randomize()
seed = round(random_range(1000000,1000000));

water_level = 27 //25
mountain_level = 61  //60

blockSize = 16

width = room_width / blockSize
height = room_height / blockSize

grid = ds_grid_create(width,height)

seed = arg

generate();
terrain_map = ds_grid_create(width,height)
/*
-1 : water
0 : grass
1 : Mountain
2 : forest //si forest n'est pas deux, c'est à cause de la valeur qui importe dans certain calcul
3 : crête
*/

for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        var type = map_get_terrain_type(i,j)
        if(type == 0 and random(100) < 0.1){
            type = 2
        }
        ds_grid_set(terrain_map,i,j,type)
    }
}

// a done map
done = ds_grid_create(width,height)
for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        ds_grid_set(done,i,j,0)
    }
}
dillatation_erosion();
create_forest();
error_check();
crete_finder();
create_river();
crest_level();
ds_grid_destroy(done);
