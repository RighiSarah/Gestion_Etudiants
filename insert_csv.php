
<!DOCTYPE html>
<html lang="fr">
<head>

        <?php include 'Templates/includes/$head.html' ;?>

    </head>
	<body class="pageaccueil accueil">

        <div class="bordure"></div>


        <div id="bandeau_deco">

            <?php include 'Templates/includes/$bandeau_deco.html' ?>

        </div>
        <!-- #bandeau_deco -->

        <div id="page_deco">

            <div id="page">

                <hr class="separateur_sections_page" />
                <div id="contenu_deco">

                    <div id="bandeau_illustration"></div>
<!--

MLA-->

<div class="header_nav">
  <table>
    <tbody><tr>
      <td id="hn-img"><img src="Content/img/DefaultUser.png"></td>
      <td id="hn-info">Upload & Insertion en base</td> 
      <td id="hn-logout"><a href="settings.php" class="btn btn-default"><i class="fa fa-wrench"></i>&nbsp;Paramètres</a>&nbsp;<a class="btn btn-danger" href="logout.php"><i class="fa fa-sign-out"></i> Déconnexion</a></td>
    </tr>
  </tbody></table>
</div>

<!--FiN MLA-->
                 <!--   <?php #include 'Templates/includes/$header_nav.html'; ?> -->

                    <?php include 'Templates/includes/$menu.html'; ?>

                    <div id="avec_nav_avec_encadres" class="contenu">

                        <ul class="breadcrumb">
                            <li><a href="index.php">Accueil</a></li>
                            <li>&gt;</li>
                            <li><a href="etudiants.php">Etudiants</a></li>
                            <li>&gt;</li>
                        </ul>

<body>


<div class="panel panel-default center">
                                <header><h3> <i class="fa fa-database"> </i> Insertion De Données</h3></header>
                                <br>

                       <u><b>Informations importantes</b></u>:<br>Les données à importer doivent concerner uniquement le nom, le prenom et l'email de l'etudiant. Vous aurez ensuite la possibilité de compléter les informations dans la rubrique <i class="fa fa-search" aria-hidden="true"></i><font color="#2c58a5"> <a href="etudiants.php"> Recherche d'un Etudiant</a></font>.
                       Merci de déclarer votre fichier dans ce format pour intégration dans la table adéquate.<br><br>
                                 

                                 <i class="fa fa-warning"></i><b> Le fichier doit être de type .csv </b><br/><br/>
                       		
                       		<form  method="post" enctype="multipart/form-data">
                       		<input type="file" name="fileToUpload" id="fileToUpload">

                                 <input type="submit" name="fileToUpload" title="uploader_csv" name="submit">
                                 <br/>
                            </form>
                            </div>
                            

<!-- MLA  INSERTION DE DONNEES EN MASSE -->
<?php
require("connect_db.php");
$target_dir = "Content/csv/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$csvFileType = pathinfo($target_file,PATHINFO_EXTENSION);

// Check de l'existence du fichier
if (file_exists($target_file)) {
    //echo "Désolé, le fichier existe déjà";
    $uploadOk = 0;
   }
// Check de la taille du fichier 
if ($_FILES["fileToUpload"]["size"] > 500000) {
    //echo "Sorry, your file is too large.";
    $uploadOk = 0;
    }


 // Autoriser seulement le format csv 
if($csvFileType != "csv") {
    //echo "Désolé. Seuls les fichiers csv sont autorisés...";
    $uploadOk = 0;
    }

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
   // echo "Désolé, votre fichier n'a pas pu être uploadé...";
// if everything is ok, try to upload file
} 
	else {
    	if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "Le fichier ". basename( $_FILES["fileToUpload"]["name"]). " a été uploadé. L'insertion des données va s'executer...";}
    																			


	/*$servername="localhost:8889";
	$username="mlatreche";
	$password="MLAT74";
	$dbname="PROJET_ETUDIANTS";*/

try{
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
 
	//Le chemin d'acces au fichier 
	$fichier = fopen("Content/csv/".$_FILES['csv']['name'], "r");
 
	//tant qu'on est pas a la fin du fichier :
		while (!feof($fichier))
		{
	// On recupere toute la ligne
	$uneLigne = addslashes(fgets($fichier));
	//On met dans un tableau les differentes valeurs trouvés (ici séparées par un ';')
	$tableauValeurs = explode(';', $uneLigne);

	// On crée la requete pour inserer les donner (ici il y a 12 champs donc de [0] a [11])
	$stmt = $conn->prepare("INSERT INTO utilisateur (`NomUtilisateur`, `PrenomUtilisateur`, `EmailUtilisateur`) VALUES ('".$tableauValeurs[0]."', '".$tableauValeurs[1]."', '".$tableauValeurs[2]."')";
 
	$stmt->execute();
	// la ligne est finie donc on passe a la ligne suivante (boucle)
	}
}
	//vérification et envoi d'une réponse à l'utilisateur
		if ($stmt)
			{
	echo "<h2>Ajout dans la base de données effectué avec succès</h2>";
			}
		else
			{
	echo "Echec dans l'ajout dans la base de données";
			}

catch(PDOException $e)
    {
    echo $stmt . "<br>" . $e->getMessage();
    }  ?>



//<!--MLA  FIN INSERTION DE DONNEES EN MASSE -->





                                  

                  
    							
    							
    							


                                 </div>
 </div>
                 
                  <hr class="separateur_sections_page" />


<div id="encadres">

                        
<div class="encadre_rubrique">
    <div class="encadre_rubrique_contenu">
        <br><img alt="DIS Lyon 2" src="http://dis.univ-lyon2.fr/medias/photo/logo_1486989436724-png" style="margin: 0px 5px; width: 153px; height: 138px;" title="">
    </div> <!-- .encadre_rubrique_contenu -->
</div> <!-- .encadre_rubrique -->


<div class="encadre_fiche">

    <div class="encadre_fiche_contenu">
                
    <h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Emplois Du Temps</strong></h3>&nbsp;<div style="text-align: center;">&nbsp;&nbsp; <a class="lien_externe" title="l3 miashs-ids (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=o4v690ukfsmapnghv2nsa1m90s%40group.calendar.google.com&amp;color=%23BE6D00&amp;ctz=Europe%2FParis">L3 MIASHS-IDS</a><br>&nbsp; &nbsp;<a class="lien_externe" title="m1 informatique (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=oiij44825r9776g538a6q5e4gs%40group.calendar.google.com&amp;color=%231B887A&amp;ctz=Europe%2FParis">M1 INFORMATIQUE</a><br>&nbsp; &nbsp;<a class="lien_externe" title="m2 sise (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=l532b25pideg98b0ghag66i5qs%40group.calendar.google.com&amp;color=%23B1365F&amp;ctz=Europe%2FParis">M2 SISE</a><br>&nbsp; &nbsp;<a class="lien_externe" title="m2 bi&amp;bd - g1 (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=dfivjf5ons124vpfa8mv7t6smo%40group.calendar.google.com&amp;color=%23182C57&amp;ctz=Europe%2FParis">M2 BI&amp;BD - G1</a><br>&nbsp; &nbsp;<a class="lien_externe" title="m2 bi&amp;bd - g2 (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?src=d5ftrlludj92kmpoa8qh1a2tog%40group.calendar.google.com&amp;ctz=Europe/Paris&amp;mode=WEEK&amp;color=%23060D5E">M2 BI&amp;BD - G2</a><br>&nbsp; &nbsp;<a class="lien_externe" title="m2 opsie - g1 (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=7fni5cv986at99r98n1p6aosoc%40group.calendar.google.com&amp;color=%232F6309&amp;ctz=Europe%2FParis">M2 OPSIE - G1</a><br>&nbsp; &nbsp;<a class="lien_externe" title="m2 ospie - g2 (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?src=qkgna5tq216mpn1d4j27a69hok%40group.calendar.google.com&amp;ctz=Europe/Paris&amp;mode=week&amp;color=%230D7813">M2 OSPIE - G2</a></div><div style="text-align: center;">&nbsp; &nbsp;<a class="lien_externe" title="m2 dm (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=9iuamt01d0p9c3ahgqk96pqa7s%40group.calendar.google.com&amp;color=%23853104&amp;ctz=Europe%2FParis">M2 DM</a><br>&nbsp;</div><h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Raccourcis formations</strong></h3><div style="text-align: center;"><br><a href="http://dis.univ-lyon2.fr//fr/nos-formations/formations-initiales/licence-miashs-ids/"><img src="http://dis.univ-lyon2.fr/medias/photo/logo-l3-ids-miniature_1487329207627-jpg" style="width:40px;height:40px;margin:0px 5px;border:px solid;float:;" alt="Miniature L3 IDS" title="Miniature L3 IDS"></a>&nbsp; <a href="http://dis.univ-lyon2.fr//fr/nos-formations/formations-initiales/premiere-annee-du-master-d-informatique-m1-tronc-commun-options-de-pre-specialisation-dont-ids--556812.kjsp?RH=1358239694591"><img src="http://dis.univ-lyon2.fr/medias/photo/logo-m1info-miniature_1487323727702-jpg" style="width:40px;height:41px;margin:0px 5px;border:px solid;float:;" alt="" title="M1-iNFO_min"><br></a><br><a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/m2-bi-bd/parcours-m2-bi-bd-business-intelligence-et-big-data-ex-iidee--556813.kjsp?RH=1358239694591"><img src="http://dis.univ-lyon2.fr/medias/photo/logo-bi-bd-miniature_1487327343773-jpg" style="width:40px;height:40px;margin:0px 5px;border:px solid;float:;" alt="Bi&amp;BD miniature" title="Bi&amp;BD miniature"></a> <a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/m2-sise/specialite-m2-sise-statistique-et-informatique-pour-la-science-des-donnees-parcours-statistique-et-informatique--556814.kjsp?RH=1358239694591"><img src="http://dis.univ-lyon2.fr/medias/photo/logo-sise-miniarure_1487327413158-jpg" style="width:40px;height:40px;margin:0px 5px;border:px solid;float:;" alt="SISE miniature" title="SISE miniature"></a><a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/m2-opsie/parcours-2-opsie-organisation-et-protection-des-systemes-d-information-de-l-entreprise--556817.kjsp?RH=1358239694591"><img src="http://dis.univ-lyon2.fr/medias/photo/logo-opsie-miniature_1487327453140-jpg" style="width:40px;height:39px;margin:0px 5px;border:px solid;float:;" alt="OPSIE miniature" title="OPSIE miniature"></a>&nbsp; <a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/m2-dm/parcours-data-mining-556819.kjsp?RH=1358239694591"><br><br><img src="http://dis.univ-lyon2.fr/medias/photo/logo-dm-miniature_1487329123511-jpg" style="width:40px;height:41px;margin:0px 5px;border:px solid;float:;" alt="Miniature DM" title="Miniature DM"></a>&nbsp;&nbsp;&nbsp; <a href="http://dis.univ-lyon2.fr//fr/nos-formations/formations-internationnales/master-idsm-kharkiv/"><img src="http://dis.univ-lyon2.fr/medias/photo/logo-idsm-miniature_1487329161094-jpg" style="width:40px;height:39px;margin:0px 5px;border:px solid;float:;" alt="Miniature IDSM " title="Miniature IDSM "></a><br><br><h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Recrutement</strong></h3><br><a href="http://dis.univ-lyon2.fr/../../../../fr/nos-formations/procedure-de-recrutement-556935.kjsp?RH=1358239694591">Recrutement</a><br><br><h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Règlement de scolarite &amp; Calendrier<br></strong></h3><br><div style="text-align: center;">&nbsp;<a href="http://dis.univ-lyon2.fr/medias/fichier/reglementscolaritelicence2016-2020-cfvu2016-12-16_1486541167612-pdf?INLINE=FALSE">Règlement de scolarité du Master <span class="extension format_pdf" title="Fichier"><span class="extension_crochet">[</span>PDF - 196<abbr title="kilo oc�tets">&nbsp;Ko</abbr><span class="extension_crochet">]</span></span></a></div><br><a href="http://dis.univ-lyon2.fr/medias/fichier/calendrier-officiel-universitaire-2016-2017_1486550586273-pdf?INLINE=FALSE">Calendrier universitaire <span class="extension format_pdf" title="Fichier"><span class="extension_crochet">[</span>PDF - 136<abbr title="kilo oc�tets">&nbsp;Ko</abbr><span class="extension_crochet">]</span></span></a><br>&nbsp;</div><h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;">&nbsp;<strong>&nbsp;Raccourcis offres</strong></h3><br><div style="text-align: center;"><a href="http://dis.univ-lyon2.fr//fr/espace-etudiants/offres-de-stages-et-d-emplois/">Offres de stage et d'emploi</a><br>&nbsp;</div><h3 style="padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Suivre l’actualité du DIS</strong></h3><div style="text-align: center;"><a href="http://dis.univ-lyon2.fr//jsp_usinetemplate/liste_actualites.jsp?RH=1358239694591"><img style="width:50px;height:50px;margin:0px 5px;border:px solid;float:;" alt="" title="" src="http://dis.univ-lyon2.fr/medias/photo/flux-rss_1405499583216-png"></a><a class="lien_externe" title="https://www.facebook.com/DISLyonII?fref=ts (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.facebook.com/DISLyonII?fref=ts"><img style="width:50px;height:50px;margin:0px 5px;border:px solid;float:;" alt="" title="" src="http://dis.univ-lyon2.fr/medias/photo/twitter1_1405499613167-jpg"> <img title="" alt="" style="width:50px;height:50px;margin:0px 5px;border:px solid;float:;" src="http://dis.univ-lyon2.fr/medias/photo/facebook_1416496411464-jpg"></a></div>
  
            </div>  <!-- .encadre_fiche_contenu -->
</div> <!-- .encadre_fiche -->

                    </div>
                </div>
                <!-- #contenu_deco -->
                <div class="separateur"></div>

            </div>
            <!-- #page -->
        </div>
        <!-- #page_deco -->

        <div class="bordure"></div>
        <div id="pied_deco">

            <?php include 'Templates/includes/$pied_deco.html' ?>

        </div>
        <!-- #pied_deco -->

    </body>

</html>
