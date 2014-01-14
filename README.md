# APEXFramework
=============

## Framework for Oracle Application Express (APEX)

### Ce qui est important de savoir :
	-Il y a deux scripts a exécuter pour l'installation complète de AFW (Un avec SYS, l'autre avec AFW_040215)
	-Les fichiers nécessaires au fonctionnement du framework sont dans le dossier fichiers_res_afw. (/res/dev/)
	
### Marche à suivre
	
1. Télécharger le fichier compressé à partir de GitHub (APEXFramework-master.zip)
```
# mkdir /oracle/install_afw
```

2. Déplacer le fichier sur le serveur qui contient la BD (environnement cible), au besoin.
<br /> _Note: L'utilisation d'un outil graphique ou en ligne de commande est laissez à votre discrétion._
```
# cd [Emplacement du fichier compressé]
# mv [Nom du fichier compressé] /oracle/install_afw
```

3. Extraire les dossiers du fichier "APEXFramework-master.zip" dans "/oracle/install_afw"
<br /> _Note: L'utilisation d'un outil graphique ou en ligne de commande est laissez à votre discrétion._
<br />Exemple ligne de commande UNIX: 
```
# cd /oracle/install_afw
# unzip APEXFramework-master.zip
```

4. Ouvrir une fenêtre de commande DOS ou un terminal UNIX
<p> Exemple DOS: Cliquer sur "Démarrer", taper "cmd" dans la recherche, appuyer sur "Entrée" <br /> 
    Exemple UNIX: Cliquer sur "Ouvrir un terminal" </p>

5. Tapez la commande suivante : 
```
Pour DOS : # set nls_lang=.AL32UTF8
Pour UNIX : # export NLS_LANG=.AL32UTF8
```

6. Positionner sur le dossier "afwins1" extrait de "APEXFramework-master.zip"
```
# cd /oracle/install_afw/afwins1
```

7. Loguer sur SQL*Plus en tant que SYS sur la bd voulu. <br />
Exemple : 
```
# sqlplus / as sysdba
```

8. Créer l'utilisateur AFW_040215 , avec les params voulus, sans la nécessité de créer des droits. Le script s'en charge.  
<br />Par défaut,
```SQL
SQL>create user afw_040215 identified by afw_040215 account unlock;
```

9. Tapez la commande suivante :	
```SQL
SQL>@afwins1.sql;
--Attendre la fin du script.
```

10. Sortir de SQL*Plus en tapant "exit" et positionner sur dossier "afwins2".
```SQL
SQL>exit
```
```
# cd /oracle/install_afw/afwins2
```

11. Loguer sur SQL*Plus en tant que AFW_040215 sur cette meme bd
```
# sqlplus afw_040215/afw_040215
```

12. Tapez la commande suivante :
```SQL
SQL>@afwins2.sql;
--Attendre la fin du script.
```

13. Sortir de Sql*Plus
```
SQL>exit
```

14. Positionner sur dossier "util"
```
# cd /oracle/install_afw/util
```

15. Loguer sur SQL*Plus en tant que AFW_040215 sur la meme bd
```
# sqlplus afw_040215/afw_040215
```

16. Tapez la commande suivante :
```SQL
SQL>@afwadminpwd.sql;
--Entrez le nouveau mot de passe;
SQL>exit
```

17. Maintenant, vous pouvez vous connecter à AFW avec les informations suivantes à partir du lien ( Exemple: dev.mondomaine.net/f?p=1000001:1 ):
```
Domaine : INTER
Utilisateur : AFW_ADMIN
Mot de passe : <Celui entré à l'étape 16>
```
		
Amusez-vous !!
	
Utilitaires :
<p>@afwadminpwd.sql; avec AFW_040215 : sert à changer le mot de passe de l'utilisateur AFW_ADMIN.</p>
<p>@apexafwinstall.sql; avec AFW_040215 : installe les composants APEX de AFW dans une application APEX n'ayant pas AFW.</p>
<p>@schem_afw_grant.sql; avec SYS : ajoute les grants d'objets AFW au schéma saisi.</p>
<p>@schem_afw_synonym.sql; avec SYS : ajoute les synonyms d'objets AFW au schema saisi.</p>

### Fichiers JS et CSS
	
1. Déplacer dans dossier "fichiers_res_afw" de "APEXFramework-master.zip"
```
# cd /install_afw/fichier_res_afw
```

2. Extraire "afw.zip" dans l'endroit pointé par les dads.conf du serveur d'application.  Exemple : /oradata/vh/sied (Comme /i/ d'Apex, AFW à son dossier personnel pour contenir ses fichiers)
```
# unzip afw.zip -d /oradata/vh/sied
```
