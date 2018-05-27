/// Split_Sentence(:string, delimiter:string):array<string>
//show_debug_message("########DEBUT")
var s = argument[0], d = argument[1];

var len = string_length(s);
// suppression des espaces en queue
while( string_char_at(s, len) == ' ' ){
    //show_debug_message("crop at end : " + '"' + s + '"');
    s = string_copy(s, 0, len -1);
    len = string_length(s);
}

// suppression des espaces en tête
while( string_char_at(s, 0) == ' ' ){
    //show_debug_message("crop at start : " + '"' + s + '"');
    s = string_copy(s, 2, len-1);
    len = string_length(s);
}

var rl = ds_list_create();
var p = string_pos(d, s);
var dl = string_length(d);
//ds_list_clear(rl);
if (dl) while (p) {
    p -= 1;

    var substr = string_copy(s, 1, p);
    if(substr != " " && substr != ""){
        ds_list_add(rl, substr);
    }
    
    s = string_delete(s, 1, p + dl);
    p = string_pos(d, s);
}
ds_list_add(rl, s);
// create an array and store results:
var rn = ds_list_size(rl), rw;
if (os_browser != browser_not_a_browser) {
    rw[0] = rl[|0]; // initial allocation
    for (p = 1; p < rn; p++) rw[p] = rl[|p];
} else {
    p = rn; while (--p >= 0) rw[p] = rl[|p];
}

//Conversion de l'array en ds_list
/*
var sentence = ds_list_create();
for(l=0;l<array_length_1d(rw);l++)
{
    show_debug_message("j'ajoute "+string(rw[l]))
    ds_list_add(sentence,string(rw[l]));
}
//show_list(sentence);
*/
//show_debug_message("########FIN");

return rw;
//return sentence;
