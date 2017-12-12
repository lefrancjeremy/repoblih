#!/bin/bash

error=0

if [ $# -gt 0 ]; then
case $1 in
'create' | '1')
if [ ! -z $2 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository create $2 
else
error=1
fi
;;
'setacl' | '2')
if [ -z $3 ] && [ ! -z $2 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository setacl $2 ramassage-tek r 
elif [ -z $4 ] && [ ! -z $3 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository setacl $2 $3 r
elif [ ! -z $4 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository setacl $2 $3 $4 
else
error=1
fi
;;
'getacl' | '3')
if [ ! -z $2 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository getacl $2
else 
error=1
fi
;;
'clone' | '4')
if  [ ! -z $3 ]; then
git clone git@git.epitech.eu:/$2@epitech.eu/$3
else
git clone git@git.epitech.eu:/jeremy.lefranc@epitech.eu/$2
fi
;;
'12')
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository create $2 
;;
'list' | '5')
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository list
;;
*)
if [ -z $2 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository create $1 
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository setacl $1 ramassage-tek r 
git clone git@git.epitech.eu:/jeremy.lefranc@epitech.eu/$1
elif [ -z $3 ] && [ $2 == "norights" ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository create $1 
git clone git@git.epitech.eu:/jeremy.lefranc@epitech.eu/$1
elif [ -z $3 ]; then
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository create $1 
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository setacl $1 $2 r
git clone git@git.epitech.eu:/jeremy.lefranc@epitech.eu/$1
else
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository create $1 
python3 /usr/bin/blih -u jeremy.lefranc@epitech.eu repository setacl $1 $2 $3 
git clone git@git.epitech.eu:/jeremy.lefranc@epitech.eu/$1
fi
;;
esac
fi

if [ $# == 0 ] || [ $error == 1 ]; then
if [ $error == 1 ]; then
echo -e "\n                 \e[1;31mArgument manquant !\e[0m"
fi

echo -e "\n\e[7;31m                        MANUEL                           \n"
echo -e "\e[0m\e[1;33m[param]\e[1;31m? \e[1;32m[dossier] [droits à]\e[1;31m? \e[1;32m[droits]\e[1;31m?\e[7m\n"
echo -e "\e[1;36mParamètres : \e[0m"
echo -e "  - \e[1;36m'create' ou '1' \e[0m[dossier]"
echo -e "  - \e[1;36m'setacl' ou '2' \e[0m[dossier] [droits à]? [droits]?"
echo -e "  - \e[1;36m'getacl' ou '3' \e[0m[dossier]"
echo -e "  - \e[1;36m'clone' ou '4' \e[0m[dossier]"
echo -e "  - \e[1;36m'list' ou '5'"
echo -e "  - \e[1;36m'12' (create & setacl) \e[0m[dossier] [droit à]? [droits]?"
fi

