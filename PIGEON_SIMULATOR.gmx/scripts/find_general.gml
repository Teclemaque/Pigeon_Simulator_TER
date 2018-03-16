///find_general()
var general = noone
for(var i = 0; i < instance_number(obj_general); i++){
    general  = instance_find(obj_general, i);
    if( general.Camp == 1 ){
        return general;
    }
}

return noone;
