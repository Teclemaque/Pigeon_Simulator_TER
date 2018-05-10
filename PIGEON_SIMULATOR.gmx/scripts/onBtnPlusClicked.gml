/// onBtnPlusClicked(btn_id)
show_debug_message("clic");

var selection = global.GUI.Selection;
    
if(!ds_list_empty(selection)){
    var targets = global.GUI.toolbox.Targets;
    ds_list_copy(targets, selection ) // todo : verifier memory leak

    add_group_to_leftPanel(selection)
}