clean :
	rm -f evaluation hack-code hack-program

evaluation : evaluation.c
	gcc  -Wall -Werror evaluation.c -o evaluation

hack-code : hack-code.c
	gcc --debug  -Wall -Werror hack-code.c -o hack-code

hack-program : hack-program.c
	gcc --debug -Wall -Werror hack-program.c -o hack-program

# À l'invite de commande, '$ make --silent confirm-hack-code' doit afficher 'Note : 20/20 hacked'.
confirm-hack-code : clean hack-code
	# Revient au code d'origine du programme d'évaluation.
	git checkout `git rev-list --all | tail -n 1` -- evaluation.c
	# Modifie le code du programme d'évaluation.
	./hack-code
	# Compile le programme d'évaluation avec son code modifié.
	make evaluation
	# Lance le programme d'évaluation, saisie une note de '8' et affiche le résultat.
	# Ensuite, confirme que '20/20' est affiché. Si oui, affiche 'hacked'. Sinon, affiche 'fail'.
	N=`echo '8' | ./evaluation`; echo $$N; echo $$N | grep -q '20/20' && echo 'hacked' || echo 'fail'

# À l'invite de commande, '$ make --silent confirm-hack-program' doit afficher 'Note : 20/20 owned'.
confirm-hack-program : clean hack-program
	# Revient au code d'origine du programme d'évaluation.
	git checkout `git rev-list --all | tail -n 1` -- evaluation.c
	# Compile le programme d'évaluation avec son code intact.
	make evaluation
	# Modifie le programme d'évaluation.
	./hack-program
	# Lance le programme d'évaluation, saisie une note de '8' et affiche le résultat.
	# Ensuite, confirme que '20/20' est affiché. Si oui, affiche 'owned'. Sinon, affiche 'fail'.
	N=`echo '8' | ./evaluation`; echo $$N; echo $$N | grep -q '20/20' && echo 'owned' || echo 'fail'
