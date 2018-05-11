/// get_targets_names(Targets:ds_list<Agent>)
/// retourne la chaine issue des noms des agents selectionnés
var targets = argument0;
var text = "";

if( !ds_list_empty(targets) ){
    for(var i = 0; i < ds_list_size(targets); i++){
        text += string(ds_list_find_value(targets, i).id);
            text += ", ";
    }   
    ds_list_clear(targets)
}

return text;
