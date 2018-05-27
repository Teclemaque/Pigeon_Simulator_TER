Sir, yes sir !
==============
Jeu de stratégie orienté agent
------------------------------
##### TER Master 1 Informatique, 2017-2018
## Principe
"**Sir, yes Sir !**" vise à réaliser un jeu video de stratégie en temps réel avec un gameplay réaliste orientée agent, développé sous Game Maker 1.4. Le joueur y incarne le général d'une armée et doit gérer les mouvements de ses troupes en écrivant des ordres en langage naturel. 

### Perceptions et gameplay
Les seules perceptions de son environnement sont celles du général : ce qui ne se trouve pas dans son champ de vision relève de l'inconnu : il est conseillé de choisir un bon point d'observation. 
Le général doit donc envoyer des troupes pour explorer la carte, déterminer l'emplacement de l'ennemi et livrer bataille. Mais tout cela ne peut se faire que si les messagers parviennent à ramener les messages du front sans se faire intercepter. 

### Génération de carte et analyse de phrases
La carte est genérée procéduralement avec du bruit de Perlin ; les ordres en langage naturel sont analysés à l'aide de l'algorithme de [Cocke-Younger-Kasami](https://fr.wikipedia.org/wiki/Algorithme_de_Cocke-Younger-Kasami). 

### Gestion des agents
Les agents, afin de limiter les ressources consommées, différencie les agents **Officiers**, cognitifs, des simples soldats, agents réactifs.
Le déplacement des agents utilise des algorithmes de dits de flocking. 

**Mots clés :**
``Jeu video, game design, GameMaker 1.4, GML, programmation agent, flocking, TALN, génération de cartes, Perlin, CYK.``
