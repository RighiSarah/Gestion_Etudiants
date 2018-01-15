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
			<p id="fil_ariane">Vous &ecirc;tes ici : <a href="./index.php">Accueil</a> &gt; <a href="creation_promotion.php">Création d'une promotion</a> <span class="separateur_fil_ariane"> </span><strong><span class="titre_fil_ariane">  </span></strong></p>
				<div id="social-sharing" class="addthis_toolbox">
				&nbsp;
				</div>


							<script type='text/javascript'>

								function getXhr(){
								var xhr = null;
								if(window.XMLHttpRequest) // Firefox et autres
									xhr = new XMLHttpRequest();
								else if(window.ActiveXObject){ // Internet Explorer
									try {
										xhr = new ActiveXObject("Msxml2.XMLHTTP");
									} catch (e) {
										xhr = new ActiveXObject("Microsoft.XMLHTTP");
									}
								}
								else { // XMLHttpRequest non supporté par le navigateur
									alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
									xhr = false;
								}
								return xhr;
								}

							</script>


								<h2 style="text-align: center;"><em><strong>Création d'une promotion</strong></em></h2>

								<!--Connexion à la base de données et requete pour remplir la liste déroulante des formations -->
								<?php
		include ('../../includes/admin/connexion.php') ;
		include ('connexion1.php') ;

									//	mysql_select_db($database_connexion1, $connexion1);
									$result = $connexion->prepare('SELECT formation.diminutifFormation_fr FROM formation');
									$result->execute();
									//	$sql = " SELECT formation.diminutifFormation_fr FROM formation ";
									//	$result = mysql_query($sql) or die("Requete pas comprise");


								/* ------------------------------------------------- TRAITEMENT DE LA CREATION DE PROMOTION ------------------------------------------------*/

								// Cette variable booléenne initialisée à false sert à afficher le formulaire ou non selon le type d'utilisateur qui est connecté
								$show_form = false;

									if (isset($_POST['formation']) AND isset($_POST['annee']))
									{
										// Récupération des variables avec échappement
										$formation = htmlspecialchars($_POST['formation']);
										$annee = htmlspecialchars($_POST['annee']);

										// Si la formation a bien été reneignée (pas sur sa valeur par défaut)
										if ($_POST['formation'] != -1)
										{
											// Vérification du format de l'année saisie
											if (preg_match("!^((?:19|20)\d{2})$!", $annee))
											{
												// Requête pour définir la clé primaire du nouvel enregistrement qui va être inséré
												$Recordset = $connexion->prepare('SELECT formation.diminutifFormation_fr FROM formation');
												$Recordset->execute();
												mysql_select_db($database_connexion1, $connexion1);
												$query_Recordset = "SELECT max(NumTrombinoscope) FROM trombinoscope";
												$Recordset = mysql_query($query_Recordset, $connexion1) or die(mysql_error());
												$row_Recordset = mysql_fetch_assoc($Recordset);
												$cle_primaire = $row_Recordset['max(NumTrombinoscope)'] + 1 ;


												// Requête pour récupérer l'id de la formation sélectionnée
												mysql_select_db($database_connexion1, $connexion1);
												$query_Recordset2 = "SELECT idFormation FROM formation WHERE diminutifFormation_fr = '" . $formation . "'";
												$Recordset2 = mysql_query($query_Recordset2, $connexion1) or die(mysql_error());
												$row_Recordset2 = mysql_fetch_assoc($Recordset2);
												$idformation = $row_Recordset2['idFormation'];

												// Vérification de l'existence de la promotion
												$sql1 = "SELECT NumTrombinoscope
														 FROM trombinoscope
														 INNER JOIN formation
														 ON trombinoscope.idFormationTrombi = formation.idFormation
														 WHERE AnneeTrombinoscope='" . $annee . "'AND idFormationTrombi='" . $idformation . "'";
												$req = mysql_query($sql1) or die('Erreur SQL ! ' . $sql1 . '<br />' . mysql_error());

											    $res = mysql_num_rows($req);
												if($res != 0)  // Si la promotion existe déjà dans la table trombinoscope, on affiche un message
												{
													?><script language='JavaScript'>alert('Cette promotion existe déjà. Veuillez réessayer avec d\'autres valeurs.')</script>
													<meta http-equiv ="refresh" content="0;creation_promotion.php"/><?php
												}
												else  // Sinon, l'ajout est effectué
												{
													$sql = "INSERT INTO trombinoscope VALUES ('" . $cle_primaire . "', '" . $annee . "', 'photos/Inconnu.jpg','" . $idformation . "')";
													//  Affichage d'un message d'erreur si la requête ne passe pas
													mysql_query ($sql) or die ('Erreur SQL !'.$sql.'<br />'.mysql_error());

													//Affichage du formulaire et d'un message de confirmation d'ajout
													$show_form = true;
													echo "<p>La promotion a bien été créée. Vous pouvez désormais consulter son trombinoscope si les étudiants de cette promotion ont été ajoutés dans la base de données.</p>";
												}
											}
											else
											{
												$show_form = true;
												echo "<p>Erreur : l'année saisie n'est pas valide, veuillez réessayer.</p>";
											}
										}
										else
										{
											$show_form = true;
											echo "<p>Vous devez renseigner la formation pour pouvoir créer une promotion.</p>";
										}
									}

								?>
									<div style="margin: 20px;">
									<form style=" margin: 0 auto; width: 200px;" id="form-creation-promo" name="form-creation-promo" method="POST" action="creation_promotion.php">
										<div>
										<!-- listes déroulantes pour la formation et l'année-->
											<label style="display: block; float: left; width: 200px;" for="formation">Formation</label>
											<select style="width: 200px; margin-bottom: 15px;" name="formation" id="formation" onchange='go()'>
											<option value="-1" selected>-- Sélectionnez la formation --</option>
											<?php
											while ($row = $result->fetch())
											{
										//		while ($row=mysql_fetch_array($result))
										//		{
													echo"<option>".htmlentities($row[0])."</option>";
												}
											?>
											</select>
										</div>

										<div>
											<label style="display: block; float: left; width: 200px;" for="annee">Année</label>
											<input style="width: 200px; height: 19px; margin-bottom: 10px;"type="text" id="annee" name="annee" required="required" />
										</div>

										<div>
											<label style="display: block; float: left;" for="submit"></label>
											<input type="submit" id="submit" value="Valider" />
										</div>
									</form>
								</div>

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
