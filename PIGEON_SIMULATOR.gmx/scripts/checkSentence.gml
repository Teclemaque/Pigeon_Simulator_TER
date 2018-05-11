/// checkSentence(parsedSentence:ds_list):ds_map

var s = argument0;

for(var i=0;i<ds_list_size(s);i++)
{
    
}

/*
s -> gv + gn
gv -> v[kill] | v[ask] + "à" + gn + "de" + gv | v[go] + "vers"
gn -> nom


v = {[tuer, kill], [deplacer, go], [aller,go], [ordonner, ask], [demander, ask]}
nom = {[soldat,target]}
*/