#define IA_Repos
///IA_Repos(Repos)
{
if Officiel == 0
    {
    if Argument[0] != 0
        {
        //Dir1 = direction + random(40)-20;
        //speed = 2;
        //IA_Deplacement(/*noone,noone,noone,-1,-1,direction + random(40)-20,random(20)+10,MSpeed/10,-1,0,0*/);
        Execute = IA_Deplacement;
        Argument[0] = noone;
        Argument[1] = noone;
        Argument[2] = noone;
        Argument[3] = -1;
        Argument[4] = -1;
        Argument[5] = Dir1+random(10)-5;
        Argument[6] = random(30)+10;
        Argument[7] = MSpeed/10;
        Argument[8] = -1;
        Argument[9] = 0;
        Argument[10] = 0;
        }
    else
        {
        IA_Surveillance();
        speed = 0;
        
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
    speed = 0;
    }
exit;
}
