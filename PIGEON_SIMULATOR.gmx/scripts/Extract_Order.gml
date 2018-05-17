///Extract_Order(phrase:array<string>, cyk:ds_grid, currentStep:int, currentWord:int, orderMap:ds_map, orderInd:int):

var p=argument[0];
var cyk=argument[1];
var currentStep=argument[2];
var currentWord=argument[3];
//Map Key: 0=cible, 1=action, 2=parametres, 3=options
var orderMap=argument[4];
var orderInd = argument[5];

if(currentStep==0)
{
    show_debug_message("Je stocke");
    if(orderInd==1)
    {
        ds_list_add(ds_map_find_value(orderMap,orderInd),ds_grid_get(cyk,0,currentWord));
    }
    else
    {
        ds_list_add(ds_map_find_value(orderMap,orderInd),p[currentWord]);
    }
}
else
{
    show_debug_message("Je lance la boucle");
    var token = ds_grid_get(cyk,currentStep,currentWord)
    // todo : repérer et faire remonter les erreurs ici
    if( !is_string(token) ){
        //token = "erreur : tenter de caster en string ?"
        show_debug_message(token); // en général lors d'une erreur : 0 (int)
        log_toolbox_message("Extract_Order : Impossible de lire " + string(token), c_red);
        token = ""; // corriger comme on peut pour eviter le plantage
    }
    switch(token)
    {
        case "S":
            show_debug_message("Cas S :");
            for(i=currentStep-1;i>=0;i--)
            {
                for(r=0;r<ds_list_size(grammaire);r++)
                {
                    var rule=ds_list_find_value(grammaire,r);
                    if( !is_array(rule) ){
                        log_toolbox_message("Extract_Order : Erreur, rule n'est pas un array. rule : " + string(rule), c_red);
                        exit;
                    }
                    var tmp = rule[1];
                    if(array_length_1d(tmp)==2)
                    {                        
                        if((string(rule[0])==string(ds_grid_get(cyk,currentStep,currentWord)))&&(string(ds_grid_get(cyk,i,currentWord))==string(tmp[0]))&&(string(ds_grid_get(cyk,currentStep-i-1,currentWord+i+1))==string(tmp[1])))
                        {
                            Extract_Order(p,cyk,i,currentWord,orderMap,0);
                            Extract_Order(p,cyk,currentStep-i-1,currentWord+i+1,orderMap,1);
                            break;
                        }
                    }
                }
            }
            break;
        case "GN":
            show_debug_message("Cas GN :");
            for(i=currentStep-1;i>=0;i--)
            {
                for(r=0;r<ds_list_size(grammaire);r++)
                {
                    var rule=ds_list_find_value(grammaire,r);
                    var tmp = rule[1];
                    if(array_length_1d(tmp)==2)
                    {                        
                        if((string(rule[0])==string(ds_grid_get(cyk,currentStep,currentWord)))&&(string(ds_grid_get(cyk,i,currentWord))==string(tmp[0]))&&(string(ds_grid_get(cyk,currentStep-i-1,currentWord+i+1))==string(tmp[1])))
                        {
                            Extract_Order(p,cyk,i,currentWord,orderMap,orderInd);
                            Extract_Order(p,cyk,currentStep-i-1,currentWord+i+1,orderMap,orderInd);
                            break;
                        }
                    }
                }
            }
            break;
        case "GV":
            show_debug_message("Cas GV :");
            for(i=currentStep-1;i>=0;i--)
            {
                for(r=0;r<ds_list_size(grammaire);r++)
                {
                    var rule=ds_list_find_value(grammaire,r);
                    var tmp = rule[1];
                    if(array_length_1d(tmp)==2)
                    {                        
                        if((string(rule[0])==string(ds_grid_get(cyk,currentStep,currentWord)))&&(string(ds_grid_get(cyk,i,currentWord))==string(tmp[0]))&&(string(ds_grid_get(cyk,currentStep-i-1,currentWord+i+1))==string(tmp[1])))
                        {
                            Extract_Order(p,cyk,i,currentWord,orderMap,1);
                            Extract_Order(p,cyk,currentStep-i-1,currentWord+i+1,orderMap,2);
                            break;
                        }
                    }
                }
            }
            break;
        case "JOIN":
            show_debug_message("Cas JOIN :");
            for(i=currentStep-1;i>=0;i--)
            {
                for(r=0;r<ds_list_size(grammaire);r++)
                {
                    var rule=ds_list_find_value(grammaire,r);
                    var tmp = rule[1];
                    if(array_length_1d(tmp)==2)
                    {                        
                        if((string(rule[0])==string(ds_grid_get(cyk,currentStep,currentWord)))&&(string(ds_grid_get(cyk,i,currentWord))==string(tmp[0]))&&(string(ds_grid_get(cyk,currentStep-i-1,currentWord+i+1))==string(tmp[1])))
                        {
                            Extract_Order(p,cyk,i,currentWord,orderMap,3);
                            Extract_Order(p,cyk,currentStep-i-1,currentWord+i+1,orderMap,orderInd);
                            break;
                        }
                    }
                }
            }
            break;
        case "CONJ":
            for(i=currentStep-1;i>=0;i--)
            {
                for(r=0;r<ds_list_size(grammaire);r++)
                {
                    var rule=ds_list_find_value(grammaire,r);
                    var tmp = rule[1];
                    if(array_length_1d(tmp)==2)
                    {                        
                        if((string(rule[0])==string(ds_grid_get(cyk,currentStep,currentWord)))&&(string(ds_grid_get(cyk,i,currentWord))==string(tmp[0]))&&(string(ds_grid_get(cyk,currentStep-i-1,currentWord+i+1))==string(tmp[1])))
                        {
                            Extract_Order(p,cyk,i,currentWord,orderMap,3);
                            Extract_Order(p,cyk,currentStep-i-1,currentWord+i+1,orderMap,orderInd);
                            break;
                        }
                    }
                }
            }
            break;
        case "PREPL":
            show_debug_message("Cas PREPL :");
            for(i=currentStep-1;i>=0;i--)
            {
                for(r=0;r<ds_list_size(grammaire);r++)
                {
                    var rule=ds_list_find_value(grammaire,r);
                    var tmp = rule[1];
                    if(array_length_1d(tmp)==2)
                    {                        
                        if((string(rule[0])==string(ds_grid_get(cyk,currentStep,currentWord)))&&(string(ds_grid_get(cyk,i,currentWord))==string(tmp[0]))&&(string(ds_grid_get(cyk,currentStep-i-1,currentWord+i+1))==string(tmp[1])))
                        {
                            Extract_Order(p,cyk,i,currentWord,orderMap,3);
                            Extract_Order(p,cyk,currentStep-i-1,currentWord+i+1,orderMap,2);
                            break;
                        }
                    }
                }
            }
            break;
        default:
            show_debug_message("ERREUR !");
    }
}
