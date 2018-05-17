///map_get_height_cone( int 0~8 ) - rencoie la hauteur de la case ou -1 si hors map

var xxx = floor(x / obj_MAP_controller.blockSize)
var yyy = floor(y / obj_MAP_controller.blockSize)

var inst = instance_position(x,y,Obj_Terrain)

//var res = ds_list_create()

/*if(arg - 1 < 0){
    arg = 8
} else {
    arg--
}*/
deca_x = 0;
deca_y = 0;

if instance_exists(inst)
    {
    var xx = xxx
    var yy = yyy
    
    var test = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
    var ret = ds_grid_get(obj_MAP_controller.grid,xx,yy)
    
    if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height)
        {
        if(test == 1 or test == 3)
            {
            Z0 = round(ret * 1.10)
            } 
        else if(test == -1)
            {
            Z0 = -round(ret - (ret/20))
            } 
        else 
            {
            Z0 = round(ret * 0.90)
            }
        }
    else 
        {
        Z0 = -1;
        }
    
    if argument0 != 1 && argument0 != 8
        {
        A = argument0-1;
        B = argument0+1;
        }
    else
        {
        if argument0 == 1
            {
            A = 8;
            B = argument0+1;
            }
        else
            {
            A = argument0-1;
            B = 1;
            }
        }

    arg = A;
    
    repeat(3)
        {
        if(arg == 1){ // case supérieur
        
            deca_x = -1
            deca_y = 0
        
        } else if(arg == 2) { // haut-droite
        
            deca_x = -1
            deca_y = 1
        
        } else if(arg == 3){ // case droite
        
            deca_x = 0
            deca_y = 1
        
        } else if(arg == 4){ //case basse-droite
        
            deca_x = 1
        
            deca_y = 1
        
        } else if(arg == 5){ //case basse
        
            deca_x = 1
            deca_y = 0
        
        } else if(arg == 6){ //case base-gauche
        
            deca_x = 1
            deca_y = -1
        
        } else if(arg == 7){ //case gauche
        
            deca_x = 0
            deca_y = -1
        
        } else if (arg == 8){ //case haut-gauche
        
            deca_x = -1
            deca_y = -1
        
        }
        
        var xx = inst.grid_x + deca_x
        var yy = inst.grid_y + deca_y
        ///////////////////////////////////////////////////////////
        if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height)
            {
            test = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
            ret = ds_grid_get(obj_MAP_controller.grid,xx,yy)
    
            if arg == A
                {
                if(test == 1 or test == 3)
                    {
                    ZC1 = round(ret * 1.10)
                    } 
                else if(test == -1)
                    {
                    ZC1 = -round(ret - (ret/20))
                    } 
                else 
                    {
                    ZC1 = round(ret * 0.90)
                    }
                arg = argument0;
                }
            else
                {
                if (arg == argument0)
                    {
                    if(test == 1 or test == 3)
                        {
                        ZC = round(ret * 1.10)
                        } 
                    else if(test == -1)
                        {
                        ZC = -round(ret - (ret/20))
                        } 
                    else 
                        {
                        ZC = round(ret * 0.90)
                        }
                    arg = B;
                    }
                else
                    {
                    if(test == 1 or test == 3)
                        {
                        ZC2 = round(ret * 1.10)
                        } 
                    else if(test == -1)
                        {
                        ZC2 = -round(ret - (ret/20))
                        } 
                    else 
                        {
                        ZC2 = round(ret * 0.90)
                        }
                    }
                }
            } 
            else 
                {
                if (arg == A)
                    {
                    ZC1 = -1
                    arg = argument0;
                    }
                else
                    {
                    if (arg == argument0)
                        {
                        ZC = -1;
                        arg = B;
                        }
                    else
                        {
                        ZC2 = -1;
                        }
                    }
                }
        //////////////////////////////////////////////////////
        /*if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height)
            {
            if arg == A
                {
                ZC1 = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
                arg = argument0;
                }
            else 
                {
                if arg == argument0
                    {
                    ZC = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
                    arg = B;
                    }
                else 
                    {
                    ZC2 = ds_grid_get(obj_MAP_controller.terrain_map,xx,yy)
                    }
                }
            }
        else 
            {
            if arg == A
                {
                ZC1 = -1
                arg = argument0
                }
            else 
                {
                if arg == argument0
                    {
                    ZC = -1
                    arg = B;
                    }
                else 
                    {
                    ZC2 = -1
                    }
                }
            }*/
        }
     
    }
else
    {
    ZC1 = 0;
    ZC2 = 0;
    ZC = 0;
    }
exit;
    
    /*if (argument0 == 2 || argument0 == 4 || argument0 == 6 || argument0 == 8)
        {
        var xx = inst.grid_x + deca_x
        var yy = inst.grid_y + deca_y
    
        if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height)
            {
            ds_list_add(res, ds_grid_get(obj_MAP_controller.terrain_map,xx,yy))
            }
        else 
            {
            ds_list_add(res,-1)
            }
        }*/


/*for(var i=0;i<3;i++){

    var deca_x = 0 //case actuel

    var deca_y = 0

    if(arg == 1){ // case supérieur

        deca_x = -1
        deca_y = 0

    } else if(arg == 2) { // haut-droite

        deca_x = -1

        deca_y = 1

    } else if(arg == 3){ // case droite

        deca_x = 0
        deca_y = 1

    } else if(arg == 4){ //case basse-droite

        deca_x = 1

        deca_y = 1

    } else if(arg == 5){ //case basse

        deca_x = 1
        deca_y = 0

    } else if(arg == 6){ //case base-gauche

        deca_x = 1

        deca_y = -1

    } else if(arg == 7){ //case gauche

        deca_x = 0
        deca_y = -1

    } else if (arg == 8){ //case haut-gauche

        deca_x = -1
        deca_y = -1

    }

    var xx = inst.grid_x + deca_x
    var yy = inst.grid_y + deca_y
 

    if(xx >= 0 and xx < obj_MAP_controller.width and yy >= 0 and yy < obj_MAP_controller.height){
        //if (argument0 == 2 || argument0 == 4 || argument0 == 6 
        ds_list_add(res, ds_grid_get(obj_MAP_controller.terrain_map,xx,yy))
    } else {
        ds_list_add(res,-1)
    }

    if(arg + 1 > 8){
        arg = 0
    } else {
        arg++
    }
}*/

//return res

