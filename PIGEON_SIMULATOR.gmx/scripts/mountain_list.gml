var xx = argument0
var yy = argument1

var list = ds_list_create()
var tmp = ds_list_create()
var arg = ds_list_create()
ds_list_add(arg,ds_grid_get(grid,xx,yy),xx,yy)

ds_list_add(list,arg)
ds_grid_set(done,xx,yy,1)

// top neighbor
if(yy > 0 and ds_grid_get(terrain_map,xx,yy-1) == 1 and ds_grid_get(done,xx,yy-1) == 0 ){
    tmp = mountain_list(xx,yy-1)
}

if(!ds_list_empty(tmp)){
    for(var i = 0; i<ds_list_size(tmp); i++) {
        ds_list_add(list,ds_list_find_value(tmp,i))
    } 
    ds_list_clear(tmp)
}

//left neighbor
if(xx > 0 and ds_grid_get(terrain_map,xx-1,yy) == 1 and ds_grid_get(done,xx-1,yy) == 0 ){
    tmp = mountain_list(xx-1,yy)
}

if(!ds_list_empty(tmp)){
    for(var i = 0; i<ds_list_size(tmp); i++) {
        ds_list_add(list,ds_list_find_value(tmp,i))
    } 
    ds_list_clear(tmp)
}

//right neighbor
if(xx < width-1 and ds_grid_get(terrain_map,xx+1,yy) == 1 and ds_grid_get(done,xx+1,yy) == 0 ){
    tmp = mountain_list(xx+1,yy)
}

if(!ds_list_empty(tmp)){
    for(var i = 0; i<ds_list_size(tmp); i++) {
        ds_list_add(list,ds_list_find_value(tmp,i))
    } 
    ds_list_clear(tmp)
}

//bottom neighbor
if(yy < height-1 and ds_grid_get(terrain_map,xx,yy+1) == 1 and ds_grid_get(done,xx,yy+1) == 0 ){
    tmp = mountain_list(xx,yy+1)
}

if(!ds_list_empty(tmp)){
    for(var i = 0; i<ds_list_size(tmp); i++) {
        ds_list_add(list,ds_list_find_value(tmp,i))
    } 
    ds_list_clear(tmp)
}

return list
