///gestionRenseignement(id)
{
Agent = argument[0];

if instance_exists(Agent)
    {
    for (i = 0; i < ds_list_size(Renseignement); i++)
        {
        R[] = 0;
        R = ds_list_find_value(Renseignement,i)
        
        if string(R[1]) == string(Agent.Name)
            {
            ds_list_delete(Renseignement,i)
            break;
            }
        }
    Rens[] = 0;
    
    Rens[0] = "RENSEIGNEMENT";
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
    }
exit;
}
