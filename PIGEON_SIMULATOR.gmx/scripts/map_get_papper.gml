var inst = instance_position(mouse_x,mouse_y,Obj_Terrain)
if(inst){
var xx = inst.grid_x
var yy = inst.grid_y

var l = ds_list_create()
ds_list_add(l,1)
ds_list_add(l,ds_grid_get(obj_MAP_controller.terrain_map,xx,yy))

ds_grid_set(obj_MAP_controller.papper_map,xx,yy,l)
}


var c
var colourChoice = ds_list_find_value(ds_grid_get(obj_MAP_controller.papper_map,inst.grid_x,inst.grid_y),1)
var shade = ds_grid_get(obj_MAP_controller.grid,inst.grid_x,inst.grid_y);
if(colourChoice == -1){
    c= make_colour_hsv(130,71*2,shade+80)
} else if (colourChoice == 0){
    c= make_colour_hsv(59,75.43*2,shade+100)
} else if (colourChoice == 1){
//c = c_maroon
 c= make_colour_hsv(28.7,36.07*2,shade+20)
} else if (colourChoice == 2){
//c = make_colour_rgb(154-20,205-20,50-20)
c= make_colour_hsv(87.69,100*2,shade+80)
} else {
 // c = c_maroon
c= make_colour_hsv(28.7,36.07*2,shade+20)
}
surface_set_target(Obj_mini_map_controler.mini_map)
draw_set_color(c)
draw_point(inst.grid_x,inst.grid_y)
surface_reset_target()
