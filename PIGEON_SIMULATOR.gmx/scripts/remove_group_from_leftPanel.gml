///remove_group_from_leftPanel(index)
/// @param int index dans la liste des groupes du leftPanel

var index = argument0;
var panel = global.GUI.leftPanel;

var listSize = ds_list_size( panel.Groupes );

if(index > listSize - 1){
    show_error("l'index du groupe a supprimer n'existe pas", true);
}

var rectList = panel.Groupes;
var toRemove = ds_list_find_value(rectList,index);

for(var i = listSize -1; i > index; i--){
    var current = ds_list_find_value(rectList,i);
    var previous = ds_list_find_value(rectList,i-1);
    
    var dy = current.y - previous.y;

    current.y = current.y - dy ; // remonter sur la position de son predecesseur
//    current.btn_suppr.y = current.y + (current.height - sprite_height)//2//current.btn_suppr.y - dy
    current.btn_suppr.index--;
}

ds_list_delete(rectList, index)
with(rectangle_groupe){
    instance_destroy();
}

instance_destroy() // detruire l'objet btn_minus
