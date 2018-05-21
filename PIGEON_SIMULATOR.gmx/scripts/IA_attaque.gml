#define IA_Attaque
///IA_Attaque(ListCible, Combat, Ordre, Cadence, Distance de tir);
{
if MODE = "ATTAQUE"
    {
    if ArgumentAttaque[1] != -1
        {
        Comb = ArgumentAttaque[1];
        }
    else
        {
        Comb = Combat
        }
    if instance_exists(Ennemi) && distance_to_object(instance_nearest(x,y,Ennemi)) < MSpeed/10
        {
        Comb = 0;
        }
        
    Ordre = ArgumentAttaque[2];
    Cadence = ArgumentAttaque[3];
    if Cadence = -1
        {
        Cadence = MSpeed/5;
        }
        
    DFeu = ArgumentAttaque[4];
    
    if DFeu == -1
    or abs(Moral) < 25
        {
        DFeu = 200
        }
    
    if ArgumentAttaque[0] != noone
        {
        Cible = ArgumentAttaque[0];
        }
    else
        {
        Cible = instance_nearest(x,y,Ennemi);
        }

    CIBLE = Cible;
    
    if instance_exists(CIBLE) == false
        {
        MODE = "REPOS"
        Argument[0] = 0;
        Argument[1] = random(180)+90;
        Execute = IA_Repos;
        exit;
        }
    else
        {
        if Comb == 1
            {
            if distance_to_object(CIBLE) < DFeu
                {
                if Recharge < obj_globVar.R_fusil // Variable actuellement globale de temps de recharge, on pourrait aussi faire appel à obj_globVar.R_fusil et plus besoin de globalité. Meilleur optimisation?
                    {
                    Recharge++;
                    Cadence = 0;
                    } 
                else
                    {
                    Dir1 = point_direction(x,y,CIBLE.x,CIBLE.y);
                    if collision_line(x,y,CIBLE.x,CIBLE.y,Allie,1,1) == noone
                        {
                        sound_play(sound_fusil_1);
                        with(instance_create(x,y,obj_arme))
                            {
                            direction = other.direction;//On fait partir la balle dans sa direction
                            ID = other.id;//On s'assure que la balle va pas nous considérer comme la cible
                            }
                        Recharge = 0;
                        }
                    }
                }
            else
                {
                Execute = IA_Deplacement;
                Argument[0] = noone;
                Argument[1] = CIBLE;
                Argument[2] = noone;
                Argument[3] = -1;
                Argument[4] = -1;
                Argument[5] = -1;
                Argument[6] = -1;
                Argument[7] = Cadence;
                Argument[8] = 0;
                Argument[9] = Alpha;
                Argument[10] = Ordre;
                //IA_Deplacement();
                exit;
                }
            }
        else
            {
            if Comb == 0
                {
                if distance_to_object(CIBLE) > 0
                    {
                    Execute = IA_Deplacement;
                    Argument[0] = noone;
                    Argument[1] = CIBLE;
                    Argument[2] = noone;
                    Argument[3] = -1;
                    Argument[4] = -1;
                    Argument[5] = -1;
                    Argument[6] = -1;
                    Argument[7] = Officier.Cadence+MSpeed/10;
                    Argument[8] = 0;
                    Argument[9] = Alpha;
                    Argument[10] = Ordre;
                    //IA_Deplacement();
                    exit;
                    }
                else
                    {
                    Cadence = 0;
                    with(instance_create(x,y,obj_arme_blanche))
                        {
                        direction = other.direction;//On fait partir la balle dans sa direction
                        ID = other.id;
                        }
                    }
                }
            else
                {
                if Comb == 2
                    {
                    if distance_to_object(CIBLE) > 0
                        {
                        if distance_to_object(CIBLE) > 300+3*MSpeed
                            {
                            Cadence = MSpeed/4;
                            }
                        else
                            {
                            if distance_to_object(CIBLE) > 150+2*MSpeed
                                {
                                Cadence = MSpeed/2;
                                }
                            else
                                {
                                if distance_to_object(CIBLE) > 150+MSpeed
                                    {
                                    Cadence = MSpeed - 3;
                                    }
                                }
                            }
                        Execute = IA_Deplacement;
                        Argument[0] = noone;
                        Argument[1] = CIBLE;
                        Argument[2] = noone;
                        Argument[3] = -1;
                        Argument[4] = -1;
                        Argument[5] = -1;
                        Argument[6] = -1;
                        Argument[7] = Cadence;
                        Argument[8] = 0;
                        Argument[9] = Alpha;
                        Argument[10] = Ordre;
                        //IA_Deplacement();
                        exit;
                        }
                    else
                        {
                        Cadence = 0;
                        with(instance_create(x,y,obj_arme_blanche))
                            {
                            direction = other.direction;//On fait partir la balle dans sa direction
                            ID = other.id;
                            }
                        }
                    }
                }
            }
        Execute = IA_Attaque;
        }
    }
    else
        {
        Argument[0] = 1;
        Argument[1] = random(180)+90;
        Execute = IA_Repos
        exit;
        }
    exit;
}

#define IA_Attaque_Soldat
///IA_Attaque_Soldat(ListCible, Combat, Ordre)
{
if instance_exists(Officier)
    {
    if ArgumentAttaque[1] != -1
        {
        Comb = ArgumentAttaque[1];
        }
    else
        {
        Comb = Combat
        }
    Cible = instance_nearest(x,y,Ennemi);
    
    if instance_exists(Ennemi) && distance_to_object(instance_nearest(x,y,Ennemi)) < MSpeed/10
        {
        Comb = 0;
        }
        
    Ordre = ArgumentAttaque[2];
    Cadence = ArgumentAttaque[3];
    if Cadence = -1
        {
        Cadence = Officier.Cadence;//MSpeed/5;
        }
        
    DFeu = ArgumentAttaque[4];
    
    if DFeu == -1
    or abs(Moral) < 25
        {
        DFeu = 300
        }
    
    /*if ds_list_size(Officier.CibleAttaque) > 0
        {
        Cible = ds_list_find_value(Officier.CibleAttaque,round(random(ds_list_size(Officier.CibleAttaque)+1))-1)
        }
    else
        {
        Cible = instance_nearest(x,y,Ennemi);
        }
    */    
    if instance_exists(Cible) == false
        {
        Argument[0] = 1;
        Argument[1] = random(180)+90;
        Execute = IA_Repos
        exit;
        }
    else
        {
        if Comb == 1
            {
            if Officier.Officiel != 1 
                {
                if distance_to_object(Cible) < DFeu
                    {
                    if Recharge < obj_globVar.R_fusil // Variable actuellement globale de temps de recharge, on pourrait aussi faire appel à obj_globVar.R_fusil et plus besoin de globalité. Meilleur optimisation?
                        {
                        Dir1 = point_direction(x,y,Cible.x,Cible.y);
                        Recharge++;
                        Cadence = 0;
                        } 
                    else
                        {
                        if collision_line(x,y,Cible.x,Cible.y,Allie,1,1) == noone
                            {
                            with(instance_create(x,y,obj_arme))
                                {
                                direction = other.Dir1;//On fait partir la balle dans sa direction
                                ID = other.id;//On s'assure que la balle va pas nous considérer comme la cible
                                }
                            Recharge = 0;
                            }
                        }
                    }
                else
                    {
                    Execute = IA_Deplacement_Soldat;
                    Argument[0] = noone;
                    Argument[1] = Cible;
                    Argument[2] = noone;
                    Argument[3] = -1;
                    Argument[4] = -1;
                    Argument[5] = -1;
                    Argument[6] = -1;
                    Argument[7] = Officier.speed;
                    Argument[8] = 0;
                    Argument[9] = Alpha;
                    Argument[10] = Ordre;
                    //IA_Deplacement();
                    exit;
                    }
                }
            else
                {
                if Recharge < obj_globVar.R_fusil // Variable actuellement globale de temps de recharge, on pourrait aussi faire appel à obj_globVar.R_fusil et plus besoin de globalité. Meilleur optimisation?
                        {
                        Dir1 = point_direction(x,y,Cible.x,Cible.y);
                        Recharge++;
                        Cadence = 0;
                        } 
                else
                    {
                    if Officier.Recharge > obj_globVar.R_fusil-2 || Officier.Recharge < 2
                        {
                        Dir1 = point_direction(x,y,Cible.x,Cible.y);
                        if collision_line(x,y,Cible.x,Cible.y,Allie,1,1) == noone
                            {
                            with(instance_create(x,y,obj_arme))
                                {
                                direction = other.direction;//On fait partir la balle dans sa direction
                                ID = other.id;//On s'assure que la balle va pas nous considérer comme la cible
                                }
                            Recharge = 0;
                            }
                        }
                    }
                }
            }
        else
            {
            if Comb == 0
                {
                if place_meeting(x,y,Cible) == false//distance_to_object(Cible) > 0
                    {
                    Execute = IA_Deplacement_Soldat;
                    Argument[0] = noone;
                    Argument[1] = Cible;
                    Argument[2] = noone;
                    Argument[3] = -1;
                    Argument[4] = -1;
                    Argument[5] = -1;
                    Argument[6] = -1;
                    Argument[7] = Cadence;
                    Argument[8] = 0;
                    Argument[9] = Alpha;
                    Argument[10] = Ordre;
                    exit;
                        
                    }
                else
                    {
                    speed = 0;
                    with(instance_create(x,y,obj_arme_blanche))
                        {
                        direction = other.direction;//On fait partir la balle dans sa direction
                        ID = other.id;
                        }
                    }
                }
            else
                {
                if Comb == 2
                    {
                    if place_meeting(x,y,Cible) == false//distance_to_object(Cible) > 0
                        {
                        if distance_to_object(Cible) > 300+3*MSpeed
                            {
                            Cadence = MSpeed/4;
                            }
                        else
                            {
                            if distance_to_object(Cible) > 150+2*MSpeed
                                {
                                Cadence = MSpeed/2;
                                }
                            else
                                {
                                if distance_to_object(Cible) > 150+MSpeed
                                    {
                                    Cadence = MSpeed*(1 - 1/10);
                                    }
                                }
                            }
                        Execute = IA_Deplacement_Soldat;
                        Argument[0] = noone;
                        Argument[1] = Cible;
                        Argument[2] = noone;
                        Argument[3] = -1;
                        Argument[4] = -1;
                        Argument[5] = -1;
                        Argument[6] = -1;
                        Argument[7] = Cadence;
                        Argument[8] = 0;
                        Argument[9] = Alpha;
                        Argument[10] = Ordre;
                        exit;
                        }
                    else
                        {
                        speed = 0;
                        with(instance_create(x,y,obj_arme_blanche))
                            {
                            direction = other.direction;//On fait partir la balle dans sa direction
                            ID = other.id;
                            }
                        }
                    }
                }
            }
        }
    }
    Execute = IA_Attaque_Soldat;
    exit;
}
