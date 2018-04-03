if(obj_FOG_controller.toggle_fog == 0 or ds_grid_get(obj_FOG_controller.fog,grid_x,grid_y) == 0){
    draw_set_color(couleur)
    draw_rectangle(x,y,x+obj_MAP_controller.blockSize,y + obj_MAP_controller.blockSize,false)
    draw_set_color(c_black)
} else  {
    var l = 50 - (point_distance(x,y,mouse_x,mouse_y)/10)
    if(l>0)
        draw_set_color(make_colour_rgb(l,l,l))
    else
        draw_set_color(make_colour_rgb(0,0,0))
    draw_rectangle(x,y,x+obj_MAP_controller.blockSize,y + obj_MAP_controller.blockSize,false)
    draw_set_color(c_black)
}


//var s = string(grid_x) + " " + string(grid_y)
//draw_text(x,y,s)
