///find_general()
var general_class = obj_agent_general; // changer si refactoring et que le general n'est plus le même
var general = noone
for(var i = 0; i < instance_number(general_class); i++){
    general  = instance_find(general_class, i);
    show_debug_message("general en cours : " + string(general.id) + ", Camp : " + string(general.Camp));
    if( general.Camp > 0 ){
        return general;
    }
}
show_error("Le general du joueur est introuvable", true)
return noone;