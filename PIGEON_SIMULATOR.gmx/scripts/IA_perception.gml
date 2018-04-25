///IA_perception()
{
A = noone;

if instance_exists(Allie)
or instance_exists(Ennemi)
    {
    if instance_exists(Allie)//Si il existe des agents alliés
        {
        A = instance_nearest(xx,y,Allie);

        if A.id != id //Et que ce n'est pas lui
            {
            if map_visible(A.id) == false//collision_line(xx,y,A.x,A.y,Obj_Terrain_Crete,1,1) != noone //Si presence d'un obstacle entre eux
            or (abs(direction - point_direction(xx,y,A.x,A.y)) > 90 && abs(direction - point_direction(xx,y,A.x,A.y)) < 270)  //Si agent n'est pas dans son champ de perception
                {
                instance_deactivate_object(A); //on le desactive pour ne plus le prendre en compte
                }
            else
                {
                if ds_exists(PerceptAgentAllie, ds_type_list)//On vérifie que la liste existe
                    {
                    //if A.Classe == 0 // Si A est un simple soldat
                    
                       
                    if instance_exists(A.Officier)//On recherche l'officier
                        {
                        Agent = A.Officier;
                        ds_list_add(PerceptAgentAllie,Agent);//on l'ajoute a la liste
                        
                        gestionRenseignement(Agent);
                        // on désactive son régiment
                        if ds_exists(Agent.Regiment,ds_type_list)//et on le desactive pour qu'il ne soit plus pris en compte
                            {
                            for (i = 1; i < ds_list_size(Agent.Regiment); i++)
                                {
                                instance_deactivate_object(ds_list_find_value(Agent.Regiment,i));
                                }
                            }
                        //Et on desactive l'officier
                        instance_deactivate_object(Agent);  
                        //instance_deactivate_object(A);
                        }
                    instance_deactivate_object(A);
                    }
                }
            }
        }
           
    if instance_exists(Ennemi)
        { 
        A = instance_nearest(xx,y,Ennemi);//Recherche de l'agent le plus proche
        
        if A.id != id //Et que ce n'est pas lui
            {
            if map_visible(A.id) == false//collision_line(xx,y,A.xx,A.y,Obj_Terrain_Crete,1,1) != noone //Si presence d'un obstacle entre eux
            or (abs(direction - point_direction(xx,y,A.x,A.y)) > 90 && abs(direction - point_direction(xx,y,A.x,A.y)) < 270)//Si agent n'est pas dans son champ de perception
                {
                instance_deactivate_object(A); //on le desactive pour ne plus le prendre en compte
                }
            else
                {
                if instance_exists(A.Officier)
                    {
                    Agent = A.Officier;
                    if ds_exists(PerceptAgentEnnemi, ds_type_list)
                        {
                        /*if ds_list_empty(PerceptAgentEnnemi) && is_undefined(ds_list_find_value(PerceptAgentEnnemi,I)) == false 
                                {
                                ds_list_replace(PerceptAgentEnnemi,I,A.Officier);//On place son id dans la liste
                                }
                            else*/
                                {
                                ds_list_add(PerceptAgentEnnemi,Agent);
                                gestionRenseignement(Agent);
                                }
                        if ds_exists(Agent.Regiment,ds_type_list)//et on le desactive pour qu'il ne soit plis pris en compte
                            {
                            for (i = 1; i < ds_list_size(Agent.Regiment); i++)
                                {
                                instance_deactivate_object(ds_list_find_value(Agent.Regiment,i));
                                }
                            }
                        instance_deactivate_object(Agent)
                    }
                instance_deactivate_object(A)
                /*else
                    {
                    ;
                    }//et on le desactive pour qu'il ne soit plis pris en compte   */
                I++;
                }
            }
        }
    }
    II++;
    
    if II < 20
    or (ds_exists(PerceptAgentEnnemi, ds_type_list) && ds_list_size(PerceptAgentEnnemi) <= 7)
        {
        if A.id != id
            {
            if I <= 10
                {IA_Perception();}
            }
        }
    else
        {
        exit;
        }
    }
exit;
}
