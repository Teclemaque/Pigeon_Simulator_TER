//TAL VALIDATEUR
{
//La phrase de test à valider
var phrase = "Tue Soldat1";

//La liste qui contiendra les mots de la phrase
var s = ds_list_create();

//Integration des mots dans la liste

/*
var i = 0;
while(i<string_length(phrase))
{
    ds_list_add(s,string_copy(phrase,i,string_pos(" ",phrase)));
    i=string_pos(" ",phrase)+1;
}
*/

for(var i=0;i<string_length(phrase);i++)
{

}

//Affichage
for(j=0;j<ds_list_size(s);i++)
{
    show_debug_message(ds_list_find_value(s,j));
}

}
