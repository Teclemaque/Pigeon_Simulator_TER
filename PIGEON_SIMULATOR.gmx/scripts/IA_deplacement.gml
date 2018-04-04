///IA_Deplacement(Path,Cible,Object,Direction,Temps,Cadence,Type,Alpha_Tolerance,Ordre)
{
Cadence = Argument[5];
Ordre = Argument[8];
Alpha = Argument[7];
sprite_index = spr_soldat_marche;
image_speed = 0.3;

if Ordre == 0
    {
    if instance_exists(Cible)
        {
        if distance_to_object(Cible) > 5
            {
            speed = 5
            Dir1 = point_direction(x,y,Cible.x,Cible.y)+random(10)-5
            }
        }
    else
        {
        Argument[0] = 0;
        Execute = IA_Repos;
        return 0
        }
    }
else
    {
    //Execute = IA_Deplacement;
    
    // Gestion de la vitesse de l'agent en fonction de la cadence demandé par le paramètre
    if Cadence != 0 
        {
        if Cadence < MSpeed
            {speed = Cadence;}
        else
            {speed = MSpeed;}
        }
   else
        {
        speed = MSpeed/6;
        }                

    if path_exists(Argument[0])//On regarde si on a donné en Argument l'identifiant d'un path
        {
        path_start(Argument[0],speed,Argument[6],1)
        }
    else
        {
        if instance_exists(Argument[1])// Lui avons nous donné une cible
            {
            Cible = Argument[1];
            Dir1 = point_direction(x,y,Cible.x,Cible.y);
            }
        else
            {
            if Argument[2] != noone // Un objet à chercher
                {
                if Argument[3] != -1
                    {
                    if Argument[4] != -1
                        {
                        Cible = instance_nearest(x+lengthdir_x(Argument[4],Argument[3]),y+lengthdir_y(Argument[4],Argument[3]),Argument[2]);
                        }
                    else
                        {
                        Cible = instance_nearest(x+lengthdir_x(500,Argument[3]),y+lengthdir_y(500,Argument[3]),Argument[2]); 
                        }
                    }
                else
                    {
                    Cible = instance_nearest(x,y,Argument[2]);
                    }
                Dir1 = point_direction(x,y,Cible.x,Cible.y)
                }
            else
                {
                if Argument[3] != -1 // Une direction dans laquelle se diriger.
                    {
                    Dir1 = Argument[3];
                    
                    if Argument[4] != -1
                        {
                        Argument[4] --;
                        }
                    if Argument[4] == 0
                        {
                        if Argument[6] != 0
                            {
                            //FAIRE 1/2 TOUR
                            } 
                        }
                    }
                else
                    {
                    Argument[0] = 0;
                    Execute = IA_Repos;
                    return 0
                    }
                }
            }
        }
    }
exit;
}
