/// String nomGroupe(int agent, bool withName = true) : identifiant du groupe (bataillon, regiment, escouade) de l'agent
/// A utiliser pour créer et réserver le nom disponible pour son groupe dans global.Regiments
/// @param agent : l'id de l'agent dont on veut le nom du bataillon
/// @param withName :  ajoute le nom du type de groupe, ex : "Escouade123" si true, "123" sinon
show_debug_message("Grade2 "+string(Grade));
if(argument_count < 2){
    Arg = true; // withName = true par défaut
}
else {
    Arg = argument[1];
}

var agent = argument[0];
var withName = Arg;

// Determiner le type de groupe selon sa taille
var groupName = "";

if(withName){
    var groupSize = ds_list_size(Regiment);
    
    if (groupSize > 818 && agent.Grade <= 12){
        groupName = "régiment "
        agent.Grade = 12;
    }else if (groupSize > 206 && agent.Grade <= 10){
        groupName = "bataillon "
        agent.Grade = 10;
    }else if (groupSize > 72 && agent.Grade <= 8){
        groupName = "compagnie "
        agent.Grade = 8;
    }else if(groupSize > 24 && agent.Grade <= 6){
        groupName = "troupe "
        agent.Grade = 6;
    }else if (groupSize > 12 && agent.Grade <= 4){
        groupName = "patrouille "
        agent.Grade = 4;
    }else if (groupSize > 1 && agent.Grade <= 2) {
        groupName = "escouade "
        agent.Grade = 2;
    }else {
        groupName = "soldat " // TODO : ou cavalier, messager, ...
        agent.Grade = 0;
    }
}

// Trouver le numero à attribuer au groupe
var numero = "";
N1 = 0;
if(agent != agent.Officier){ // si le père a le numero 12
    numero  = string(agent.Officier.Numero); // on prend le numero 121
    N1 = string_length(agent.Officier.Numero)
    
}
// On affecte un numero par defaut a chaque type de formation
if (groupName == "bataillon "){
    num = "0";
}
else if (groupName == "compagnie "){
    num = "00";
}
else if(groupName == "troupe "){
    num = "000";
}
else if(groupName == "patrouille "){
    num = "0000";
}
else if (groupName == "escouade "){
    num = "00000";
}
else if (groupName == "soldat "){
    num = "000000";
}
else {
    num = "";
}
// Si l'agent a un officer, on remplace le numero par defaut par celui de l'officier
Val = "";
for (i = 0; i < N1; i++){
    Val += "0";
}

N2 = string_length(num);
numero = string_replace(num,Val,numero);

Num = string(numero);


// Trouver le premier nom disponible pour notre groupe :

if (agent.Troupe != groupName){
    numero = 1; // les attributions de numero commencent a 1
    var fullName = string(groupName)+ string(Num) + string(numero); // ex : escouade121
    while(ds_map_exists(obj_globVar.Regiments, fullName)){ // chercher tant que le nom est pris
        numero++;
        fullName = string(groupName)+ string(Num) + string(numero); // ex : essayer avec escouade122, escouade123, etc.
    }
    
    ds_map_add(obj_globVar.Regiments, fullName, agent); // on inscrit l'agent comme Officier du nouveau groupe
    agent.Troupe = string(groupName);
    agent.Numero = string(Num)+string(numero);
    agent.Name = fullName;
    
    return fullName;
}
exit;