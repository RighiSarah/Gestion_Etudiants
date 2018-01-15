<?php

	session_start();

	if (  !isset($_SESSION['id']) ) {
header("location: ../index.php"); 
}
    require_once("../Design/Design.php"); // OBLIGATOIRE
	$page = new page("Accueil");
	$page->start_header(); // OBLIGATOIRE
	$page->show_header(); // OBLIGATOIRE

		include ('../../includes/admin/connexion.php') ;
		include ('connexion1.php') ;
	mysql_select_db($database_connexion1, $connexion1);

	if (!isset($_GET['num']) && !isset($_POST['num'])) {
		header('Location: recherche_etudiant.php');
	}
	if (isset($_GET['num'])) {
		$id_transmit= $_GET['num'];
	}
	if (isset($_POST['num'])) {
		$id_transmit= $_POST['num'];
	}


	// - FONCTION UTILISE PAR LA PAGE

	// fonction enlevement extension
		function backstr($haystack, $needle) {
			return substr($haystack, 0, strlen($haystack) - strlen(strrchr($haystack,$needle)));
		}


	// - EXECUTION DE LA PAGE

	$query_Etudiant = "SELECT * FROM Utilisateur JOIN Etudiant ON NumEtudiant=NumUtilisateur WHERE NumUtilisateur='".mysql_real_escape_string($id_transmit)."'";
	$Etudiant = mysql_query($query_Etudiant, $connexion1) or die(mysql_error());
	$row_Etudiant = mysql_fetch_assoc($Etudiant);
	$query_Formation = "SELECT * FROM Inscrire JOIN Formation ON Inscrire.idFormation=Formation.idFormation WHERE NumEtudiant=".$row_Etudiant['NumEtudiant'].";";
	$Formation =  mysql_query($query_Formation, $connexion1) or die(mysql_error());

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

			<!-- OBLIGATOIRE : chemin permettant à l'utilisateur de revenir en arriere. Chemins relatifs à adapter  -->
			<p id="fil_ariane">Vous &ecirc;tes ici : Accueil</a> &gt; <a href="recherche_etudiant.php">Recherche d'étudiants</a> &gt; Profil de l'étudiant <span class="separateur_fil_ariane"> </span><strong><span class="titre_fil_ariane">  </span></strong></p>
				<div id="social-sharing" class="addthis_toolbox">
				&nbsp;
				</div>
							<?php
								if (isset($_POST["submit"])) {
									if ($_FILES['fileToUpload']['error'] != 0) {
										switch ($_FILES['fileToUpload']['error'])
										{
										   case 1: // UPLOAD_ERR_INI_SIZE
										   echo "ERREUR : Le fichier dépasse la limite autorisée par le serveur (fichier php.ini) !<br/>";
										   break;
										   case 2: // UPLOAD_ERR_FORM_SIZE
										   echo "ERREUR : Le fichier dépasse la limite autorisée dans le formulaire HTML !<br/>";
										   break;
										   case 3: // UPLOAD_ERR_PARTIAL
										   echo "ERREUR : L'envoi du fichier a été interrompu pendant le transfert !<br/>";
										   break;
										   case 4: // UPLOAD_ERR_NO_FILE
										   echo "ERREUR : Le fichier que vous avez envoyé a une taille nulle !<br/>";
										   break;
										}
									}

									$target_dir = "photos/Etudiants/";
									$target_file = $target_dir.basename($_FILES["fileToUpload"]["name"]);
									$uploadOk = 1;
									$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
									$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);

									if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {

										echo "ERREUR : Seul les JPEG, les PNG, les JPG et les GIF sont autorisé.<br/>";
										$uploadOk = 0;
									}

									if ($uploadOk == 0) {
										echo "Fichier non uploadé.<br/>";
									} else {

										$i = 1;
										$initial_name = backstr($target_file,'.')."";
										while (file_exists($target_file)) {
											$fichierWext = $initial_name."_".$i;
											$target_file = $fichierWext.".".$imageFileType;
											$i = $i+1;
										}

										if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
											echo "Le fichier a été correctement uploadé<br/>";

											if ($_POST["kelphoto"] == 0) {
												mysql_query("UPDATE Utilisateur SET photoUtilisateur = '$target_file' WHERE NumUtilisateur = $id_transmit;", $connexion1) or die(mysql_error());
											} else {
												mysql_query("UPDATE Inscrire SET PhotoEtudiantPromotion = '$target_file' WHERE NumEtudiant = $id_transmit AND idFormation = ".$_POST["kelphoto"].";", $connexion1) or die(mysql_error());
											}

										} else {
											echo "Erreur imprévu lors de l'upload<br/>";
										}
									}
								}

								$query_Etudiant = "SELECT * FROM Utilisateur JOIN Etudiant ON NumEtudiant=NumUtilisateur WHERE NumUtilisateur='".mysql_real_escape_string($id_transmit)."'";
								$Etudiant = mysql_query($query_Etudiant, $connexion1) or die(mysql_error());
								$row_Etudiant = mysql_fetch_assoc($Etudiant);
								$query_Formation = "SELECT * FROM Inscrire JOIN Formation ON Inscrire.idFormation=Formation.idFormation WHERE NumEtudiant=".$row_Etudiant['NumEtudiant'].";";
								$Formation =  mysql_query($query_Formation, $connexion1) or die(mysql_error());

									echo "<h2 style='text-align: center;'><em><strong>" .$row_Etudiant['PrenomUtilisateur']. " " .$row_Etudiant['NomUtilisateur']."</strong></em></h2><br>";
									echo "<table style='width: 100%; border-collapse: collapse; margin: 0; border: none;'>
											<tr>
												<td style='vertical-align: middle;'>";
													if (file_exists($row_Etudiant["photoUtilisateur"])) {
														echo '<img src="'.$row_Etudiant["photoUtilisateur"].'"/>';
													}
													else
													{
														echo '<img src="photos/Inconnu.jpg"/>';
													}
											echo "<td style='vertical-align: middle;'>
												  	<h3 style='text-align: center;'>Email : " .$row_Etudiant["EmailUtilisateur"]."
												 	<br />
												 	N° étudiant : " .$row_Etudiant["NumEtudiant"]. "</h3>
											  	</td>
											</tr>
										</table>";
													echo '<form action="detail_resultat_recherche_etudiant.php?num='.$id_transmit.'" method="post" enctype="multipart/form-data">
																	<p>Modifier la photo :</p>
																	<input type="hidden" name="kelphoto" id="kelphoto" value=0>
																	<input type="file" name="fileToUpload" id="fileToUpload">
																	<br />
																	<input type="submit" value="Valider" name="submit">
																</form>';

							?>

							<br />
							<br />
							<br />

								<h2 style='text-align: center;'>Formation(s) suivie(s)</h2><br>
								<table style='border-collapse: collapse; cellpadding=30'>
								<?php
									while($row_Formation = mysql_fetch_assoc($Formation)){
										echo "<h3 style='text-align : center;'> " .$row_Formation['diminutifFormation_fr']. "<br />Promotion de " . ($row_Formation['anneeInscrire'] + 1). "</h3><br />";
											if (file_exists($row_Formation["PhotoEtudiantPromotion"]))
												echo '<p style="text-align : center;"> <img src="' .$row_Formation['PhotoEtudiantPromotion']. '"/></p>';
											else
											{
												echo '<p style="text-align : center;"><img src="photos/Inconnu.jpg"/></p>';
												echo '<div style="width: 250px; margin: 0 auto 50px;">
														<form action="detail_resultat_recherche_etudiant.php?num='.$id_transmit.'" method="post" enctype="multipart/form-data">
															<p>Modifier la photo :</p>
															<input type="hidden" name="kelphoto" id="kelphoto" value='.$row_Formation['idFormation'].'>
															<input type="file" name="fileToUpload" id="fileToUpload">
															<br />
															<input type="submit" value="Valider" name="submit">
														</form>
													</div>
													<hr />
													<br />';
											}
									}
								?>

								<br />

								</table>
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
