var size_l = room_width/global.MAP_Width
var size_h = room_height/global.MAP_Height


for(i = 0;i<global.MAP_Height;i++)
    for(j = 0;j<global.MAP_Width;j++){
        var inst = noone
        var sprite_color = ds_grid_get(MAP_Precise,j,i)
        if( sprite_color != 2){
            inst = instance_create(j*size_l,i*size_h,Obj_Terrain_0)     
        }
        else{
         inst = instance_create(j*size_l,i*size_h,Obj_Terrain_1)  
        } 
        with(inst){
         image_index = sprite_color+1;
         image_xscale = size_l
         image_yscale = size_h
         image_speed = 0;
        } 
    
}
