///gestionRenseignement(id)
{
Agent = argument[0];
R = ds_list_find_index(Renseignement,Agent)//On cherche si le renseignement existe deja
                        
if R != -1//si c'est le cas on le supprime et on le met a jour sinon on l'ajoute simplement
    {
    ds_list_delete(Renseignement, R+2);
    ds_list_delete(Renseignement, R+1);
    ds_list_delete(Renseignement, R);
    }
ds_list_add(Renseignement,Agent,ds_list_size(Agent.Regiment),obj_globVar.Temps)//On notifie le renseignement

if ds_list_size(Renseignement)> 90
    {
    R = choose(0,0,0,0,0,3,3,3,3,6,6,6,9,9,12);
    
    ds_list_delete(Renseignement,R+2);
    ds_list_delete(Renseignement,R+1);
    ds_list_delete(Renseignement,R);
    }
exit;
}