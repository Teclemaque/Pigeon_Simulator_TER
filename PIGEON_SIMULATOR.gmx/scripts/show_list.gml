/// show_list(:ds_list)

var s=argument[0];

var res="[";
for(p=0;p<ds_list_size(s);p++)
{
    res+=ds_list_find_value(s,p);
    if(p<ds_list_size(s)-1)
        res+=", ";
}
res+="]";

show_debug_message(res);
