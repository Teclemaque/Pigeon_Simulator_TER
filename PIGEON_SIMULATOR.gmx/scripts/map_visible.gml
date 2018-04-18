//renvoie true si les unité se voie (appelant + parramétre) sinon false

var inst1 = self
var inst2 = argument0

var t1 = instance_position(inst2.x,inst.y,Obj_Terrain)
var t2 = instance_position(inst2.x,inst.y,Obj_Terrain)

//si forest interraction
if(t1.object_index != Obj_Terrain_Forest and t2.object_index == Obj_Terrain_Forest){
    return false
} else if (t1.object_index == Obj_Terrain_Forest and t2.object_index != Obj_Terrain_Forest){
    return true    
} 
// si montagne sur montagne
else if(t1.object_index == Obj_Terrain_montagne and t2.object_index != Obj_Terrain_montagne){
    var inst3 = collision_line(inst1.x,inst1.y,inst2.x,inst2.y,Obj_Terrain_Crete,false,true)
    if(inst3 != noone){
        return true
    } else {
        if((inst3.crete < inst1.crete and inst2.crete >= inst3.crete)
        or(inst3.crete < inst2.crete and inst1.crete >= inst3.crete)){
            return true
        } else{
            return false   
        }
    }
}//si crete sur crete
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
