var xx = mouse_x
var yy = mouse_y
    

if keyboard_check_pressed(ord('F')){
    if(toggle_fog == 1)
        toggle_fog = 0
    else
        toggle_fog = 1
}

if(toggle_fog == 1){  
    if(timer <= 0){
        var pos = instance_position(xx,yy,Obj_Terrain_Crete)    
        for(var i=0;i < obj_MAP_controller.width; i++){
            for(var j=0;j<obj_MAP_controller.height;j++){ 
                var inst = instance_position(i*obj_MAP_controller.blockSize+1,j*obj_MAP_controller.blockSize+1,Obj_Terrain)
                if(pos == noone){
                    if(inst.object_index != Obj_Terrain_montagne 
                        and (instance_position(xx,yy,Obj_Terrain_montagne)==noone)){
                        if(collision_line(xx,yy,inst.x,inst.y,Obj_Terrain_Obstacle,false,true)){
                            ds_grid_set(fog,i,j,1)        
                        } else {
                            ds_grid_set(fog,i,j,0)
                        }//fin si terrain sur terrain
                    } else {
                        if(collision_line(xx,yy,inst.x,inst.y,Obj_Terrain_Crete,false,true)){
                            ds_grid_set(fog,i,j,1)        
                        } else {
                            ds_grid_set(fog,i,j,0)
                        }//fin si terrain sur terrain
                    }
                }else if(inst.object_index != Obj_Terrain_Crete){
                    instance_deactivate_object(pos)
                    instance_deactivate_object(inst)
                    var inst2 = collision_line(xx,yy,inst.x,inst.y,Obj_Terrain_Crete,false,true)
                    instance_activate_object(pos)
                    instance_activate_object(inst)
                    if(inst2 != noone and inst2.object_index == Obj_Terrain_Crete and inst2.crete > pos.crete){
                        ds_grid_set(fog,i,j,1)
                    }else{
                        ds_grid_set(fog,i,j,0)
                    } // fin si crete sur terrain
                }else{
                    instance_deactivate_object(pos)
                    instance_deactivate_object(inst)
                    var inst2 = collision_line(xx,yy,inst.x,inst.y,Obj_Terrain_Crete,false,true)
                    instance_activate_object(pos)
                    instance_activate_object(inst)
                    if(inst2 == noone){ // si pas de crete entre les deux
                        if(pos.crete > inst.crete)
                            ds_grid_set(fog,i,j,0)      
                        else
                            ds_grid_set(fog,i,j,1)      
                    }else{
                        if(pos.crete > inst2.crete){
                            ds_grid_set(fog,i,j,0)
                        }else{
                            ds_grid_set(fog,i,j,1)
                        }
                    }
                }// fin si crete sur crete
            }//fin for j
        }//fin for i
        timer = timer_max
    } else {
    timer -= 1
    }
}
