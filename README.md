Made by k0da
Pour tester le jeu, lancer `ruby app.rb`

Version de Ruby utilisée 2.5.1

--------

<h2>MORPION</h2>

<b>Liens de dépendances entre les classes</b>

                    Application
                    |         |
                 Game         Show
                |    |
         2 Player    1 Board
                     |
                     9 BoardCase

<b>Classes et leurs fonctionnements</b>

* `Player` : crée 2 nouveaux players à chaque fois qu'on lance l'application, les joueurs sont conservés entre 2 parties. Chaque joueur a un nom, un signe ('X' ou 'O') et un nombre de victoires qui s'initialise à 0 et augmentera à chaque victoire.
* `Board` : la grille du morpion qui contient 9 cases (BoardCase) et un compteur du nombre de tours. Au bout de 9 tours, toutes les cases sont remplies, soit la partie est gagnée par un des 2 joueurs, soit il y a égalité. A chaque tour on vérifie les valeurs de chaque case pour voir s'il y a un gagnant.
* `BoardCase` : chaque case prise individuellement qui contient une valeur ('', 'X' ou 'O'). En fonction des valeurs des différentes cases, on peut déterminer s'il y a un gagnant ou non.
* `Game` : fichier principal du jeu qui crée les 2 joueurs et la Board, définis un current_player (personne à qui c'est le tour). Plusieurs méthodes :
  * `init` pour afficher un message au démarrage d'un jeu.
  * `ask_players_names` pour demander à l'utilisateur et définir le nom des 2 joueurs.
  * `turn` pour demander au current_player où il veut se placer, vérifier qu'il s'agit bien d'une case, vérifier que cette case est disponible, puis modifier la case en question en allant modifier le signe de la BoardCase. Représente chaque tour.
  * `new_round` pour remettre la grille à 0 et démarrer un nouveau jeu tout en gardant les joueurs.
  * `game_end` pour afficher un message au gagnant et afficher le suivi des scores. Fin de jeu.
* `Show` : une seule méthode qui permet de montrer la grille du morpion à un instant t, soit avec les pions des joueurs. On utilisera cette méthode à chaque tour de jeu pour afficher la grille actualisée.
* `Application` : création d'une classe Game et Show. Organisation des méthodes pour le fonctionnement du jeu.

<h2>Améliorations</h2>

* Pimper notre jeu pour qu'il ait une meilleure tête
* Proposer de continuer ou d'arrêter la partie
* ...

--------

Fait en utilisant les ressources de <a href="https://www.thehackingproject.org" target="_blank">The Hacking Project</a>
