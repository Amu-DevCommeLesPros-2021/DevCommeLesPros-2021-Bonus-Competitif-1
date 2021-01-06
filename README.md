# «20/20 ? Y a qu'à pirater le systeme !»

Pourquoi se faire suer à réviser ?
Il n'y a rien de plus facile pour obtenir une note de 20/20 si on pirate le programme d'évaluation...

Il y a dans ce dépôt un programme d'évaluation (`evaluation.c`) tout bête qui saisie un nombre `N` à l'invite de commande et affiche «`Note : N/20`».
Vous aurez à faire en sorte que ce programme affiche «`Note : 20/20`» *quelle que soit le nombre saisi*.

Il y a deux méthodes pour ce faire.
La première consiste à écrire un programme (`hack-code`) qui modifie *le code* du programme d'évaluation avant d'être compilé.
Une fois compilé, ce nouveau programme saisie un nombre mais n'en tiendra pas compte et affichera une note parfaite.

La deuxième méthode consiste à écrire un pogramme (`hack-program`) qui modifie *l'exécutable* du programme d'évaluation après qu'il est été compilé.
C'est-à-dire que le code d'origine du programme d'évaluation est gardé intact et compilé.
Puis, le programme `hack-program` modifie l'exécutable `evaluation` pour ne pas tenir compte du nombre saisi et afficher une note parfaite.

# Objectif

Le fichier `makefile` contient toutes les cibles nécessaire à la compilation et à la vérification des programmes de piratage.
Implémentez les deux programmes `hack-code` et `hack-program` pour faire en sorte que :

- `$ make --silent confirm-hack-code` affiche :
```
Note : 20/20
hacked
```
- `$ make --silent confirm-hack-program` affiche :
```
Note : 20/20
owned
```

Si les programmes de piratage n'ont pas l'effet escompté, vous verrez :
```
Note : 8/20
fail
```

Vous ne devez modifier que les fichiers `hack-code.c` et `hack-program.c`.
Les fichiers `evaluation.c` et `makefile` doivent rester intact dans votre dépôt. (Faites attention à ne pas faire `git commit` par mégarde sur le fichier `evaluation.c` car ce fichier sera évidemment modifié par votre programme `hack-code`.)