<?php
/*----------------------------- TRAITEMENT DE LA RECHERCHE D'ETUDIANTS ---------------------------------*/
include("../../includes/admin/connexion.php");
	//Si les variables critères existent
	if (isset($_POST ['formation']) AND isset($_POST['annee']) AND isset($_POST['nom']) AND isset($_POST['num']))
	{
		//Récupération des critères de recherche
		$formation = htmlspecialchars($_POST['formation']);
		$annee = htmlspecialchars($_POST['annee']);
		$nom = htmlspecialchars($_POST['nom']);
		$num = htmlspecialchars($_POST['num']);

				//Si tous les critères sont sur leur valeur par défaut, on affiche tous les étudiants
					if ($annee == -1 AND $nom == -1 AND $num == "" AND $formation == -1)
					{
					//	mysql_select_db($database_connexion1, $connexion1);
					//	$sql = " SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
					//			 FROM utilisateur, formation, inscrire
					//			 WHERE formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur";
					//	$result = mysql_query($sql) or die("Requete pas comprise");
						$result = $connexion->prepare("SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
								 FROM utilisateur, formation, inscrire
								 WHERE formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur ");
						$result->execute();

						if ($result == null)
						{
							echo"<p>La recherche effectuée ne renvoie aucun résultat.<p>";
						}
						else
						{
							$compteur_c = 0;
							echo "<h2 style='text-align: center;'>étudiants du DIS</strong></h2><br />" ;
							echo "<table width='100%' cellpadding=20 style='border: 0px;'><tr>";
							//while($l=mysql_fetch_object($result))
							while ($l=$result->fetch())
							{
								$compteur_c = $compteur_c + 1 ;
								echo"<td>";
								if ($l['photoUtilisateur'] == "photos/Inconnu.jpg")
								{
								//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
									echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
								}
								else
								{
								//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
									echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
								}
								echo"</td>";
								if ($compteur_c == 3)
								{									// si on en est à la 4ème photo, on créé une nouvelle ligne
									echo "</tr><tr>" ;
									$compteur_c = 0 ;
								}
							}
							echo "</table>";
						}
					}

				// Recherche avec la formation
					if ($annee == -1 AND $nom == -1 AND $num == "" AND $formation != -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT DISTINCT IdFormation FROM formation WHERE formation.diminutifFormation_fr='" . $formation . "'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT DISTINCT IdFormation FROM formation WHERE formation.diminutifFormation_fr='" . $formation . "'");
							$result->execute();
							//if (mysql_num_rows($result) == 0)
							if ($result == null){
								echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
							}
							else
							{
								$compteur_c = 0;
								//while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$idfor=$l['IdFormation'];
								}

								//$sql2 = " SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
								//		  FROM utilisateur, formation, inscrire
								//		  WHERE formation.IdFormation='" . $idfor . "' AND formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur
								//		  ORDER BY inscrire.anneeInscrire DESC, utilisateur.NomUtilisateur";
								//$result2 = mysql_query($sql2) or die("Requete pas comprise");
								$result2 = $connexion->prepare(" SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
										  FROM utilisateur, formation, inscrire
										  WHERE formation.IdFormation='" . $idfor . "' AND formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur
										  ORDER BY inscrire.anneeInscrire DESC, utilisateur.NomUtilisateur");
								$result2->execute();

								echo "<h2 style='text-align: center;'>étudiants ayant suivi la formation " . $formation . "</h2><br />" ;
								echo "<table width='100%' cellpadding=20 style='border: 0px;'><tr>";
								//while($l=mysql_fetch_object($result2))
								while ($l=$result2->fetch())
								{
									$compteur_c = $compteur_c + 1 ;
									$anneePromo = $l['anneeInscrire'] + 1;
									echo"<td>";
									if ($l['photoUtilisateur'] == "photos/Inconnu.jpg")
									{
									//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "<br />Promotion de " . $anneePromo . "</strong></p>";
										echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "<br />Promotion de " . $anneePromo . "</strong></p>";
									}
									else
									{
									//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "<br />Promotion de " . $anneePromo . "</strong></p>";
										echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "<br />Promotion de " . $anneePromo . "</strong></p>";
									}
									echo"</td>";
									if ($compteur_c == 3)
									{
										echo "</tr><tr>" ;
										$compteur_c = 0 ;
									}
								}
								echo "</table>";
							}
					}



					// Recherche avec l'année et la formation
					if ($annee != -1 AND $nom == -1 AND $num == "" AND $formation != -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT DISTINCT IdFormation FROM formation WHERE formation.diminutifFormation_fr='" . $formation . "'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT DISTINCT IdFormation FROM formation WHERE formation.diminutifFormation_fr='" . $formation . "'");
							$result->execute();
							//if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
							}
							else
							{
								$compteur_c = 0;
								//while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$idfor=$l['IdFormation'];
								}

							//	$sql2 = " SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
							//			  FROM utilisateur, formation, inscrire
							//			  WHERE formation.IdFormation='" . $idfor . "' AND inscrire.anneeInscrire = '".($annee - 1)."' AND formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur
							//			  ORDER BY inscrire.anneeInscrire DESC, utilisateur.NomUtilisateur";
							//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
								$result2 = $connexion->prepare(" SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
										  FROM utilisateur, formation, inscrire
										  WHERE formation.IdFormation='" . $idfor . "' AND inscrire.anneeInscrire = '".($annee - 1)."' AND formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur
										  ORDER BY inscrire.anneeInscrire DESC, utilisateur.NomUtilisateur");
								$result2->execute();

								echo "<h2 style='text-align: center;'>étudiants de la promotion ".$formation." " .$annee. "</h2><br />" ;
								echo "<table width='100%' cellpadding=20 style='border: 0px;'><tr>";
							//	while($l=mysql_fetch_object($result2))
								while ($l=$result2->fetch())
								{
									$compteur_c =$compteur_c + 1 ;
									echo"<td>";
									if ($l['photoUtilisateur'] == "photos/Inconnu.jpg")
									{
									//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
										echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
									}
									else
									{
									//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
										echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
									}
									echo"</td>";
									if ($compteur_c == 3)
									{
										echo "</tr><tr>" ;
										$compteur_c = 0 ;
									}
								}
								echo "</table>";
							}
					}



					// Recherche avec l'année
					if ($annee != -1 AND $nom == -1 AND $num == "" AND $formation == -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
						//			 FROM utilisateur, formation, inscrire
						//			 WHERE inscrire.anneeInscrire = '".($annee - 1)."' AND formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
									 FROM utilisateur, formation, inscrire
									 WHERE inscrire.anneeInscrire = '".($annee - 1)."' AND formation.IdFormation = inscrire.IdFormation AND inscrire.NumEtudiant = utilisateur.NumUtilisateur");
							$result->execute();

						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
							}
							else
							{
								$compteur_c = 0;
								echo "<h2 style='text-align: center;'>étudiants du DIS pour l'année ".$annee."</h2><br>" ;
								echo "<table width='100%' cellpadding=20 style='border: 0px;'><tr>";
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$compteur_c =$compteur_c + 1 ;
									echo"<td>";
									if ($l['photoUtilisateur'] == "photos/Inconnu.jpg")
									{
									//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
										echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
									}
									else
									{
									//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
										echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
									}
									echo"</td>";
									if ($compteur_c == 3)
									{									// si on en est à la 4ème formation, on créé une nouvelle ligne
										echo "</tr><tr>" ;
										$compteur_c = 0 ;
									}
								}
								echo "</table>";
							}
					}

					/////////////AUTRES CRITERES/////////////

					// Recherche avec le nom
					if ($annee == -1 AND $nom != -1 AND $num == "" AND $formation == -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur FROM Utilisateur WhERE NomUtilisateur='".$nom."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur FROM Utilisateur WhERE NomUtilisateur='".$nom."'");
							$result->execute();
						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le nom est inconnu.</p>";
							}
							else
							{
								$compteur_c = 0;
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									if ($compteur_c != 0)
									{						// on remet le compteur pour le tableau à 0 pour chaque nouvel étudiant
										$compteur_c = 0 ;
									}
									$nomutili=$l['NomUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
									$photoutili=$l['photoUtilisateur'];

									echo "<h2 style='text-align: center;'>Consultation de l'étudiant(e)</h2><br>" ;
									if ($photoutili == "")
									{
										echo "<p>L'étudiant ".$prenomutili." ".$nomutili." n'a pas encore de photo</p>";
									}
									else
									{
										if ($photoutili == "photos/Inconnu.JPG")
										{
											echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
										}
										else
										{
											echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
										}
									}
									echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />";

								//	mysql_select_db($database_connexion1, $connexion1);
								//	$sql2 = " SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$numutili."'";
								//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
									$result2 = $connexion->prepare(" SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$numutili."'");
									$result2->execute();
									$compteur_c = 0;

									echo "<ul style='list-style: none; text-align: center;'>";
								//	while($l2=mysql_fetch_object($result2))
									while ($l2=$result2->fetch())
									{
										$id=$l2['idFormation'];
										$anneeTrombi=$l2['anneeInscrire'] + 1;

									//	mysql_select_db($database_connexion1, $connexion1);
									//	$sql3 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
									//			  From Trombinoscope,formation
									//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
									//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
									//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
										$result3 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
												  From Trombinoscope,formation
												  Where formation.idFormation=trombinoscope.IdFormationTrombi
												  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
										$result3->execute();

									//	while($l3=mysql_fetch_object($result3))
										while ($l3=$result3->fetch())
										{
											$idfor=$l3['IdFormationTrombi'];
										//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
										//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
											$result4 = $connexion->prepare("SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
											$result4->execute();

										//	while($l2=mysql_fetch_object($result4))
											while ($l2=$result4->fetch())
											{
											//	echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l3->AnneeTrombinoscope&promo=$l3->IdFormationTrombi' target=_blank>" .$l2->diminutifFormation_fr. " " .$l3->AnneeTrombinoscope. "</a>";
												echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
											}
										}
									}
									echo "</ul>
										  <br />
										  <hr />
										  <br />
										  <br />
										  <br />";
								}
							}
					}

					// Recherche avec le numéro
					if ($annee == -1 AND $nom == -1 AND $num != "" AND $formation == -1)
					{
					//	mysql_select_db($database_connexion1, $connexion1);
					//	$sql = " SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'";
					//	$result = mysql_query($sql) or die("Requete pas comprise");
						$result = $connexion->prepare(" SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'");
						$result->execute();

						if (mysql_num_rows($result) == 0)
						if ($result == null)
						{
							echo"<p>La recherche effectuée ne renvoie aucun résultat : le numéro est inconnu.<p>";
						}
						else
						{
						//	while($l=mysql_fetch_object($result))
							while ($l=$result->fetch())
							{
								$nomutili=$l['NomUtilisateur'];
								$numutili=$l['NumUtilisateur'];
								$photoutili=$l['photoUtilisateur'];
								$prenomutili=$l['PrenomUtilisateur'];
							}

							echo "<h2 style='text-align: center;'>Consultation de l'étudiant n° ".$num."</h2><br />" ;
							if ($photoutili == "")
							{
								echo "<p>L'étudiant ".$prenomutili." ".$nomutili." n'a pas encore de photo.</p>";
							}
							else
							{
								if ($photoutili == "photos/Inconnu.JPG")
								{
									echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
								}
								else
								{
									echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
								}
							}
							echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br/>" ;

						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql2 = " SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'";
						//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
							$result2 = $connexion->prepare(" SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'");
							$result2->execute();

							echo "<ul style='list-style: none; text-align: center;'>";
						//	while($l2=mysql_fetch_object($result2))
							while ($l2=$result2->fetch())
							{
								$id=$l2['idFormation'];
								$anneeTrombi=$l2['anneeInscrire'] + 1;

							//	mysql_select_db($database_connexion1, $connexion1);
							//	$sql3 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
							//			  From Trombinoscope,formation
							//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
							//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
							//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
								$result3 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
										  From Trombinoscope,formation
										  Where formation.idFormation=trombinoscope.IdFormationTrombi
										  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
								$result3->execute();


							//	while($l3=mysql_fetch_object($result3))
								while ($l3=$result3->fetch())
								{
									$idfor=$l3['IdFormationTrombi'];
								//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
								//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
									$result4 = $connexion->prepare( "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
									$result4->execute();

								//	while($l2=mysql_fetch_object($result4))
									while ($l2=$result4->fetch())
									{
									//	echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l3->AnneeTrombinoscope&promo=$l3->IdFormationTrombi' target=_blank>" .$l2->diminutifFormation_fr. " " .$l3->AnneeTrombinoscope. "</a>";
										echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
									}
								}
							}
							echo "</ul>";
						}
					}

					// Recherche avec la formation et le nom

					if ($annee == -1 AND $nom != -1 AND $num == "" AND $formation != -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur From Utilisateur Where NomUtilisateur='".$nom."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare( " SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur From Utilisateur Where NomUtilisateur='".$nom."'");
							$result->execute();
							//if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le nom est inconnu.</p>";
							}
							else
							{
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$nomutili=$l['NomUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$photoutili=$l['photoUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
								}

							//	$sql2 = " SELECT IdFormation From formation Where diminutifFormation_fr='".$formation."'";
							//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
								$result2 = $connexion->prepare( " SELECT IdFormation From formation Where diminutifFormation_fr='".$formation."'");
								$result2->execute();
							//	if (mysql_num_rows($result2) == 0)
								if ($result2 == null)
								{
									echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
								}
								else
								{
								//	while($l=mysql_fetch_object($result2))
									while ($l=$result2->fetch())
									{
										$idformation =$l['IdFormation'];
									}

								//	$sql3 = " SELECT idFormation, anneeInscrire From inscrire Where NumEtudiant='".$numutili."'";
								//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
									$result3 = $connexion->prepare( " SELECT idFormation, anneeInscrire From inscrire Where NumEtudiant='".$numutili."'");
									$result3->execute();
								//	if (mysql_num_rows($result3) == 0)
									if ($result3 == null)
									{
										echo "<p>La recherche effectuée ne renvoie aucun résultat : l'étudiant n'est pas référencé dans cette formation.</p>";
									}
									else
									{
										echo "<h2 style='text-align: center;'>Consultation de l'étudiant(e)</h2><br />" ;
										if ($photoutili == "")
										{
										echo "L'étudiant ".$prenomutili." ".$nomutili." n'a pas encore de photo";
										}
										else
										{
											if ($photoutili == "photos/Inconnu.JPG")
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
											else
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
										}
										echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />" ;

										echo "<ul style='list-style: none; text-align: center;'>";
									//	while($l2=mysql_fetch_object($result3))
										while ($l2=$result3->fetch())
										{
											$id=$l2['idFormation'];
											$anne=$l2['anneeInscrire'] + 1;

										//	mysql_select_db($database_connexion1, $connexion1);
										//	$sql4 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
										//			  From Trombinoscope,formation
										//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
										//			  and AnneeTrombinoscope='".$anne."' and IdFormationTrombi='".$id."'";
										//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
											$result4 = $connexion->prepare( " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
													  From Trombinoscope,formation
													  Where formation.idFormation=trombinoscope.IdFormationTrombi
													  and AnneeTrombinoscope='".$anne."' and IdFormationTrombi='".$id."'");
											$result4->execute();


										//	while($l3=mysql_fetch_object($result4))
											while ($l3=$result4->fetch())
											{
												$idfor=$l3['IdFormationTrombi'];
											//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
											//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
												$result4 = $connexion->prepare( "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
												$result4->execute();

											//	while($l2=mysql_fetch_object($result4))
												while ($l2=$result4->fetch())
												{
												//	echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l3->AnneeTrombinoscope&promo=$l3->IdFormationTrombi' target=_blank>" .$l2->diminutifFormation_fr. " " .$l3->AnneeTrombinoscope. "</a>";
													echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
												}
											}
										}
										echo "</ul>
											  <br />
											  <hr />
											  <br />
											  <br />
											  <br />";
									}
								}
							}
					}


					// Recherche avec la formation et le num

					if ($annee == -1 AND $nom == -1 AND $num != "" AND $formation != -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT photoUtilisateur, NomUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare( " SELECT photoUtilisateur, NomUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'");
							$result->execute();
						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le numéro est inconnu.</p>";
							}
							else
							{
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$photoutili=$l['photoUtilisateur'];
									$nomutili=$l['NomUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
								}

							//	$sql2 = " SELECT IdFormation From formation Where diminutifFormation_fr='".$formation."'";
							//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
								$result2 = $connexion->prepare( " SELECT IdFormation From formation Where diminutifFormation_fr='".$formation."'");
								$result2->execute();
							//	if (mysql_num_rows($result2) == 0)
								if ($result2 == null)
								{
									echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
								}
								else
								{
								//	while($l=mysql_fetch_object($result2))
									while ($l=$result2->fetch())
									{
										$idformation =$l['IdFormation'];
									}

								//	$sql3 = " SELECT anneeInscrire From inscrire Where NumEtudiant='".$num."' and idFormation='".$idformation."'";
								//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
									$result3 = $connexion->prepare(" SELECT anneeInscrire From inscrire Where NumEtudiant='".$num."' and idFormation='".$idformation."'");
									$result3->execute();
								//	if (mysql_num_rows($result3) == 0)
									if ($result3 == null)
									{
										echo"<p>La recherche effectuée ne renvoie aucun résultat : l'étudiant n'est pas référencé dans cette formation.</p>";
									}
									else
									{

										echo "<h2 style='text-align: center;'>Consultation de l'étudiant n° ".$num."</h2><br />" ;
										if ($photoutili == "")
										{
											echo "<p>L'étudiant ".$prenom." ".$nomutili." n'a pas encore de photo. </p>";
										}
										else
										{
											if ($photoutili == "photos/Inconnu.JPG")
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
											else
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
										}
										echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />" ;

									//	mysql_select_db($database_connexion1, $connexion1);
									//	$sql2 = " SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'";
									//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
										$result2 = $connexion->prepare(" SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'");
										$result2->execute();

										echo "<ul style='list-style: none; text-align: center;'>";
									//	while($l2=mysql_fetch_object($result2))
										while ($l2=$result2->fetch())
										{
											$id=$l2['idFormation'];
											$anneeTrombi=$l2['anneeInscrire'] + 1;

										//	mysql_select_db($database_connexion1, $connexion1);
										//	$sql3 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
										//			  From Trombinoscope,formation
										//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
										//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
										//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
											$result3 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
													  From Trombinoscope,formation
													  Where formation.idFormation=trombinoscope.IdFormationTrombi
													  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
											$result3->execute();


										//	while($l3=mysql_fetch_object($result3))
											while ($l3=$result3->fetch())
											{
												$idfor=$l3['IdFormationTrombi'];
											//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
											//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
												$result4 = $connexion->prepare("SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
												$result4->execute();

											//	while($l2=mysql_fetch_object($result4))
												while ($l2=$result4->fetch())
												{
													echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
												}
											}
										}
										echo "</ul>";
									}
								}
							}
					}


					// Recherche avec l'annee et le nom

					if ($annee != -1 AND $nom != -1 AND $num == "" AND $formation == -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur From Utilisateur Where NomUtilisateur='".$nom."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT NomUtilisateur, NumUtilisateur, photoUtilisateur, PrenomUtilisateur From Utilisateur Where NomUtilisateur='".$nom."'");
							$result->execute();
						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le nom est inconnu.</p>";
							}
							else
							{
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$nomutili=$l['NomUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$photoutili=$l['photoUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
								}

							//	$sql3 = " SELECT IdFormation, anneeInscrire From inscrire Where NumEtudiant='".$numutili."'";
							//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
								$result3 = $connexion->prepare( " SELECT IdFormation, anneeInscrire From inscrire Where NumEtudiant='".$numutili."'");
								$result3->execute();
							//	if (mysql_num_rows($result3) == 0)
								if ($result3 == null)
								{
									echo"La recherche effectuée ne renvoie aucun résultat : l'étudiant n'est inscrit à aucune des formations du DIS pour l'année saisie.";
								}
								else
								{
									echo "<h2 style='text-align: center;'>Consultation de l'étudiant(e)</h2><br />" ;
									if ($photoutili == "")
									{
										echo "<p>L'étudiant ".$prenomutili." ".$nomutili." n'a pas encore de photo.</p>";
									}
									else
									{
										if ($photoutili == "photos/Inconnu.JPG")
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
											else
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
									}
									echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />" ;

									echo "<ul style='list-style: none; text-align: center;'>";
								//	while($l2=mysql_fetch_object($result3))
									while ($l2=$result3->fetch())
									{
										$id=$l2['IdFormation'];
										$anneeTrombi=$l2['anneeInscrire'] + 1;

									//	mysql_select_db($database_connexion1, $connexion1);
									//	$sql4 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
									//			  From Trombinoscope,formation
									//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
									//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
									//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
										$result4 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
												  From Trombinoscope,formation
												  Where formation.idFormation=trombinoscope.IdFormationTrombi
												  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
										$result4->execute();

									//	while($l3=mysql_fetch_object($result4))
										while ($l3=$result4->fetch())
										{
											$idfor=$l3['IdFormationTrombi'];
										//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
										//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
											$result4 = $connexion->prepare("SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
											$result4->execute();

										//	while($l2=mysql_fetch_object($result4))
											while ($l2=$result4->fetch())
											{
												echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
											}
										}
									}
									echo "</ul>
										  <br />
										  <hr />
										  <br />
										  <br />
										  <br />";
								}
							}
					}

					// Recherche avec l'annee et le num

					if ($annee != -1 AND $nom == -1 AND $num != "" AND $formation == -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT photoUtilisateur, NomUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT photoUtilisateur, NomUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'");
							$result->execute();
						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le numéro est inconnu.</p>";
							}
							else
							{
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$photoutili=$l['photoUtilisateur'];
									$nomutili=$l['NomUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
								}

							//	$sql3 = " SELECT IdFormation From inscrire Where anneeInscrire='".($annee - 1)."' and NumEtudiant='".$num."'";
							//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
								$result3 = $connexion->prepare(" SELECT IdFormation From inscrire Where anneeInscrire='".($annee - 1)."' and NumEtudiant='".$num."'");
								$result3->execute();
							//	if (mysql_num_rows($result3) == 0)
								if ($result3 == null)
								{
									echo"<p>La recherche effectuée ne renvoie aucun résultat : l'étudiant n'appartient à aucune des promotions du DIS pour l'année saisie.</p>";
								}
								else
								{
									echo "<h2 style='text-align: center;'>Consultation de l'étudiant n° ".$num."</h2><br />" ;
									if ($photoutili == "")
									{
										echo "<p>L'étudiant ".$prenom." ".$nomutili." n'a pas encore de photo.</p>";
									}
									else
									{
										if ($photoutili == "photos/Inconnu.JPG")
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
											else
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
									}
									echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />" ;

								//	mysql_select_db($database_connexion1, $connexion1);
								//	$sql2 = " SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'";
								//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
									$result2 = $connexion->prepare(" SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'");
									$result2->execute();

									echo "<ul style='list-style: none; text-align: center;'>";
								//	while($l2=mysql_fetch_object($result2))
									while ($l2=$result2->fetch())
									{
										$id=$l2['idFormation'];
										$anneeTrombi=$l2['anneeInscrire'] + 1;

									//	mysql_select_db($database_connexion1, $connexion1);
									//	$sql3 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
									//			  From Trombinoscope,formation
									//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
									//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
									//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
										$result3 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
												  From Trombinoscope,formation
												  Where formation.idFormation=trombinoscope.IdFormationTrombi
												  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
										$result3->execute();


									//	while($l3=mysql_fetch_object($result3))
										while ($l3=$result3->fetch())
										{
											$idfor=$l3['IdFormationTrombi'];
										//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
										//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
											$result4 = $connexion->prepare("SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
											$result4->execute();

										//	while($l2=mysql_fetch_object($result4))
											while ($l2=$result4->fetch())
											{
												echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
											}
										}
									}
									echo "</ul>";
								}
							}
					}

					// Recherche avec l'annee, la formation et le num

					if ($annee != -1 AND $nom == -1 AND $num != "" AND $formation != -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT photoUtilisateur, NomUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT photoUtilisateur, NomUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NumUtilisateur='".$num."'");
							$result->execute();
						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le numéro est inconnu.</p>";
							}
							else
							{
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$photoutili=$l['photoUtilisateur'];
									$nomutili=$l['NomUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
								}

							//	$sql3 = " SELECT IdFormation From formation Where  diminutifFormation_fr ='".$formation."'";
							//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
								$result3 = $connexion->prepare(" SELECT IdFormation From formation Where  diminutifFormation_fr ='".$formation."'");
								$result3->execute();

							//	while($l=mysql_fetch_object($result3))
								while ($l=$result3->fetch())
								{
									$id =$l['IdFormation'];
								}

							//	$sql2 = " SELECT * From inscrire Where NumEtudiant = '".$num."' AND anneeInscrire ='".($annee - 1)."' AND IdFormation ='".$id."'";
							//	$result2 = mysql_query($sql2);
								$result2 = $connexion->prepare(" SELECT * From inscrire Where NumEtudiant = '".$num."' AND anneeInscrire ='".($annee - 1)."' AND IdFormation ='".$id."'");
								$result2->execute();
							//	if (mysql_num_rows($result2) == 0)
								if ($result2 == null)
								{
									echo"<p>La recherche effectuée ne renvoie aucun résultat : l'étudiant n'est pas inscrit pour la formation saisie et l'année saisie.</p>";
								}
								else
								{
									echo "<h2 style='text-align: center;'>Consultation de l'étudiant n° ".$num."</h2><br />" ;
									if ($photoutili == "")
									{
										echo "<p>L'étudiant ".$prenom." ".$nomutili." n'a pas encore de photo.</p>";
									}
									else
									{
										if ($photoutili == "photos/Inconnu.JPG")
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
											else
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
									}
									echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />" ;

								//	mysql_select_db($database_connexion1, $connexion1);
								//	$sql2 = " SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'";
								//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
									$result2 = $connexion->prepare(" SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$num."'");
									$result2->execute();

									echo "<ul style='list-style: none; text-align: center;'>";
								//	while($l2=mysql_fetch_object($result2))
									while ($l2=$result2->fetch())
									{
										$id=$l2['idFormation'];
										$anneeTrombi=$l2['anneeInscrire'] + 1;

									//	mysql_select_db($database_connexion1, $connexion1);
									//	$sql3 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
									//			  From Trombinoscope,formation
									//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
									//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
									//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
										$result3 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
												  From Trombinoscope,formation
												  Where formation.idFormation=trombinoscope.IdFormationTrombi
												  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
										$result3->execute();


									//	while($l3=mysql_fetch_object($result3))
										while ($l3=$result3->fetch())
										{
											$idfor=$l3['IdFormationTrombi'];
										//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
										//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
											$result4 = $connexion->prepare("SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
											$result4->execute();

										//	while($l2=mysql_fetch_object($result4))
											while ($l2=$result4->fetch())
											{
												echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
											}
										}
									}
									echo "</ul>";
								}
							}
					}

					// Recherche avec l'annee, la formation et le nom

					if ($annee != -1 AND $nom != -1 AND $num == "" AND $formation != -1)
					{
						//	mysql_select_db($database_connexion1, $connexion1);
						//	$sql = " SELECT NomUtilisateur, photoUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NomUtilisateur='".$nom."'";
						//	$result = mysql_query($sql) or die("Requete pas comprise");
							$result = $connexion->prepare(" SELECT NomUtilisateur, photoUtilisateur, NumUtilisateur, PrenomUtilisateur From Utilisateur Where NomUtilisateur='".$nom."'");
							$result->execute();
						//	if (mysql_num_rows($result) == 0)
							if ($result == null)
							{
								echo"<p>La recherche effectuée ne renvoie aucun résultat : le nom est inconnu.</p>";
							}
							else
							{
							//	while($l=mysql_fetch_object($result))
								while ($l=$result->fetch())
								{
									$nomutili=$l['NomUtilisateur'];
									$photoutili=$l['photoUtilisateur'];
									$numutili=$l['NumUtilisateur'];
									$prenomutili=$l['PrenomUtilisateur'];
								}

							//	$sql3 = " SELECT IdFormation From formation Where  diminutifFormation_fr ='".$formation."'";
							//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
								$result3 = $connexion->prepare(" SELECT IdFormation From formation Where  diminutifFormation_fr ='".$formation."'");
								$result3->execute();
							//	if (mysql_num_rows($result3) == 0)
								if ($result3 == null)
								{
									echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
								}
								else
								{
								//	while($l=mysql_fetch_object($result3))
									while ($l=$result3->fetch())
									{
										$id =$l['IdFormation'];
									}

								//	$sql2 = " SELECT * From inscrire Where NumEtudiant = '".$numutili."' AND anneeInscrire ='".($annee - 1)."' AND IdFormation ='".$id."'";
								//	$result2 = mysql_query($sql2);
									$result2 = $connexion->prepare(" SELECT * From inscrire Where NumEtudiant = '".$numutili."' AND anneeInscrire ='".($annee - 1)."' AND IdFormation ='".$id."'");
									$result2->execute();
								//	if (mysql_num_rows($result2) == 0)
									if ($result2 == null)
									{
										echo"<p>La recherche effectuée ne renvoie aucun résultat : l'étudiant n'est pas inscrit pour la formation saisie et l'année saisie.</p>";
									}
									else
									{
										echo "<h2 style='text-align: center;'>Consultation de l'étudiant</h2><br />" ;
										if ($photoutili == "") {
										echo "<p>L'étudiant ".$prenom." ".$nomutili." n'a pas encore de photo.</p>";
										}
										else
										{
											if ($photoutili == "photos/Inconnu.JPG")
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
											else
											{
												echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$numutili' target=_blank><img src='".$photoutili."' width='120' height='130'></> </a> <br /><br /> <strong>" . $prenomutili . " " . $nomutili . "</strong></p>";
											}
										}
										echo "<br /><br /><h2 style='text-align: center;'>Promotions</h2><br />" ;

									//	mysql_select_db($database_connexion1, $connexion1);
									//	$sql2 = " SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$numutili."'";
									//	$result2 = mysql_query($sql2) or die("Requete pas comprise");
										$result2 = $connexion->prepare(" SELECT idFormation, anneeInscrire From Inscrire Where NumEtudiant='".$numutili."'");
										$result2->execute();

										echo "<ul style='list-style: none; text-align: center;'>";
									//	while($l2=mysql_fetch_object($result2))
										while ($l2=$result2->fetch())
										{
											$id=$l2['idFormation'];
											$anneeTrombi=$l2['anneeInscrire'] + 1;

										//	mysql_select_db($database_connexion1, $connexion1);
										//	$sql3 = " SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
										//			  From Trombinoscope,formation
										//			  Where formation.idFormation=trombinoscope.IdFormationTrombi
										//			  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'";
										//	$result3 = mysql_query($sql3) or die("Requete pas comprise");
											$result3 = $connexion->prepare(" SELECT PhotoTrombinoscope, AnneeTrombinoscope, IdFormationTrombi,diminutifFormation_fr
													  From Trombinoscope,formation
													  Where formation.idFormation=trombinoscope.IdFormationTrombi
													  and AnneeTrombinoscope='".$anneeTrombi."' and IdFormationTrombi='".$id."'");
											$result3->execute();


										//	while($l3=mysql_fetch_object($result3))
											while ($l3=$result3->fetch())
											{
												$idfor=$l3['IdFormationTrombi'];
											//	$sql4 = "SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'";
											//	$result4 = mysql_query($sql4) or die("Requete pas comprise");
												$result4 = $connexion->prepare("SELECT diminutifFormation_fr from formation where IdFormation ='".$idfor."'");
												$result4->execute();

											//	while($l2=mysql_fetch_object($result4))
												while ($l2=$result4->fetch())
												{
													echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l3['AnneeTrombinoscope']."&promo=".$l3['IdFormationTrombi']."' target=_blank>" .$l2['diminutifFormation_fr']. " " .$l3['AnneeTrombinoscope']. "</a>";
												}
											}
										}
										echo "</ul>
											  <br />
											  <hr />
											  <br />
											  <br />
											  <br />";
									}
								}
							}
					}

	}
	else
	{
		//Affichage de l'ensemble des étudiants lorsque l'utilisateur arrive sur la page de recherche des étudiants
	//	mysql_select_db($database_connexion1, $connexion1);
	//	$sql = " SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
	//			 FROM utilisateur, formation, inscrire
	//			 WHERE formation.IdFormation = inscrire.IdFormation
	//			 AND inscrire.NumEtudiant = utilisateur.NumUtilisateur";
	//	$result = mysql_query($sql) or die("Requete pas comprise");
		$result = $connexion->prepare(" SELECT DISTINCT utilisateur.NumUtilisateur, utilisateur.photoUtilisateur, utilisateur.NomUtilisateur, utilisateur.PrenomUtilisateur, inscrire.anneeInscrire
				 FROM utilisateur, formation, inscrire
				 WHERE formation.IdFormation = inscrire.IdFormation
				 AND inscrire.NumEtudiant = utilisateur.NumUtilisateur");
		$result->execute();

	//	if (mysql_num_rows($result) == 0)
		if ($result == null)
		{
			echo"<p>La recherche effectuée ne renvoie aucun résultat.<p>";
		}
		else
		{
			$compteur_c = 0;
			echo "<h2 style='text-align: center;'>étudiants du DIS</strong></h2><br>" ;
			echo "<table width='100%' cellpadding=20 style='border: 0px;'><tr>";
		//	while($l=mysql_fetch_object($result))
			while ($l=$result->fetch())
			{
				$compteur_c = $compteur_c + 1 ;
				echo"<td>";
				if ($l['photoUtilisateur'] == "photos/Inconnu.jpg")
				{
					echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
				}
				else
				{
				//	echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=$l->NumUtilisateur' target=_blank> <img src='" . $l->photoUtilisateur . "' width='120' height='130'></></a><br /><br /><strong>" . $l->PrenomUtilisateur . " " . $l->NomUtilisateur . "</strong></p>";
					echo "<p style='text-align: center'><a href='detail_resultat_recherche_etudiant.php?num=".$l['NumUtilisateur']."' target=_blank> <img src='" . $l['photoUtilisateur'] . "' width='120' height='130'></></a><br /><br /><strong>" . $l['PrenomUtilisateur'] . " " . $l['NomUtilisateur'] . "</strong></p>";
				}
				echo"</td>";
				if ($compteur_c == 3)
				{									// si on en est à la 4ème photo, on créé une nouvelle ligne
					echo "</tr><tr>" ;
					$compteur_c = 0 ;
				}
			}
			echo "</table>";
		}
	}

?>
