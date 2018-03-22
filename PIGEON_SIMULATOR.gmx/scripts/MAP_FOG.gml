
xx = mouse_x
yy = mouse_y

if(timer <= 0){
    
    for(var i=0;i < obj_MAP_controller.width; i++){
        for(var j=0;j<obj_MAP_controller.height;j++){ 
            var inst = instance_position(i*obj_MAP_controller.blockSize+1,j*obj_MAP_controller.blockSize+1,Obj_Terrain)
            if(collision_line(xx,yy,inst.x,inst.y,Obj_Terrain_Crete,false,true)){
                ds_grid_set(fog,i,j,1)        
            } else {
                ds_grid_set(fog,i,j,0)
            }
            
        }
    }
    timer = timer_max
} else {
timer -= 1
}
