/// list_to_string(:ds_list) :string

var s=argument[0];

show_debug_message("AFFICHAGE")
for(p=0;p<ds_list_size(s);p++)
{
    show_debug_message(ds_list_find_value(s,p));
}
