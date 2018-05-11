///tree_assemble(tree:array<string>, newString:string, ind1:int, ind2:int):array<string>

var tree=argument[0];
var newString=argument[1];
var ind1=argument[2];
var ind2=argument[3];

var tmp;

tmp[0]=newString;
tmp[1,0]=tree[ind1];
tmp[1,1]=tree[ind2];

tmp[1]=tmppos;

tree[ind1]=tmp;

return tree;
