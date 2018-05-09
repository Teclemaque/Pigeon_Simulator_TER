///gestionRenseignement(id)
{
Agent = argument[0];
R = ds_list_find_index(Renseignement,Agent)//On cherche si le renseignement existe deja
                        
if R != -1//si c'est le cas on le supprime et on le met a jour sinon on l'ajoute simplement
    {
    ds_list_delete(Renseignement, R+1);
    ds_list_delete(Renseignement, R);
    }
ds_list_add(Renseignement,Agent.id,string(Agent.Troupe)+" de taille : "+string(ds_list_size(Agent.Regiment))+" a "+string(obj_globVar.Temps)+ " en "+string(Agent.x)+":"+string(Agent.y))//On notifie le renseignement

if ds_list_size(Renseignement)> 60
    {
    R = choose(0,0,0,0,0,2,2,2,2,4,4,4,6,6,8);

    ds_list_delete(Renseignement,R+1);
    ds_list_delete(Renseignement,R);
    }
exit;
}
