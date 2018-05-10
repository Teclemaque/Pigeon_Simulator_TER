//IA_Grade(id1,Officialisation,Rang)

id1 = Argument[0];
Officialisation = Argument[1]
Rang = Argument[2];

if Officialisation == 1 //Le soldat est officialisé.
    {
    if Rang != noone
        {
        with(instance_create(x,y,Rang))
            {
            transfertDonneesOfficier(other.id);
            }
        instance_destroy();
        }
    Officiel = 1;      
    }
else
    {
    if id1 != noone
    && instance_exists(id1)//Doit faire un retour d'erreur, ordre non appliqué
        {
        with(id1)
            {
            transfertDonneesOfficier(other.id);
            }
        instance_destroy();
        }
    else
        {
        if Officiel == 1
            {
            Officiel = 0
            }
        else
            {
            // Pour remplacer un officier temporaire dont on ne veut plus
            }
        }
    }