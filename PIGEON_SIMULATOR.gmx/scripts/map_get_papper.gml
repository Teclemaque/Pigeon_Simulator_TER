var inst = instance_position(mouse_x,mouse_y,Obj_Terrain)
if(inst){
var xx = inst.grid_x
var yy = inst.grid_y

var l = ds_list_create()
ds_list_add(l,1)
ds_list_add(l,ds_grid_get(obj_MAP_controller.terrain_map,xx,yy))

ds_grid_set(obj_MAP_controller.papper_map,xx,yy,l)
}
