/// get_action_from_text(text:string):Action

// todo : câbler sur Marius

var action = ds_map_create();

var agentX = instance_find(obj_agent, 0).id;

// en attendant : action bidon
// action "agentX vas vers 1024:2048 " 
action[? "Erreur"] = noone;
action[? "Context"] = argument0;
action[? "Type"] = "go";
action[? "Target"] = agentX;
action[? "coords_x"] = 1024;
action[? "coords_y"] = 2048;

return action;

