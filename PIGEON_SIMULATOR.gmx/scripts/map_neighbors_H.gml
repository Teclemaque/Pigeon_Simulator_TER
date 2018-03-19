//retourne les voisons sous la forme d'un tableau 2d equivalent à la grille alentour
var t = map_get_xy()
var xx = ds_list_find_value(t,0)
var yy = ds_list_find_value(t,1)

var neighbors = ds_grid_create(3,3)

if(xx - 1 > 0 and yy - 1 > 0){
    ds_grid_set(neighbors,0,0,ds_grid_get(obj_MAP_controller.grid,xx-1,yy-1))
} else {
    ds_grid_set(neighbors,0,0,noone)
}

if(yy - 1 > 0){
    ds_grid_set(neighbors,1,0,ds_grid_get(obj_MAP_controller.grid,xx,yy-1))
} else {
    ds_grid_set(neighbors,1,0,noone)
}

if(xx + 1 < room_width and yy - 1 > 0){
    ds_grid_set(neighbors,2,0,ds_grid_get(obj_MAP_controller.grid,xx+1,yy-1))
} else {
    ds_grid_set(neighbors,2,0,noone)
}

//2nd row

if(xx - 1 > 0){
    ds_grid_set(neighbors,0,1,ds_grid_get(obj_MAP_controller.grid,xx-1,yy))
} else {
    ds_grid_set(neighbors,0,1,noone)
}

ds_grid_set(neighbors,1,1,ds_grid_get(obj_MAP_controller.grid,xx,yy))

if(xx + 1 < room_width){
    ds_grid_set(neighbors,2,1,ds_grid_get(obj_MAP_controller.grid,xx+1,yy))
} else {
    ds_grid_set(neighbors,2,1,noone)
}

//3rd row
if(xx - 1 > 0 and yy + 1 < room_height){
    ds_grid_set(neighbors,0,2,ds_grid_get(obj_MAP_controller.grid,xx-1,yy+1))
} else {
    ds_grid_set(neighbors,0,2,noone)
}

if(yy + 1 < room_height){
    ds_grid_set(neighbors,1,2,ds_grid_get(obj_MAP_controller.grid,xx,yy+1))
} else {
    ds_grid_set(neighbors,1,2,noone)
}

if(xx + 1 < room_width and yy + 1 < room_height){
    ds_grid_set(neighbors,2,2,ds_grid_get(obj_MAP_controller.grid,xx+1,yy+1))
} else {
    ds_grid_set(neighbors,2,2,noone)
}
