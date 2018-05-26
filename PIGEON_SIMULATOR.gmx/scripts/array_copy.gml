/// array_copy(1d_array: input) : 1d_array output
/// copie un array 
var in = argument0;
var len = array_length_1d(in);
var out;

for(var i = 0; i < len; i++){
    out[i] = in[i];
}

return out;

