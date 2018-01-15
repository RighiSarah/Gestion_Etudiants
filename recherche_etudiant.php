<!doctype html>
<meta charset="utf-8">
<?php

	session_start();
	
if (  !isset($_SESSION['id']) ) {
header("location: ../index.php"); 
}
    require_once("../Design/Design.php"); // OBLIGATOIRE (pensez a adopter le chemin relatif)
	$page = new page("Accueil");
	$page -> start_header();
	$page -> show_header();

?>
	<div class="col-md-12">
	<h2>Bienvenue sur l'intranet du DIS</h2>
	<p><a href="../../logout.php" title="Déconnexion">Déconnexion</a></p>
<?php


	//Affichage du menu
	include("menu.php");
?>

		<div id="avec_nav_avec_encadres" class="contenu">

			<!-- OBLIGATOIRE : chemin permettant à l'utilisateur de revenir en arriere. Chemins relatifs à adapter !!! -->
			<p id="fil_ariane">Vous &ecirc;tes ici : <a href="index.php">Accueil</a> &gt; <a href="recherche_etudiant.php">Recherche d'étudiants</a> <span class="separateur_fil_ariane"> </span><strong><span class="titre_fil_ariane">  </span></strong></p>
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

								/**
								* Méthode qui sera appelée sur le on change du bouton
								*/

								function go(){
									var xhr = getXhr();   // var pour l'annee
									// On défini ce qu'on va faire quand on aura la réponse
									xhr.onreadystatechange = function(){
										// On ne fait quelque chose que si on a tout reçu et que le serveur est ok
										if(xhr.readyState == 4 && xhr.status == 200){
											leselect = xhr.responseText;
										// On se sert de innerHTML pour rajouter les options a la liste
											document.getElementById('nom').innerHTML = leselect;
										}
									}
									// Ici on va voir comment faire du post
									xhr.open("POST","ajaxnom.php",true);
									// ne pas oublier ça pour le post
									xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
									// ne pas oublier de poster les arguments

									sel1 = document.getElementById('annee');
									Selannee = sel1.options[sel1.selectedIndex].value;

									sel2 = document.getElementById('formation');
									Selformation = sel2.options[sel2.selectedIndex].value;


									xhr.send("Selannee="+Selannee+"&Selformation="+Selformation);
								}

								function champ1() {
									document.getElementById("num" ).style.visibility = "hidden";
									document.getElementById("num" ).value = "";
									document.getElementById("nom" ).style.visibility = "visible";
								}
								function champ2() {
									document.getElementById("nom" ).style.visibility = "hidden";
									document.getElementById("nom" ).value = "";
									document.getElementById("num" ).style.visibility = "visible";
								}

							</script>



							<h2 style="text-align: center;"><em><strong>Recherche d'étudiants</strong></em></h2>

								<!--Connexion à la base de données et requêtes remplir les listes déroulantes -->
								<?php
								include("../../includes/admin/connexion.php");
								include ('connexion1.php') ;
									mysql_select_db($database_connexion1, $connexion1);
									$sql = " SELECT formation.diminutifFormation_fr FROM formation ";
									$result = mysql_query($sql) or die("Requete pas comprise");
									$sql2 = " SELECT distinct(trombinoscope.AnneeTrombinoscope) FROM trombinoscope order by AnneeTrombinoscope asc";
									$result2 = mysql_query($sql2) or die("Requete pas comprise");
									$sql3 = "SELECT utilisateur.NomUtilisateur
										FROM utilisateur, trombinoscope, inscrire
										WHERE utilisateur.NumUtilisateur=inscrire.NumEtudiant
										AND trombinoscope.IdFormationTrombi=inscrire.IdFormation
										AND utilisateur.idRole ='5'
										GROUP BY utilisateur.NomUtilisateur
										ORDER BY utilisateur.NomUtilisateur" ;
									$result3 = mysql_query($sql3) or die("Requete pas comprise");
									/*$sql = "SELECT `diminutifFormation_fr` FROM `formation`";
									$result = $connexion->exec($sql) or die("Requete pas comprise");
									$sql2 = " SELECT distinct(trombinoscope.AnneeTrombinoscope) FROM trombinoscope order by AnneeTrombinoscope asc";
									$result2 = $connexion->execute($sql2) or die("Requete pas comprise");
									$sql3 = "SELECT utilisateur.NomUtilisateur
										FROM utilisateur, trombinoscope, inscrire
										WHERE utilisateur.NumUtilisateur=inscrire.NumEtudiant
										AND trombinoscope.IdFormationTrombi=inscrire.IdFormation
										AND utilisateur.idRole ='5'
										GROUP BY utilisateur.NomUtilisateur
										ORDER BY utilisateur.NomUtilisateur" ;
									$result3 = $connexion->execute($sql3) or die("Requete pas comprise");*/
									$result = $connexion->prepare("SELECT formation.diminutifFormation_fr FROM formation ");
									$result->execute();
									$result2 = $connexion->prepare("SELECT distinct(trombinoscope.AnneeTrombinoscope) FROM trombinoscope order by AnneeTrombinoscope asc");
									$result2->execute();
									$result3 =$connexion->prepare("SELECT utilisateur.NomUtilisateur
										FROM utilisateur, trombinoscope, inscrire
										WHERE utilisateur.NumUtilisateur=inscrire.NumEtudiant
										AND trombinoscope.IdFormationTrombi=inscrire.IdFormation
										AND utilisateur.idRole ='5'
										GROUP BY utilisateur.NomUtilisateur
										ORDER BY utilisateur.NomUtilisateur");
									$result3->execute();
									
								?>

								<div style="margin-bottom: 20px;">
									<form id="form14" name="form14" method="POST" action="recherche_etudiant.php">
											<div style="float: left; margin-right: 20px;">
											<!-- listes déroulantes pour la formation et l'année-->
												<label for="formation">Formation</label>
													<select name="formation" id="formation" onchange='go()'>
														<option value="-1" selected>Toutes</option>
														<?php
															while ($row=$result->fetch())
															//while ($row=mysql_fetch_array($result)) 
															{
																echo"<option>".htmlentities($row[0])."</option>";
															}
														?>
													</select>
											</div>

											<div style="float: left; margin-right: 20px;">
												<label for="annee">Année</label>
													<select name="annee" id="annee" onchange='go()'>
														<option value="-1" selected>Toutes</option>
														<?php
															while ($row=$result2->fetch())
															//while ($row=mysql_fetch_array($result2))
															{
																echo"<option>".($row[0])."</option>";
															}
														?>
													</select>
											</div>

											<br />
											<br />

											<div style="float: left; margin-right: 20px;">
												<input type="radio" name="monchoix" id="choix2" onClick="champ1();" /> Nom étudiant
												<div id="nom" style="margin-bottom: 10px; visibility:hidden">
													<label for="nom">Nom</label>
														<select name="nom" id="nom">
															<option value="-1" selected>Tous</option>
															<?php
																while ($row=$result3->fetch())
																//while ($row=mysql_fetch_array($result3))
																{
																	echo"<option>".($row[0])."</option>";
																}
															?>
														</select>
												</div>
											</div>

											<div style="float: left; margin-right: 20px;">
												<input type="radio" name="monchoix" id="choix3" onClick="champ2();" /> N° étudiant
												<div id="num" style="margin-bottom: 10px; visibility:hidden">
													<input type="text" id="num" name="num"/>
												</div>
											</div>

											<div style="clear: both;">
												<label for="submit"></label><input type="submit" id="submit" value="Rechercher" />
											</div>
									</form>
								</div>

							<?php
							/* ------------------------------------------------- TRAITEMENT DE LA RECHERCHE D'ETUDIANTS ------------------------------------------------*/
								include("resultat_recherche_etudiant.php");
							?>

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
