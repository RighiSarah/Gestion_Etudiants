<link rel="shortcut icon" type="image/x-icon" href="http://dis.univ-lyon2.fr/jsp/css/www/images/favicon.ico" />
<link rel="icon" type="image/png" href="http://dis.univ-lyon2.fr/jsp/css/www/images/favicon.png" />
</head>
<body id = "page6">

    <?php
    //APPEL DE LA BDD ET SESSION, on verifie si ceux-ci ont déjà été appelés
    if (!isset($_SESSION))
        session_start();
    if (file_exists('includes/admin/config.php'))
        include_once ('includes/admin/config.php');
    else
        include_once ('../includes/admin/config.php');

    if (!isset($connexion)) {
        if (file_exists('includes/admin/connexion.php'))
            include ('includes/admin/connexion.php');
        else
            include ('../includes/admin/connexion.php');
    }
// TODO: Équipe de intégration vous pouvez changer cette method .. s'il vous plaît
    $serverAddressParts = explode("/", $_SERVER["REQUEST_URI"]);
    $serverAddressPartCount = count($serverAddressParts);
    $currentModule = $serverAddressParts[$serverAddressPartCount - 2];


//vérification des droits
    //variable pour vérifier que nous sommes bien dans un module
    $verif = false;
    $idM;
//on récupère la liste des modules
    $requete = $connexion->prepare('
            SELECT m.idModule,route 
            FROM  module as m where etat=1');

    $requete->execute();
    //pour chaque resultat
    while ($resultat = $requete->fetch()) {  //est-on dans un des modules ?
        foreach ($serverAddressParts as $mod) {
            if ($mod == $resultat["route"]) {
                $verif = true;
                $idM = $resultat["idModule"];
                break;
            }
        }
        if ($verif)
            break;
    }
//si on est bien dans un module		
    if ($verif) {
        $requete = $connexion->prepare('
            SELECT route 
            FROM  module as m,association_40 as a
           WHERE m.idModule=a.idModule AND a.idRole = :role AND m.idModule= :mod ');
        $requete->execute(array(
            'role' => $_SESSION['role'],
            'mod' => $idM)
        );
        $count = $requete->rowCount();
        if ($count == 0) {
            //si pas le droit on redirige
            header("Refresh: 0;URL=" . getPath('Accueil'));
        }
    }
    ?>
    <!-- Main -->

    <div class="bordure"></div>

    <div id="profils_preferences">
        <div id="profils_preferences_deco">
            <p id="acces_direct"><a href="#avec_nav_avec_encadres" accesskey="s">Acc&egrave;s direct au contenu</a></p>

        </div> <!-- #profils_preferences_deco -->
    </div> <!-- #profils_preferences -->

    <div id="bandeau_deco">
        <div id="bandeau">	
            <form id="recherche_simple" action="http://dis.univ-lyon2.fr/servlet/com.jsbsoft.jtf.core.SG" method="post">
                <div>
                    <input type="hidden" name="#ECRAN_LOGIQUE#" value="RECHERCHE" />
                    <input type="hidden" name="PROC" value="RECHERCHE" />
                    <input type="hidden" name="ACTION" value="VALIDER" />
                    <input type="hidden" name="LANGUE" value="0" />
                    <input type="hidden" name="LANGUE_SEARCH" value="0" />
                    <input type="hidden" name="CODE_RUBRIQUE" value="" />
                    <input type="hidden" name="CODE_SITE_DISTANT" value="" />
                    <input type="hidden" name="SEARCH_SOUSRUBRIQUES" value="true" />
                    <input type="hidden" name="SEARCH_EXCLUSIONOBJET" value="" />
                    <input type="hidden" name="RH" value="1358239694591" />
                    <input type="hidden" name="OBJET" value="TOUS" />

                    <label for="MOTS_CLEFS" accesskey="4">Recherche</label>
                    <input name="QUERY" type="text" id="MOTS_CLEFS" class="champ-saisie" value="" onblur="if (this.value == '') {
                                                            this.value = 'Rechercher';
                                                        }" onfocus="if (this.value == 'Rechercher') {
                                                                    this.value = '';
                                                                }" title="Rechercher par mots-cl&eacute;s" />
                    <input type="submit" value="ok" />
                </div>

                                        <!-- <p id="vers_recherche_avancee"><a href="http://dis.univ-lyon2.fr/jsp_usinetemplate/recherche_avancee.jsp?RH=1358239694591">Outil de recherche</a></p> -->
            </form>

            <a href="http://dis.univ-lyon2.fr/fr/" id="retour_accueil" title="Retour &agrave; la page d'accueil" accesskey="1"><img src="http://dis.univ-lyon2.fr/images_modele/usine-logo-2014.png" alt="DÃ©partement Informatique et Statistique" title="Retour &agrave; la page d'accueil" /></a>

            <span class="portails">
                Portails : <a href="http://www.univ-lyon2.fr/">www</a> - <a href="http://etu.univ-lyon2.fr">&eacute;tudiants</a> - <a href="http://intranet.univ-lyon2.fr">personnels</a>
            </span><!-- #portails -->
 <span class="bandeau_titre">
						<iu>FORMATION D-I-S</iu> <br><ui>(Décisionnel-Informatique-Statistique)</ui>
				</span><!-- #bandeau_titre -->
        </div> <!-- #bandeau -->
    </div> <!-- #bandeau_deco -->
    <!-- FIN Header -->


    <!-- placement de la photo université lumière Lyon 2 -->
    <br/>
    <br/>
    <div id="bandeau_illustration"></div>
<!--    <div class="collapse navbar-collapse" id="main-navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="<?php writePath("Formulaire de traitement/Formulaire.php"); ?>"></span> Formulaire post-test</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> Mon compte <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<?php writePath("options/changeMypass.php") ?>">Changer mon mot de passe</a></li>
                    <li><a href="<?php writePath("options/modifUser.php") ?>">Mettre à jour mes informations</a></li>
                </ul>
            </li>
            <li><a href="<?php writePath("deconnexion.php"); ?>"><span class="glyphicon glyphicon-off"></span> Déconnexion</a></li>
        </ul>
    </div>-->
    <!-- Navigation -->

    <!-- Zone pour les alertes -->