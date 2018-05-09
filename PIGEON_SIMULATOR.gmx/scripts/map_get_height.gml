///map_get_height( int 0~8 ) - renvoie la hauteur de la case ou -1 si hors map

var arg = argument0



var inst = instance_position(x,y,Obj_Terrain)



var deca_x = 0 //case actuel

var deca_y = 0

if(arg == 1){ // case supérieur

    deca_x = -1

} else if(arg == 2) { // haut-droite

    deca_x = -1

    deca_y = 1

} else if(arg == 3){ // case droite

    deca_y = 1

} else if(arg == 4){ //case basse-droite

    deca_x = 1

    deca_y = 1

} else if(arg == 5){ //case basse

    deca_x = 1

} else if(arg == 6){ //case base-gauche

    deca_x = 1

    deca_y = -1

} else if(arg == 7){ //case gauche

    deca_y = -1

} else if (arg == 8){ //case haut-gauche

    deca_x = -1

    deca_y = -1

}


if instance_exists(inst){
    var xx = inst.grid_x + deca_x
    var yy = inst.grid_y + deca_y
    
    
    
    if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height){          
        var test = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
        var ret = ds_grid_get(obj_MAP_controller.grid,xx,yy)

        if(test == 1 or test == 3){
    
            return round(ret * 1.10)
    
        } else if(test == -1){
    
            return round(ret - (ret/20))
    
        } else {
            return round(ret * 0.90)
        }
    
    } 
else {
    return -1
    }
}
else 
    return -1;