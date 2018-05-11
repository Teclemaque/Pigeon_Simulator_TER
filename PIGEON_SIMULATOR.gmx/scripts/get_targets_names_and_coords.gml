/// get_targets_names_and_coords(Targets:ds_list<Agent>, last_clicked_x, last_clicked_y)
/// retourne la chaine issue des noms des agents selectionnés ou des coordonnées ciblées
var targets = argument0;
var old_x = argument1;
var old_y = argument2;
var text = "";

if( !ds_list_empty(targets) ){
    for(var i = 0; i < ds_list_size(targets); i++){
        text += string(ds_list_find_value(targets, i).id);
        //if(i < ds_list_size(targets) - 1) 
            text += ", ";
    }   
    ds_list_clear(targets)
}else if (old_x != noone && old_y != noone
            && mouse_x == old_x && mouse_y == old_y) {
    text += string(mouse_x) + ":" + string(mouse_y)
    old_x = noone;
    old_y = noone;
}

return text;
