///map_visible(other)
{
//renvoie true si les unité se voie (appelant + parramétre) sinon false
var inst1 = self;
var inst2 = argument0;

if instance_exists(inst2){
    var t1 = instance_position(inst2.x,inst2.y,Obj_Terrain)
    var t2 = instance_position(inst2.x,inst2.y,Obj_Terrain)
    
    //si forest interraction
    if instance_exists(t1) && instance_exists(t2){
        if(t1.object_index != Obj_Terrain_Forest and t2.object_index == Obj_Terrain_Forest){
            return false
        } else if (t1.object_index == Obj_Terrain_Forest and t2.object_index != Obj_Terrain_Forest){
            return true
        } //si crete sur crete
        else if (t1.object_index == Obj_Terrain_Crete and t1.object_index == Obj_Terrain_Crete ){
            var inst3 = collision_line(inst1.x,inst1.y,inst2.x,inst2.y,Obj_Terrain_Crete,false,true)
            if(inst3 != noone){
                if(inst3.crete > inst1.crete and inst3.crete > inst2.crete){
                    return false
                } else 
                    return true
            } else {
                return true    
            }
        } else {
            var test = collision_line(inst1.x,inst1.y,inst2.x,inst2.y,Obj_Terrain_Obstacle,false,true)
            if(test != noone)
                return false
            else
                return true
        }
    }
}
}
