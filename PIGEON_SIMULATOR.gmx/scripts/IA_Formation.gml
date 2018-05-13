///IA_Formation(Formation)
{
if instance_exists(Officier.Formation)
    {
    P = ds_list_find_index(Officier.Regiment,id);
    if Officier.Formation.image_yscale != 0
        {J = (P-1) div Officier.Formation.image_yscale;}
    else
        {J = 1;}
    if Officier.Formation.image_xscale != 0
        {I = (P-1) mod  Officier.Formation.image_xscale} //div Officier.Formation.image_xscale;
    else
        {I = 1;}
    
    D = sqrt(sqr(3*I)+sqr(8*J));
    
    Angle = point_direction(Officier.Formation.x,Officier.Formation.y,Officier.Formation.x+5*I,Officier.Formation.y+7*J)
    
    Dir1 = point_direction(x,y,Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction)),Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction)))

    Dist = distance_to_point(Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction)),Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction)))
    
    if Dist > 0
        {
        Execute = IA_Deplacement_Soldat;
        Argument[0] = noone;
        Argument[1] = noone;
        Argument[2] = noone;
        Argument[3] = Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction));
        Argument[4] = Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction));
        Argument[5] = Dir1;
        Argument[6] = -1;
        Argument[7] = abs(MSpeed-MSpeed/(Dist+1));
        Argument[8] = 0;
        Argument[9] = Alpha;
        Argument[10] = 1;
        exit;
        }
    else
        {
        Dir1 = Officier.Dir1;
        Argument[0] = 0;
        Argument[1] = -1;
        Execute = IA_Repos_Soldat;
        }
    }
exit;
}
