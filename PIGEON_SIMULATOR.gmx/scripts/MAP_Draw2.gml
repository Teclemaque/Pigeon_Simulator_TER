for(var i=0;i < width-1; i++){
    for(var j=0;j<height-1;j++){ 
        /*
        draw_set_color(getColorZ(ds_grid_get(grid,i,j),i,j))
        draw_rectangle(i*blockSize,j*blockSize,(i+1)*blockSize,(j+1)*blockSize,false)
        draw_set_color(c_black)
        draw_text(i*blockSize,j*blockSize,string(ds_grid_get(grid,i,j)))
        draw_text(i*blockSize,j*blockSize+(blockSize/2),string(ds_grid_get(terrain_map,i,j)))
        */
       
       var h = ds_grid_get(terrain_map,i,j)
         var c = getColorZ(ds_grid_get(grid,i,j),i,j)
         var inst
        if (h == -1){
            inst = instance_create(i*blockSize,j*blockSize,Obj_Terrain_Eau)
        } else if (h == 1) {
            inst = instance_create(i*blockSize,j*blockSize,Obj_Terrain_montagne)  
        } else if(h == 3){
            inst = instance_create(i*blockSize,j*blockSize,Obj_Terrain_Crete)
        } else if(h == 2){
            inst = instance_create(i*blockSize,j*blockSize,Obj_Terrain_Forest)
        } else {
            inst = instance_create(i*blockSize,j*blockSize,Obj_Terrain_sol)   
        }
        
        
        with(inst){
            image_xscale = other.blockSize
            image_yscale = other.blockSize
            image_speed = 0
            couleur = c
            grid_x = i
            grid_y = j
        }
        if(h == 3 or h==1){
            with(inst){
                crete = ds_grid_get(other.crest,grid_x,grid_y)
            }
        }

        
    }
}
