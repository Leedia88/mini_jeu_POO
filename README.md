# mini_jeu_POO  
  
## Principe du Jeu  
  
#### app 2  
  
* Initialisation du joueur: ensuite, le jeu va demander à l'utilisateur son prénom et créer un HumanPlayer portant ce prénom.  
* Initialisation des ennemis : le jeu va maintenant créer nos deux combattants préférés, "Josiane" et "José".
Comme nous savons qu'à terme (version 3.0) il y aura plus de 2 ennemis, on va mettre en place une astuce pour manipuler facilement un groupe d'ennemis : le jeu va créer un array enemies qui va contenir les deux objets Player que sont José et Josiane.  
* Le combat : tout comme dans la version 1.0, on peut maintenant lancer le combat ! Via une boucle while qui ne doit s'arrêter que si le joueur de l'utilisateur (HumanPlayer) meurt ou si les 2 joueurs "bots" (Player) meurent.   
* Fin du jeu : maintenant, si on sort de cette boucle while, c'est que la partie est terminée. Donc juste en dessous du end de la boucle, on va préparer un petit message de fin. Le jeu doit afficher "La partie est finie" et ensuite soit afficher "BRAVO ! TU AS GAGNE !" si le joueur humain est toujours en vie, ou "Loser ! Tu as perdu !" s'il est mort.
  

##### app 3  
  
* une nouvelle classe Game :  
2 attr_accessor : un @human_player de type HumanPlayer et un array @enemies qui contiendra des Player.
Un objet Game s'initialise ainsi : my_game = Game.new("Wolverine"). Il crée automatiquement 4 Player qu'il met dans @enemies et un HumanPlayer portant (dans cet exemple) le nom "Wolverine".  
* Méthode kill_player qui prend un objet Player en entrée et le supprime de @enemies. Cette méthode permet d'éliminer un adversaire tué.  
* Méthode is_still_ongoing? qui retourne true si le jeu est toujours en cours et false sinon. Le jeu continue tant que le @human_player a encore des points de vie et qu'il reste des Player à combattre dans l’array @enemies.  
* Méthode show_players qui va afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant  
* Méthode menu qui va afficher le menu de choix (juste l'afficher, pas plus). On a les mêmes choix que dans la version 2.0 à la seule différence qu'il y a plus de 2 ennemis à combattre et que si un ennemi est mort, on ne doit plus proposer de l'attaquer.  
* Méthode menu_choice qui prend en entrée un string. Cette méthode va permettre de faire réagir le jeu en fonction du choix, dans le menu, de l'utilisateur. Par exemple, si l'entrée est "a", le @human_player doit aller chercher une arme. Si l'entrée est "0", on le fait attaquer l'ennemi présenté au choix "0", etc. Pense à faire appel, dans cette méthode, à la méthode kill_player si jamais un Player est tué par le joueur humain !  
* Méthode enemies_attack qui va faire riposter tous les ennemis vivants. Ils vont attaquer à tour de rôle le joueur humain.  
* Méthode end qui va effectuer l'affichage de fin de jeu. Tu sais, la partie "le jeu est fini" puis "Bravo..." ou "Loser..."  
* On va mettre en place un système où les ennemies vont débarquer au compte-goutte, un peu comme dans les jeux où on tombe sur eux au hasard de tes déplacements sur la carte. Pour ça, on va suivre à la fois le nombre d'ennemis toujours présents dans le jeu ( = ennemis restant à éliminer) et le nombre d'ennemis qui sont "en vue" (= ennemis qu'on peut attaquer et qui peuvent nous attaquer en retour). 