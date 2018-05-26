//argument1 = octave

var smoothNoise = ds_grid_create(global.MAP_Width,global.MAP_Height)

var samplePeriod = 1 << global.MAP_Width
var sampleFrequency = 1.0 / samplePeriod

var i
for(i = 0; i < global.MAP_Width;i++){
    //calculate the horizontal sampling indices
    var sample_i0 = (i / samplePeriod) * samplePeriod
    var sample_i1 = (sample_i0 + samplePeriod) / global.MAP_Width
    var horizontal_blend = (i - sample_i0) * sampleFrequency
    
    var j
    for(j=0; j <global.MAP_Height;j++){
        //calculate the vertical sampling indices
        var sample_j0 = (j / samplePeriod) * samplePeriod
        var sample_j1 = (sample_j0 + samplePeriod) / global.MAP_Height
        var vertical_blend = (j - sample_j0) * sampleFrequency
        
        //blend the top two corners
        var top = script_execute(interpolate,ds_grid_get(argument0,sample_i0,sample_j0),ds_grid_get(argument0,sample_i1,sample_j0),horizontal_blend)
        
        //blend the bottom two corners
        var bottom = script_execute(interpolate,ds_grid_get(argument0,sample_i0,sample_j1),ds_grid_get(argument0,sample_i1,sample_j1),horizontal_blend)
        
        //final blend
        ds_grid_set(smoothNoise,i,j,script_execute(interpolate,top,bottom,vertical_blend))   
    }
}

return smoothNoise