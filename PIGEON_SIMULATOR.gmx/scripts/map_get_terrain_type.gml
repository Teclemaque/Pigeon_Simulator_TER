var xx = argument0
var yy = argument1

var zz = ds_grid_get(obj_MAP_controller.grid,xx,yy)

if(zz < obj_MAP_controller.water_level)
    return -1
else if (zz > obj_MAP_controller.mountain_level - 1 )
    return 1
else return 0