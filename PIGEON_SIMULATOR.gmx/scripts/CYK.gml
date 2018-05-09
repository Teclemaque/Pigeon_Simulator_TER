//CYK(phrase:array<string>, rules:ds_list):

//Construction de la matrice CYK : width=step, heigth=word
var p = argument[0];
var r = argument[1];
var cyk = ds_grid_create(array_length_1d(p),array_length_1d(p));
//Cas initial
for(i=0;i<array_length_1d(p);i++)
{
    show_debug_message("JE TRAITE "+p[i]);
    for(j=0;j<ds_list_size(r);j++)
    {
        tmp=ds_list_find_value(r,j);
        show_debug_message(tmp);
        if(array_length_1d(tmp[1])==1)
        {
            show_debug_message("    GOOD !");
            t = tmp[1];
            show_debug_message(t[0]);
            if(t[0]==p[i])
            {
                show_debug_message("        JE MARCHE !")
                ds_grid_add(cyk,0,i,tmp[0]);
            }
        }
    }
}

for(i=1;i<array_length_1d(p);i++)
{
    for(j=0;j<array_length_1d(p)-1;j++)
    {
        for(k=0;k<i;k++)
        {
            for(m=0;m<ds_list_size(r);m++)
            {
                tmp=ds_list_find_value(r,m);
                show_debug_message(tmp);
                if(array_length_1d(tmp[1])==2)
                {
                    show_debug_message("    JE MARCHE");
                    t=tmp[1];
                    if((string(ds_grid_get(cyk,k,j))==string(t[0]))&&(string(ds_grid_get(cyk,i-k-1,j+k+1))==string(t[1])))
                    {
                        ds_grid_add(cyk,i,j,tmp[0]);
                    }
                }
            }
        }
    }
}
//BLOC CYK
show_debug_message("AFFICHAGE DU CYK :")
display="";
for(i=0;i<array_length_1d(p);i++)
{
    display+=p[i]+" ";
}
show_debug_message(display);

for(l=0;l<ds_grid_width(cyk);l++)
{
    show_debug_message("Etape "+string(l));
    display="";
    for(t=0;t<ds_grid_height(cyk);t++)
    {
        display+=string(ds_grid_get(cyk,l,t))+" ";
    }
    show_debug_message(display);
}
//FIN BLOC CYK

//Creation de l'orderMap
//Liste Keys : 0=sujet, 1=action, 2=cibles, 3=options

var orderMap=ds_map_create();
ds_map_add_list(orderMap, 0, ds_list_create());
ds_map_add_list(orderMap, 1, ds_list_create());
ds_map_add_list(orderMap, 2, ds_list_create());
ds_map_add_list(orderMap, 3, ds_list_create());
show_debug_message("AFFICHAGE DE ORDERMAP :");
show_debug_message(json_encode(orderMap));

//Lancement d'Extract_Order
Extract_Order(p, cyk, ds_grid_width(cyk)-1,0,orderMap,0);
show_debug_message(json_encode(orderMap));