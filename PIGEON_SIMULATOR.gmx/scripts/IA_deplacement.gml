#define IA_Deplacement
///IA_Deplacement(Path,Cible,Object,X,Y,Direction,Temps,Cadence,Type,Alpha_Tolerance,Ordre)
{
Cible = Argument[1];
X = Argument[3];
Y = Argument[4];

Dir = Argument[5];
Cadence = Argument[7];
Ordre = Argument[10];
Alpha = Argument[9];


sprite_index = spr_soldat_marche;
image_speed = 0.3;

//speed = 2
//Dir1 = Argument[5];

if Cadence != 0 
     {
     if Cadence < MSpeed
         {speed = Cadence;}
     else
         {speed = MSpeed;}
     }
else
     {
     speed = MSpeed/10;
     }  

if (Ordre == 0)//Ce Deplamcement n'est pas le fait d'un ordre mais d'une situation sans danger
    {
    if Dir != -1
        {
        Dir1 = Dir+random(5)-2.5;
        }
    else
        {
        Dir1 = random(90)-45;
        }
    if Argument[6] != -1  
        {
        Argument[6]--;
            
        if Argument[6] <= 1
            {
            Argument[0] = 0;
            Argument[1] = random(180)+30;
            Execute = IA_Repos;
            exit;
            } 
        } 
    /*if instance_exists(Cible)
        {
        if distance_to_object(Cible) > 5
            {
            speed = MSpeed/5
            Dir1 = point_direction(x,y,Cible.x,Cible.y)+random(10)-5
            }
        }
    else
        {
        //Argument[0] = 01
        //Execute = IA_Repos;
        //return 0
        }*/
    }
else
    {
    // Gestion de la vitesse de l'agent en fonction de la cadence demandé par le paramètre              

    if path_exists(Argument[0])//On regarde si on a donné en Argument l'identifiant d'un path
        {
        path_start(Argument[0],speed,Argument[6],1)
        }
    else
        {
        if instance_exists(Cible)// Lui avons nous donné une cible
            {
            Dir1 = point_direction(x,y,Cible.x,Cible.y);
            if distance_to_object(Cible) < 1
                {
                exit;
                }
            }
        else
            {
            if Argument[2] != noone // Un objet à chercher
                {
                if Argument[5] != -1
                    {
                    if Argument[6] != -1
                        {
                        Cible = instance_nearest(x+lengthdir_x(Argument[6],Argument[5]),y+lengthdir_y(Argument[6],Argument[5]),Argument[2]);
                        }
                    else
                        {
                        Cible = instance_nearest(x+lengthdir_x(500,Argument[6]),y+lengthdir_y(500,Argument[5]),Argument[2]); 
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
                if (X != -1 && Y != -1)
                    {
                    Dir1 = point_direction(x,y,X,Y);
                    if (distance_to_point(X,Y) == 0)
                        {
                        Argument[0] = 0;
                        Execute = IA_Repos;
                        }
                    }
                else
                    {
                    if Dir != -1 // Une direction dans laquelle se diriger.
                        {
                        Dir1 = Dir;
                        
                        //if Argument[6] != -1
                        //    {
                        //    Argument[6] --;
                        //    }
                        //if Argument[6] == 0
                        //    {
                        //    if Argument[8] != 0
                        //       {
                        //        //FAIRE 1/2 TOUR
                        //        } 
                        //    }
                        }
                    else
                        {
                        Argument[0] = 0;
                        Argument[1] = Chance;
                        Execute = IA_Repos;
                        //return 0
                        }
                    }
                }
            }
        }
    }
exit;
}

#define IA_Deplacement_Soldat
///IA_Deplacement_Soldat(Path,Cible,Object,X,Y,Direction,Temps,Cadence,Type,Alpha_Tolerance,Ordre)
{
if instance_exists(Officier)
    {
    Cible = Argument[1]
    X = Argument[3];
    Y = Argument[4];
    Dir = Argument[5];
    Cadence = Argument[7];
    Ordre = Argument[10];
    Alpha = Argument[9];
    
    sprite_index = spr_soldat_marche;
    image_speed = 0.3;
    
    //speed = 2
    //Dir1 = Argument[5];
    
    if Cadence != 0 
         {
         if Cadence < MSpeed
             {speed = Cadence;}
         else
             {speed = MSpeed;}
         }
    else
         {
         speed = MSpeed/10;
         }  
    
    if (Ordre == 0)//Ce Deplamcement n'est pas le fait d'un ordre mais d'une situation sans danger
        {
        if instance_exists(Cible)// != noone
            {
            Dir1 = point_direction(x,y,Cible.x,Cible.y);
            
            if distance_to_object(Cible) < 2*Chance
                {
                Argument[0] = 0;
                Argument[1] = Chance;
                Execute = IA_Repos_Soldat;
                }
            }
        else
            {
            if Dir != -1
                {
                Dir1 = Dir//+random(5)-2.5;
                }
            else
                {
                Dir1 = random(90)-45;
                }
                
            if Argument[6] != -1  
                {
                Argument[6]--;
                    
                if Argument[6] <= 1
                    {
                    Argument[0] = 0;
                    Argument[1] = Chance+30;
                    Execute = IA_Repos_Soldat;
                    exit;
                    } 
                }
            }
        }
    else
        {
        // Gestion de la vitesse de l'agent en fonction de la cadence demandé par le paramètre              
    
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
                
                if distance_to_object(Cible) < 1
                    {
                    Argument[0] = 0;
                    Argument[1] = -1;
                    Execute = IA_Repos_Soldat;
                    }
                }
            else
                {
                if Argument[2] != noone // Un objet à chercher
                    {
                    if Argument[5] != -1
                        {
                        if Argument[6] != -1
                            {
                            Cible = instance_nearest(x+lengthdir_x(Argument[6],Argument[5]),y+lengthdir_y(Argument[6],Argument[5]),Argument[2]);
                            }
                        else
                            {
                            Cible = instance_nearest(x+lengthdir_x(500,Argument[6]),y+lengthdir_y(500,Argument[5]),Argument[2]); 
                            }
                        }
                    else
                        {
                        Cible = instance_nearest(x,y,Argument[2]);
                        }
                    Dir1 = point_direction(x,y,Cible.x,Cible.y)
                    
                    if distance_to_object(Cible) < 1
                        {
                        Argument[0] = 0;
                        Argument[1] = -1;
                        Execute = IA_Repos_Soldat;
                        }
                    }
                else
                    {
                    if (X != -1 && Y != -1)
                        {
                        Dir1 = point_direction(x,y,X,Y);
                        
                        if (distance_to_point(X,Y) == 0)
                            {
                            Argument[0] = 0;
                            Argument[1] = -1;
                            Execute = IA_Repos_Soldat;
                            }
                        }
                    else
                        {
                        if Dir != -1 // Une direction dans laquelle se diriger.
                            {
                            Dir1 = Dir;
                            
                            if Argument[6] != -1
                                {
                                Argument[6] --;
                                }
                            if Argument[6] == 0
                                {
                                if Argument[8] != 0
                                   {
                                    //FAIRE 1/2 TOUR
                                   }
                                else
                                    {
                                    Argument[0] = 0;
                                    Argument[1] = -1;
                                    Execute = IA_Repos_Soldat;
                                    exit;
                                    } 
                                }
                            }
                        else
                            {
                            Argument[0] = 0;
                            Argument[1] = -1;
                            Execute = IA_Repos_Soldat;
                            exit;
                            }
                        }
                    }
                }
            }
        }
    }
exit;
}