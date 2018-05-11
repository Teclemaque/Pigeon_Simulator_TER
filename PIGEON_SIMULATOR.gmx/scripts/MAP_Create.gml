//les globals MAP_Height MAP_Height sont utilisé pour l'init
/*
Les valeurs sont les suivante
0 - Prairie / Plaine
1 - Forêt
2 - Mountagne
-1 - Riviére
*/
MAP_Precise = ds_grid_create(global.MAP_Width,global.MAP_Height)
MAP_Equipe1 = MAP_Precise
//MAP_Equipe2 = MAP_Precise

/*
//init de la carte précise
var i 
var j 
randomize()
for(i = 0;i<global.MAP_Height;i++)
    for(j = 0;j<global.MAP_Width;j++){
        ds_grid_set(MAP_Precise,j,i,choose(-1,0,0,0,1,1,2))
}

//Uniformitée
for(i = 1;i<global.MAP_Height-1;i++)
    for(j = 1;j<global.MAP_Width-1;j++){
        var somme = ds_grid_get_mean(MAP_Precise,j-1,i-1,j+1,i+1)
        if(random(100) < 30) //30% de chance d'uniformisé
            ds_grid_set(MAP_Precise,j,i,somme)
}
*/
var baseNoise = script_execute(GenerateWhiteNoise)
MAP_Precise = script_execute(generatePerlinNoise,baseNoise,6)
