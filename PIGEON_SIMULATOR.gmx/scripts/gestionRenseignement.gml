///gestionRenseignement(id)
{
Agent = argument[0];

if instance_exists(Agent)
    {
    for (i = 0; i < ds_list_size(Renseignement); i++)
        {
        R[] = 0;
        R = ds_list_find_value(Renseignement,i)
        
        if R[1] == Agent.Name
            {
            ds_list_delete(Renseignement,i)
            break;
            }
        }
    Rens[] = 0;
    
    Rens[0] = "RENSEIGNEMENT TROUPE";
    Rens[1] = Agent.Name;
    Rens[2] = ds_list_size(Agent.Regiment);
    Rens[3] = Agent.x;
    Rens[4] = Agent.y;
    Rens[5] = obj_globVar.Temps;
    
    ds_list_add(Renseignement,Rens);
    
    if ds_list_size(Renseignement) >= 15
        {
        ds_list_delete(Renseignement, choose(0,0,0,0,1,1,1,2,2,3,4));
        }
    /*R = ds_list_find_index(Renseignement,Agent.Name)//On cherche si le renseignement existe deja
                            
    if R != -1//si c'est le cas on le supprime et on le met a jour sinon on l'ajoute simplement
        {
        ds_list_delete(Renseignement, R+5);
        ds_list_delete(Renseignement, R+4);
        ds_list_delete(Renseignement, R+3);
        ds_list_delete(Renseignement, R+2);
        ds_list_delete(Renseignement, R+1);
        ds_list_delete(Renseignement, R);
        }
    //ds_list_add(Renseignement,string(Agent.Troupe)+" de taille : "+string(ds_list_size(Agent.Regiment))+" a "+string(obj_globVar.Temps)+ " en "+string(Agent.x)+":"+string(Agent.y))//On notifie le renseignement
    ds_list_add(Renseignement,"RENSEIGNEMENT TROUPE",Agent.Name,ds_list_size(Agent.Regiment),Agent.x,Agent.y,obj_globVar.Temps)
    
    if ds_list_size(Renseignement)> 36
        {
        R = choose(0,0,0,0,6,6,6,12,12,18,24)//,5,6,7,round(random(ds_list_size(Renseignement)-20)+20));
        
        ds_list_delete(Renseignement, R+5);
        ds_list_delete(Renseignement, R+4);
        ds_list_delete(Renseignement, R+3);
        ds_list_delete(Renseignement, R+2);
        ds_list_delete(Renseignement, R+1);
        ds_list_delete(Renseignement,R);
        }*/
    }
exit;
}