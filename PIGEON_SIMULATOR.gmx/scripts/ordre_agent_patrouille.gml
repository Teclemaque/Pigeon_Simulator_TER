/// ordre agent patrouille
/// @param ordre 


var params = argument0;


if(ds_map_exists(params, "path")){
 var path = params[? "path"];
 path_start(path, 20, path_action_reverse, true);
}
