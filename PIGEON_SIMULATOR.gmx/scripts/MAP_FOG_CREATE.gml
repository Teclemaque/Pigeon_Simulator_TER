timer_max = 10
timer = 0

cible_x = room_height / 2
cible_y = room_width / 2


image_alpha = 0.0

fog = ds_grid_create(obj_MAP_controller.width,obj_MAP_controller.height)

toggle_fog = 1
MAP_FOG()

with(obj_MAP_controller){
    papper_map = ds_grid_create(width,height)
    for(var i=0;i < width; i++){
        for(var j=0;j<height;j++){ 
            
            var l = ds_list_create()
            if(false//ds_grid_get(other.fog,i,j) == 1
            ){
                ds_list_add(l,0)
                ds_grid_set(papper_map,i,j,l)
            } else { //si case visible
                ds_list_add(l,1)
                ds_list_add(l,ds_grid_get(terrain_map,i,j))
                ds_grid_set(papper_map,i,j,l)
            }
            
        }
    }
}
toggle_fog = 0
