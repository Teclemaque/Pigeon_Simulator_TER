/// String nomGroupe(int agent, bool withName = true) : identifiant du groupe (bataillon, regiment, escouade) de l'agent
/// A utiliser pour créer et réserver le nom disponible pour son groupe dans global.Regiments
/// @param agent : l'id de l'agent dont on veut le nom du bataillon
/// @param withName :  ajoute le nom du type de groupe, ex : "Escouade123" si true, "123" sinon

if(argument_count < 2){
    Arg = true; // withName = true par défaut
}
else {
    Arg = argument[1];
}

var agent = argument[0];
var withName = Arg;

// Trouver le numero à attribuer au groupe
var numero;
if(agent != agent.Officier){ // si le père a le numero 12
    numero  = agent.Officier.Numero + "1"; // on prend le numero 121
} else {
    numero = "1"; // si officier max : prendre le numero 1
}

numero = real(numero);

// Determiner le type de groupe selon sa taille
var groupName = "";
if(withName){
    var groupSize = ds_list_size(Regiment);
    if(groupSize > 25){
        groupName = "bataillon"
    }else if (groupSize > 6){
        groupName = "regiment"
    }else if (groupSize > 1) {
        groupName = "patrouille"
    }else {
        groupName = "soldat" // TODO : ou cavalier, messager, ...
    }
}

// Trouver le premier nom disponible pour notre groupe :

var fullName = string(groupName) + string(numero); // ex : escouade121

while(ds_map_exists(obj_globVar.Regiments, fullName)){ // chercher tant que le nom est pris
    numero++;
    fullName = string(groupName) + string(numero); // ex : essayer avec escouade122, escouade123, etc.
}

ds_map_add(obj_globVar.Regiments, fullName, agent); // on inscrit l'agent comme Officier du nouveau groupe
agent.Numero = string(numero);
agent.Name = fullName;

return fullName;
