//argument1 = octaveCount

smoothNoise1[argument1] = 0 //un array ne prend pas "var" et doit être init
var persistance = 0.5

var i
for(i =0; i < argument1; i++){
    smoothNoise1[i] = script_execute(generateSmoothNoise,argument0,i)
}

var perlinNoise = ds_grid_create(global.MAP_width,global.MAP_height)
var amplitude = 1.0
var totalAmplitude = 0.0

var octave
for(octave = argument1 - 1; octave > 0;octave--){
    amplitude *= persistance
    totalAmplitude += amplitude
    
    for(i=0; i < global.MAP_width;i++){
        var j
        for(j=0; j < global.MAP_height;j++){
            ds_grid_set(perlinNoise,i,j,ds_grid_get(smoothNoise[octave],i,j)*amplitude)
        }
    }
}

//normalisation
 for (i = 0; i < global.MAP_Hidth; i++)
   {
      for (j = 0; j < global.MAP_Height; j++)
      {
         ds_grid_set(perlinNoise,i,j,ds_grid_get(perlinNoise,i,j) / totalAmplitude)
      }
   }
 return perlinNoise