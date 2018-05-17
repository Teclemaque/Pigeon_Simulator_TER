/// log_toolbox_message(msg : string, color : c_col)
/// ajoute à la file de messages, sous le champ texte de la toolbox, le contenu de msg
/// @param msg : le message (string)
/// @param color : la couleur à utiliser, de type c_col (c_red,c_blue, etc.)


var color = argument1;
var msg = argument0;

ds_list_add(obj_toolbox.log, msg);
ds_list_add(obj_toolbox.log_colors, color);

if(ds_list_size(obj_toolbox.log)> obj_toolbox.log_size){
    ds_list_delete(obj_toolbox.log, 0);
    ds_list_delete(obj_toolbox.log_colors, 0);
}
