/// get_selectable_agent(x_coord, y_coord)
/// @returns la premiere instance cliquable sous les coordonnées données

var x_coord = argument0;
var y_coord = argument1;

var agent_types = ds_list_create();

ds_list_add( agent_types, obj_general, obj_agent, obj_messager );

var hit = noone;// instance_position(x_coord, y_coord, obj_agent); // agent sous la souris

for(i = 0; i < ds_list_size(agent_types); i++ ){
    hit = instance_position(x_coord, y_coord, agent_types[| i]);
    if( hit != noone) break;
}

return hit;