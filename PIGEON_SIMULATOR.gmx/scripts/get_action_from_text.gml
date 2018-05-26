/// get_action_from_text(text:string):Action

// todo : câbler sur Marius

var input = Split_Sentence(argument0, " ");
var analyzed = CYK(input, global.grammaire);

if( is_string(analyzed) ){
    show_debug_message("Erreur : " + analyzed);
    // todo : mettre l'erreur dans la toolbox
    exit;
}else if (!is_array(analyzed)){
    log_toolbox_message("Erreur : le retour de CYK n'est pas un tableau", c_red);
    exit;
}

var target = analyzed[0];
var operation = analyzed[1];
var reste = analyzed[2];

var len = array_length_1d(analyzed)

show_debug_message("INPUT");
show_debug_message(input);

show_debug_message("Taille du retour : " + string(len))
show_debug_message("target : " + string(target));




var action = ds_map_create();

var agentX = instance_find(obj_agent, 0).id;

// en attendant : action bidon
// action "agentX vas vers 1024:2048 " 
action[? "Erreur"] = noone;
action[? "Context"] = argument0;
action[? "Type"] = "ordre";
action[? "Action"] = "move";
action[? "Target"] = agentX;
action[? "coords_x"] = random(room_width);
action[? "coords_y"] = random(room_height);

return action;