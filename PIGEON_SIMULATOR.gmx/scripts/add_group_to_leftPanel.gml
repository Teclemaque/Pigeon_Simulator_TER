///add_group_to_leftPanel(selection)
/// @param ds_list d'agents
/// ajoute un rectangle de groupe au panneau gauche referencant la selection

var selection = argument0;
var panel = global.GUI.leftPanel;
var posX = panel.rect_x
var rect_y_start = panel.rect_y
var rectCount = ds_list_size(panel.Groupes);
var padding = panel.rect_padding;
var rect_x = panel.rect_x

var rect_y;
if(ds_list_empty(panel.Groupes)){
    rect_y = rect_y_start
}else {
    var lastRect = ds_list_find_value(panel.Groupes, ds_list_size(panel.Groupes) -1);
    rect_y = 400
    rect_y = lastRect.y + lastRect.height + padding
}

// créer le rectangle_groupe et l'initialiser
var rect = instance_create(rect_x, rect_y, obj_group_rectangle);
ds_list_copy(rect.groupe, selection);

// créer le bouton supprimer associé au rectangle
var btn_y = rect.y +rect.height/ 2 - sprite_get_width(spr_icon_minus) / 2
var btn_suppr = instance_create( rect.x + rect.width , btn_y , obj_btn_minus);
btn_suppr.rectangle_groupe = rect;
btn_suppr.index = rectCount
rect.btn_suppr = btn_suppr;


ds_list_add(panel.Groupes, rect);
