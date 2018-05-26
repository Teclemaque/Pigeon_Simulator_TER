for(var i = 0; i < width-1;i++){
    for(var j=0;j < height-1;j++){
        var zz = 1 + PerlinNoise(i,j,100)
        ds_grid_add(grid,i,j,zz)
    }
}
