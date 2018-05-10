if(x > view_xview[0]-16 and x < view_xview[0]+view_wport[0]+16 
    and y > view_yview[0]-16 and y < view_yview[0]+view_hport[0]+16){
    if(obj_MAP_controller.toggle_papper == 0){ // si affichage normal  
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
    } else { //si en mode carte papier
        var test = ds_list_find_value(ds_grid_get(obj_MAP_controller.papper_map,grid_x,grid_y),0)
        if(test == 1){
            var c
            var colourChoice = ds_list_find_value(ds_grid_get(obj_MAP_controller.papper_map,grid_x,grid_y),1)
            var shade = ds_grid_get(obj_MAP_controller.grid,grid_x,grid_y);
            if(colourChoice == -1){
                //c = c_aqua
                c= make_colour_hsv(130,71*2,shade+80)
            } else if (colourChoice == 0){
                //c = make_colour_rgb(189,183,107)
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
            
            draw_set_color(c)    
            draw_rectangle(x,y,x+obj_MAP_controller.blockSize,y + obj_MAP_controller.blockSize,false)
            /*
            draw_set_blend_mode(bm_max)
            var shade = 200 - (ds_grid_get(obj_MAP_controller.grid,grid_x,grid_y)*2.4)
            draw_set_color(make_colour_rgb(189-100,186-100,107-100))
            draw_rectangle(x,y,x+obj_MAP_controller.blockSize,y + obj_MAP_controller.blockSize,false)
            
            draw_set_color(make_colour_rgb(shade,shade,shade))
            draw_rectangle(x,y,x+obj_MAP_controller.blockSize,y + obj_MAP_controller.blockSize,false)
            */
            draw_set_blend_mode(bm_normal)
            
        } else{
            draw_set_color(c_black)
            draw_rectangle(x,y,x+obj_MAP_controller.blockSize,y + obj_MAP_controller.blockSize,false)
        }
    
    }
}

/*
draw_set_colour(c_black)
var s = string(map_get_height(grid_x,grid_y)) //4 différence
draw_text_transformed(x,y,s,0.35,0.35,0)