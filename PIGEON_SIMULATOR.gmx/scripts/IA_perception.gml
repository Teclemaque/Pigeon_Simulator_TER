///IA_perception()
{
A = noone;

if instance_exists(Allie)
or instance_exists(Ennemi)
    {
    if instance_exists(Allie)
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
                if ds_exists(PerceptAgentAllie, ds_type_list)
                    {
                    if instance_exists(A.Officier)
                        {
                        if is_undefined(ds_list_find_value(PerceptAgentAllie,I)) == false//Si l'agent existe deja dans la liste 
                            {
                            ds_list_replace(PerceptAgentAllie,I,A.Officier.id);//On replace son id dans la liste
                            }
                        else
                            {
                            ds_list_add(PerceptAgentAllie,A.Officier.id);//si on l'ajoute a la liste
                            }
                        if A.Officier.id == id
                            {
                            for (i = 0; i < ds_list_size(Regiment); i++)
                                {
                                instance_deactivate_object(ds_list_find_value(Regiment,i));
                                }
                            }
                        else
                            {
                            if ds_exists(A.Officier.Regiment,ds_type_list)//et on le desactive pour qu'il ne soit plis pris en compte
                                {
                                for (i = 0; i < ds_list_size(A.Officier.Regiment); i++)
                                    {
                                    instance_deactivate_object(ds_list_find_value(A.Officier.Regiment,i));
                                    }
                                }
                            instance_deactivate_object(A.Officier)
                            }
                        }
                    else
                        {
                        instance_deactivate_object(A);
                        }
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
                    if ds_exists(PerceptAgentEnnemi, ds_type_list)
                        {
                        if ds_list_empty(PerceptAgentEnnemi) && is_undefined(ds_list_find_value(PerceptAgentEnnemi,I)) == false 
                                {
                                ds_list_replace(PerceptAgentEnnemi,I,A.Officier.id);//On place son id dans la liste
                                }
                            else
                                {
                                ds_list_add(PerceptAgentEnnemi,A.Officier.id);
                                }
                        if ds_exists(A.Officier.Regiment,ds_type_list)//et on le desactive pour qu'il ne soit plis pris en compte
                            {
                            for (i = 0; i < ds_list_size(A.Officier.Regiment); i++)
                                {
                                instance_deactivate_object(ds_list_find_value(A.Officier.Regiment,i));
                                }
                            }
                        instance_deactivate_object(A.Officier)
                    }
                    else
                        {
                        instance_deactivate_object(A);
                        }//et on le desactive pour qu'il ne soit plis pris en compte   
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
