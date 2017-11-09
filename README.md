# INTRANET DIS
## Gestion des Doctorants - 2016 - _Groupe 1_

- Dernière mise à jour : __21/12/2016__
- Version actuelle : 8

### Equipe de développement

- Rémi Allain - __Scrum Master__
- Wahiba Azzoug - __Product Owner__
- Charles Bénier
- Tristan Bonnefoy Cudraz
- Nafissa Bouafia
- Jérémy Bournay
- Fanny Clément

### Informations

- Versions PHP supportées : __> 5.4__
- Extensions : __PDO__
- Template : __Twig__
- Licence : __MIT__

### Configuration

1. Importer la base de données *__"/DataBase/G1_BD_Doctorants.sql"__*
2. Vérifier les informations de connexions dans *__"/App/Config/DataBase.php"__* dans la condition 'PROD'
3. Modifier la constante PROD à TRUE dans *__"/App/Config/General.php"__*
3. Placer le dossier sur votre serveur (local ou distant) et accèder y via un navigateur web

### Backlogs

#### V8 : Mise en place d'un nouveau design [21/12/2016] ~ 3h

#### V7 : Développement de l'onglet Documents [17/12/2016] ~ 4h

#### V6 : Développement de l'onglet Missions [06/12/2016] ~ 5h30

- 17/11/2016 : Correction - Paramètres de sécurité mis en commentaire dans *__"/App/Config/Security.php"__*
- 17/11/2016 : Correction - Ajout de *target="_blank"* dans le menu gauche pour ouverture dans un nouvel onglet

#### V5 : Développement de l'onglet Agenda [17/11/2016] ~ 1h10

#### V4 : Développement de l'onglet Réunions [16/11/2016] ~ 4h40

- 17/11/2016 : Correction - Initialisation de la variable $form_error dans la méthode 'settings' de 'Worker'

#### V3 : Développement de l'onglet Paramètres [09/11/2016] ~ 45mn

#### V2 : Développement de l'onglet Doctorants [03/11/2016] ~ 5h30

- 04/11/2016 : Correction - encodage des données issues d'un formulaire

#### V1 : Développement de l'authentification [01/11/2016] ~ 2h50

#### V0 : Refonte complète de l'architecture [25/10/2016] ~ 6h45
