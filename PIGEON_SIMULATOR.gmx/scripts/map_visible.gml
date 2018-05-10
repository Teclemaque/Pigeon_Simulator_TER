//renvoie true si les unité se voie (appelant + parramétre) sinon false

var inst1 = self
var inst2 = argument0

if instance_exists(inst1) && instance_exists(inst2){
    var t1 = instance_position(inst1.xx,inst1.y,Obj_Terrain)
    var t2 = instance_position(inst2.x,inst2.y,Obj_Terrain)

    if (instance_exists(t1) && instance_exists(t2)){
        //si crete sur crete
        if (t1.object_index == Obj_Terrain_Crete and t2.object_index == Obj_Terrain_Crete ){
            var t3 = collision_line(inst1.xx,inst1.y,inst2.x,inst2.y,Obj_Terrain_Crete,false,true)
            if(t3 != noone){
                if(t3.crete > t1.crete and t3.crete > t2.crete){
                    return false
                } else 
                    return true
            } else {
                return true    
            }
        } 
        // si montagne sur montagne
        else if(t1.object_index == Obj_Terrain_montagne and t2.object_index == Obj_Terrain_montagne){
            var t3 = collision_line(inst1.xx,inst1.y,inst2.x,inst2.y,Obj_Terrain_Crete,false,true)
            if(t3 == noone){
                return true
            } else {
                if((t3.crete < t1.crete and t2.crete >= t3.crete)
                or(t3.crete < t2.crete and t1.crete >= t3.crete)
                or(t3.crete < t1.crete and t3.crete < t2.crete)){
                    return true
                } else{
                    return false   
                }
            }
        }
        
        //si forest interraction
        else if(t1.object_index != Obj_Terrain_Forest and t2.object_index == Obj_Terrain_Forest){
            return false
        } else if (t1.object_index == Obj_Terrain_Forest and t2.object_index != Obj_Terrain_Forest){
            var t3 = collision_line(inst1.xx,inst1.y,inst2.x,inst2.y,Obj_Terrain_Crete,false,true)
            if(t3 != noone){
                return true    
            } else {
                return false
            }
        } 
        //le reste
        else {
            var test = collision_line(inst1.xx,inst1.y,inst2.x,inst2.y,Obj_Terrain_Obstacle,false,true)
            if(test != noone)
                return false
            else
                return true
        }
    } //fin si existe 2
} //fin si existe