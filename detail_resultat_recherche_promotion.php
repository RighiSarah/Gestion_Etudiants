<!doctype html>
<?php

	session_start();

if (  !isset($_SESSION['id']) ) {
header("location: ../index.php"); 
}
    require_once("../Design/Design.php"); // OBLIGATOIRE (pensez a adopter le chemin relatif)
	$page = new page("Accueil");
	$page->start_header(); // OBLIGATOIRE
	$page->show_header(); // OBLIGATOIRE

	//	include ('../../includes/admin/connexion.php') ;
	include ('connexion1.php') ;
	mysql_select_db($database_connexion1, $connexion1);

	$idform = $_GET['promo'];
	$an = $_GET['an'];


	// - FONCTION UTILISEE PAR LA PAGE

	// fonction enlevement extension
    function backstr($haystack, $needle) {
		return substr($haystack, 0, strlen($haystack) - strlen(strrchr($haystack,$needle)));
    }

	//Fonction génération miniature
	function images_resize_carree($src, $dest, $largeur, $pos){
		list($srcX, $srcY, $type, $attr) = getimagesize($src);
		$imgSrc=imagecreatefromstring(file_get_contents($src));
		$horizontale = false;
		$verticale = false;
		if (empty($imgSrc)){
			return false;
		}
		if($srcX>= $srcY){
			$dim=$srcY;
			$horizontale=true;
		}
		elseif($srcX<= $srcY){
			$dim=$srcX;
			$verticale=true;
		}
		else{
			$dim=$srcX;
		}
        //on determine le point de depart x,y
		if($horizontale){
			switch($pos){
			case "left":
				$point_x_ref="0";
				$point_y_ref="0";
				break;
			case "right":
				$point_x_ref=($srcX)-($dim);
				$point_y_ref="0";
				break;
			default:
				$point_x_ref=($srcX/2)-($dim/2);
				$point_y_ref="0";
				break;
			}
		}
		elseif($verticale){
			switch($pos){
			case "top":
				$point_x_ref="0";
				$point_y_ref="0";
				break;
			case "bottom":
				$point_x_ref="0";
				$point_y_ref=($srcY)-($dim);
				break;
			default:
				$point_x_ref="0";
				$point_y_ref=($srcY/2)-($dim/2);
				break;
			}
		}
		$imDest=@imagecreatetruecolor($largeur, $largeur);
        imagecopyresampled($imDest, $imgSrc, 0, 0, $point_x_ref, $point_y_ref, $largeur , $largeur, $dim, $dim);
		imagedestroy($imgSrc);
		imagejpeg($imDest, $dest, 100);
		imagedestroy($imDest);
		return true;
    }

	// --- CODE DE LA PAGE ---

    $rep = "photos/Etudiants"; // Répertoire contenant les images
    $cache = "cache"; //nom du dossier à créer pour le cache (là ou se trouve les miniatures. Donc en fait c'est pas un cache)
    $taille = "80"; // Taille des miniature $taille x $taille en pixel

	// Requête pour récupérer le nom et les images des étudiants concernés.
	mysql_select_db($database_connexion1, $connexion1);
	$query_Recordset2 = "	SELECT NumUtilisateur, NomUtilisateur, PrenomUtilisateur, photoUtilisateur
							FROM utilisateur INNER JOIN inscrire ON numEtudiant=numUtilisateur
							WHERE idFormation = $idform AND anneeInscrire = $an - 1
							ORDER BY NomUtilisateur, PrenomUtilisateur;";
	$Recordset2 = mysql_query($query_Recordset2, $connexion1) or die(mysql_error());
	$row_Recordset2 = mysql_fetch_assoc($Recordset2);

	// Requête pour récupérer l'intitulé de la formation ainsi que l'année de la proomtion concernée
	mysql_select_db($database_connexion1, $connexion1);
	$query_Recordset4 = "	SELECT *
							FROM formation
							WHERE idFormation = $idform;";
	$Recordset4 = mysql_query($query_Recordset4, $connexion1) or die(mysql_error());
	$row_Recordset4 = mysql_fetch_assoc($Recordset4);

    if (!file_exists($rep.'/'.$cache)){ // Si le fichier cache n'existe pas
		mkdir($rep.'/'.$cache); //création du repertoire
	}

    $chemin = $rep.'/'.$cache.'/'; //chemin répertoire cache

	// Affichage fait au milieu du code HTML.
?>
	<div class="col-md-12">
	<h2>Bienvenue sur l'intranet du DIS</h2>
	<p><a href="../../logout.php" title="Déconnexion">Déconnexion</a></p>
<?php
	//include ('includes/admin/connexion.php') ;

	//Affichage du menu
	include("menu.php");
?>

		<div id="avec_nav_avec_encadres" class="contenu">

			<!-- OBLIGATOIRE : chemin permettant à l'utilisateur de revenir en arriere. Chemins relatifs à adapter !!! -->
			<p id="fil_ariane">Vous &ecirc;tes ici : <a href="index.php">Accueil</a> &gt; <a href="recherche_promotion.php">Recherche de promotions</a> &gt; Trombinoscope de la promotion <span class="separateur_fil_ariane"> </span><strong><span class="titre_fil_ariane">  </span></strong></p>
				<div id="social-sharing" class="addthis_toolbox">
				&nbsp;
				</div>
								<?php
									echo "<h2 style='text-align: center;'><em><strong>".$row_Recordset4["diminutifFormation_fr"]." ".$an."</strong></em></h2><br>" ;
									do {
										if (file_exists($row_Recordset2["photoUtilisateur"])) 		// Si la photo de base n'existe pas
											$photo = $row_Recordset2["photoUtilisateur"];					// Prendre la photo INCONNU
										else
											$photo = "photos/Inconnu.jpg";

										$extension = strrchr($photo,'.');									// récupérer l'extension avec le point
										$fichierWext = backstr($photo,'.');
										$imgThumb = "photos/Etudiants/cache".strrchr($fichierWext,'/').'-thumb'.$extension;						// nom complet miniature
										if (!file_exists($imgThumb)) 								//Si la miniature n'existe pas, on la crée
											images_resize_carree($photo,$imgThumb,$taille,"");
											if ($row_Recordset2!=null)
										echo '<a href="detail_resultat_recherche_etudiant.php?num='.$row_Recordset2["NumUtilisateur"].'" class="fancybox" rel="fancy" ><img src="'.$imgThumb.'" alt="'.$row_Recordset2["NomUtilisateur"]." ".$row_Recordset2["PrenomUtilisateur"].'" /></a>';
										echo "\n";

									} while ($row_Recordset2 = mysql_fetch_assoc($Recordset2));
								?>

										<!-- FIN DU A MODIFIER -->

			</div> <!-- fin #avec_nav_avec_encadres .contenu -->

							<!-- Menus de droite -->
							<hr class="separateur_sections_page"/>
							<div id="encadres">

									<div class="encadre_rubrique firstencadre">
										<div class="encadre_rubrique_contenu">
											<br/><img title="" alt="" style="margin: 0px 5px; width: 153px; height: 138px;" src="http://dis.univ-lyon2.fr/medias/photo/logo-dis-icom_1404207711713-jpg" />
										</div>
									</div>


									<div class="encadre_fiche">
										<div class="encadre_fiche_contenu">
											<h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Emplois Du Temps</strong></h3>
											&nbsp;
												<div style="text-align: center;">
												&nbsp;&nbsp;
													<a  class="lien_externe" title="l3 ids (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&mode=WEEK&height=600&wkst=2&hl=fr&bgcolor=%23FFFFFF&src=o4v690ukfsmapnghv2nsa1m90s%40group.calendar.google.com&color=%23BE6D00&ctz=Europe%2FParis" > L3 IDS</a>
													<br />
													&nbsp; &nbsp;
													<a  class="lien_externe" title="m1 informatique (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&mode=WEEK&height=600&wkst=2&hl=fr&bgcolor=%23FFFFFF&src=oiij44825r9776g538a6q5e4gs%40group.calendar.google.com&color=%231B887A&ctz=Europe%2FParis" >M1 INFORMATIQUE</a>
													<br />
													&nbsp; &nbsp;
													<a  class="lien_externe" title="m2 sise (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=l532b25pideg98b0ghag66i5qs%40group.calendar.google.com&amp;color=%23B1365F&amp;ctz=Europe%2FParis" >M2 SISE</a>
													<br />
													&nbsp; &nbsp;
													<a  class="lien_externe" title="m2 iidee - g1 (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=dfivjf5ons124vpfa8mv7t6smo%40group.calendar.google.com&amp;color=%23182C57&amp;ctz=Europe%2FParis" >M2 IIDEE - G1 </a>
													<br />&nbsp; &nbsp;
													<a  class="lien_externe" title="m2 iidee - g2 (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?src=d5ftrlludj92kmpoa8qh1a2tog%40group.calendar.google.com&ctz=Europe/Paris&mode=WEEK&color=%23060D5E" >M2 IIDEE - G2 </a>
													<br />&nbsp; &nbsp;
													<a  class="lien_externe" title="m2 opsie - g1 (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&mode=WEEK&height=600&wkst=2&hl=fr&bgcolor=%23FFFFFF&src=7fni5cv986at99r98n1p6aosoc%40group.calendar.google.com&color=%232F6309&ctz=Europe%2FParis" >M2 OPSIE - G1 </a>
													<br />&nbsp; &nbsp;
													<a  class="lien_externe" title="m2 opisie - g2 (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?src=qkgna5tq216mpn1d4j27a69hok%40group.calendar.google.com&ctz=Europe/Paris&mode=week&color=%230D7813" >M2 OPSIE - G2 </a>
													<br />&nbsp; &nbsp;
													<a  class="lien_externe" title="m2 ecd  (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://www.google.com/calendar/embed?&mode=WEEK&height=600&wkst=2&hl=fr&bgcolor=%23FFFFFF&src=9iuamt01d0p9c3ahgqk96pqa7s%40group.calendar.google.com&color=%23853104&ctz=Europe%2FParis" >M2 ECD  </a>
													<br />&nbsp; &nbsp;
												</div>
											<h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Raccourcis formations</strong></h3>
											<a href="../../../../fr/nos-formations/formations-initiales/licence-bidisciplinaire-de-sciences-economiques-et-de-gestion-mention-idea-l1-et-l2--556809.kjsp?RH=1358239694591"><br /></a>
											<div style="text-align: center;">
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/licence-idea-parcours-ids-informatique-decisionnelle-et-statistique-l3-preparation-au-master-d-informatique-specialite-ids-556811.kjsp?RH=1358239694591">L1-L2 IDEA</a>
											</div>
											<div style="text-align: center;">
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/licence-bidisciplinaire-de-sciences-economiques-et-de-gestion-mention-idea-l1-et-l2--556809.kjsp?RH=1358239694591">L3 IDEA-IDS</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/premiere-annee-du-master-d-informatique-m1-tronc-commun-options-de-pre-specialisation-dont-ids--556812.kjsp?RH=1358239694591">M1 INFORMATIQUE</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/specialite-ids-parcours-m2-iidee-ingenierie-informatique-de-la-decision-et-de-l-evaluation-economique--556813.kjsp?RH=1358239694591">M2 IDS-IIDEE</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/specialite-ids-parcours-m2-sise-statistique-et-informatique-socio-economiques--556814.kjsp?RH=1358239694591">M2 IDS-SISE</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/specialite-ids-parcours-2-opsie-organisation-et-protection-des-systemes-d-information-de-l-entreprise--556817.kjsp?RH=1358239694591">M2 IDS-OPSIE</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-initiales/specialite-ecd-extraction-des-connaissances-a-partir-des-donnees--556819.kjsp?RH=1358239694591">M2 ECD</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-internationnales/master-kharkov-556862.kjsp?RH=1358239694591">MASTER IDSM-KHARKOV</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/formations-internationnales/master-erasmus-mundus-dmkm-556864.kjsp?RH=1358239694591">MASTER ERASMUS MUNDUS DMKM</a>
												<br />
												<a href="http://dis.univ-lyon2.fr/fr/nos-formations/procedure-de-recrutement-556935.kjsp?RH=1358239694591">RECRUTEMENT</a>
												<br />
												</div>
											<h3 style="margin: 0px; padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;">&nbsp;<strong> Raccourcis offres</strong></h3>
											<br />
											<div style="text-align: center;">
												<a href="http://dis.univ-lyon2.fr/jsp_usinetemplate/liste_actualites.jsp?RH=1358239694591" >Offres de stage et d&#39;emploi</a>
												<br />
												&nbsp;
											</div>
											<h3 style="padding: 2px 0px 1px 4px; font-family: arial; font-size: 13px; border-bottom: 2px solid rgb(39, 104, 170); font-variant: small-caps; text-align: center;"><strong>Suivre l’actualité du DIS</strong></h3>
											<div style="text-align: center;"><a href="http://dis.univ-lyon2.fr/jsp_usinetemplate/liste_actualites.jsp?RH=1358239694591" ><img src="http://dis.univ-lyon2.fr/medias/photo/flux-rss_1405499583216-png" style="width:50px;height:50px;margin:0px 5px;border:px solid;float:;" alt="" title="" /></a>
											<a  class="lien_externe" title="https://twitter.com/dis_lyon2 (nouvelle fen&ecirc;tre)" onclick="window.open(this.href);return false;" href="https://twitter.com/dis_lyon2" ><img src="http://dis.univ-lyon2.fr/medias/photo/twitter1_1405499613167-jpg" style="width:50px;height:50px;margin:0px 5px;border:px solid;float:;" alt="" title="" /></a>
											<a  class="lien_externe" title="https://www.facebook.com/DISLyonII?fref=ts (nouvelle fenêtre)" onclick="window.open(this.href);return false;" href="https://www.facebook.com/DISLyonII?fref=ts" ><img src=" http://dis.univ-lyon2.fr/medias/photo/facebook_1416496411464-jpg" style="width:50px;height:50px;margin:0px 5px;border:px solid;float:;" alt="" title="" /></a>


											</div>
										</div>

									</div>

			</div>

		</div>
		<div class="separateur"></div>

	</div>
</div>



<!-------------------------------------------------FIN MENU + CONTENU -------------------------------------------------------------->

<?php
$page->show_footer();
?>
