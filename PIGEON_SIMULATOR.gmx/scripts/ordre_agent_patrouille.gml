/* ordre agent patrouille
 * Params (dans argument0 de type ds_map)
 *  - path : l'ID du path à suivre
 */

var params = argument0;


if(ds_map_exists(params, "path")){
 var path = params[? "path"];
 path_start(path, 20, path_action_reverse, true);
}

