//prend deux paramétre : x et y dans la grille
var xx = argument0
var yy = argument1

var test = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
var ret = ds_grid_get(obj_MAP_controller.grid,xx,yy)

if(test == 1 or test == 3){
    return round(ret * 1.10)
} else if(test == -1){
    return round(ret - (ret/20))
} else {
    return round(ret * 0.90)
}
