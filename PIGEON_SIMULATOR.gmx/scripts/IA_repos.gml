#define IA_Repos
///IA_Repos(Repos)
{
if Officiel == 0
    {
    if Argument[0] != 0
        {
        Execute = IA_Deplacement;
        Argument[0] = noone;
        Argument[1] = noone;
        Argument[2] = noone;
        Argument[3] = -1;
        Argument[4] = -1;
        Argument[5] = direction+random(10)-5;
        Argument[6] = random(30)+10;
        Argument[7] = MSpeed/10;
        Argument[8] = -1;
        Argument[9] = Alpha;
        Argument[10] = 0;
        }
    else
        {
        IA_Surveillance();
        Cadence = 0;
        
        if Argument[0] == 0
            {
            if Argument[1] != -1
                {
                Argument[1] --;
                if Argument[1] <= 0
                    {
                    Argument[0] = 1;
                    }
                }
            }
        }
    }
else
    {
    //IA_Surveillance();
    Cadence = 0;
    }
exit;
}

#define IA_Repos_Soldat
///IA_Repos_Soldat()
{
if instance_exists(Officier)
    {
    if Officier.Officiel == 0
        {
        if distance_to_object(Officier) > 100+MSpeed * 10
            {
            Execute = IA_Deplacement_Soldat;
            Argument[0] = noone;
            Argument[1] = Officier;
            Argument[2] = noone;
            Argument[3] = -1;
            Argument[4] = -1;
            Argument[5] = -1;//point_direction(x,y,Officier.x,Officier.y);
            Argument[6] = -1;
            Argument[7] = Officier.speed+MSpeed/10;
            Argument[8] = -1;
            Argument[9] = Alpha;
            Argument[10] = 0;
            exit;
            }
        else
            {
            if Argument[0] != 0
                {
                Execute = IA_Deplacement_Soldat;
                Argument[0] = noone;
                Argument[1] = noone;
                Argument[2] = noone;
                Argument[3] = -1;
                Argument[4] = -1;
                Argument[5] = direction+random(20)-10;
                Argument[6] = random(60);
                Argument[7] = MSpeed/10;
                Argument[8] = -1;
                Argument[9] = Alpha;
                Argument[10] = 0;
                } 
            else
                {
                IA_Surveillance();
                Cadence = 0;
                
                if Argument[0] == 0
                    {
                    if Argument[1] != -1
                        {
                        Argument[1] --;
                        if Argument[1] <= 0
                            {
                            Argument[0] = 1;
                            }
                        }
                    }
                }
            }
        }
    else
        {
        IA_Surveillance();
        Cadence = 0;
        }
    }
exit;
    }

#define IA_Surveillance
///IA_Surveillance()
{
t++;
if speed == 0
    {
    if Classe == 0 // Le simple soldat
        {
        if instance_exists(Officier)
            {
            if Officier.Officiel == 0
                {
                D = random(20);
                if t > 3*Chance
                    {
                    if (t mod 2) == 0
                        {
                        Dir1 += D;
                        }
                    else
                        {
                        Dir1 -= D;
                        }
                    t = 0;
                    }
                }
            else
                {
                Dir1 += random(10)-5;
                }
            }
        }
    else
        {
        if Classe == 1
            {
            if Officiel == 0
                {
                D = random(40);
                if t > 3*Chance
                    {
                    if (t mod 2) == 0
                        {
                        Dir1 += D;
                        }
                    else
                        {
                        Dir1 -= D;
                        }
                    t = 0;
                    }
                }
            else
                {
                D = random(10);
                if t > 3*Chance
                    {
                    if (t mod 2) == 0
                        {
                        Dir1 += D;
                        }
                    else
                        {
                        Dir1 -= D;
                        }
                    t = 0;
                    }
                }
            }
        }
    }
exit;
}
