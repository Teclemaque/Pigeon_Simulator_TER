///map_get_terrain( int 0~8 ) 
//- rencoie la hauteur de la case ou -1 si hors map

var arg = argument0

var xxx = floor(x / obj_MAP_controller.blockSize)
var yyy = floor(y / obj_MAP_controller.blockSize)


var inst = instance_position(x,y,Obj_Terrain)

if instance_exists(inst)
    {
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
    
    var xx = xxx + deca_x
    var yy = yyy + deca_y
    
    
    
    if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height){
    
        return ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
    
    } else {
    
        return -1
    }
}
return -4;