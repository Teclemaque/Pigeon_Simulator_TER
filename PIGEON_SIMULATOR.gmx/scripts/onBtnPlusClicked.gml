/// onBtnPlusClicked(btn_id)
show_debug_message("clic");

var selection = obj_GUI_controller.Selection;
// var selection = global.GUI.Selection;

if(!ds_list_empty(selection)){
    show_debug_message("Ajout de " + ds_list_size(selection) + " elements à leftPanel");
    var targets = global.GUI.toolbox.Targets;
    ds_list_copy(targets, selection ) // todo : verifier memory leak

    add_group_to_leftPanel(selection)
} else {
    show_debug_message("Selection vide");
}