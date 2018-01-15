<?php
/*----------------------------- TRAITEMENT DE LA RECHERCHE DE PROMOTIONS ---------------------------------*/
	//include "includes/admin/connexion.php";
	//include "connexion1.php";
	include("../../includes/admin/connexion.php");

	//si les variables critères existent
	if (isset($_POST["debut_periode"]) && isset($_POST["fin_periode"]) && isset($_POST["formation"]))
	{
		//Récupération des critères de recherche
		$debut_periode = htmlspecialchars($_POST['debut_periode']);
		$fin_periode = htmlspecialchars($_POST['fin_periode']);
		$formation = htmlspecialchars($_POST['formation']);

				// Si tous les critères sont paramétrés sur leur valeur par défaut, on affiche tout
				if ($debut_periode == -1 && $fin_periode == -1 && $formation == -1)
				{
				//	mysql_select_db($database_connexion1, $connexion1);
				//	$sql = " SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation ORDER BY formation.diminutifFormation_fr ASC, AnneeTrombinoscope DESC";
				//	$result = mysql_query($sql) or die("Requete pas comprise");
					$result = $connexion->prepare("SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation ORDER BY formation.diminutifFormation_fr ASC, AnneeTrombinoscope DESC");
					$result->execute();
					//$result = $connexion->exccute("SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation ORDER BY formation.diminutifFormation_fr ASC, AnneeTrombinoscope DESC");
					if ($result == null)
					{
						echo" <p>La recherche effectuée ne renvoie aucun résultat.</p>";
					}
					else
					{
						echo "<h2 style='text-align: center;'>Promotions du DIS</h2><br />" ;
						echo "<ul style='list-style: none; text-align: center;'>";
						//while($l=mysql_fetch_array($result))
						while ($l=$result->fetch())
						{
						//	echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l->AnneeTrombinoscope&promo=$l->IdFormation' target=_blank>" . $l->diminutifFormation_fr . " " . $l->AnneeTrombinoscope . "</a>";
							echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l['AnneeTrombinoscope']."&promo=".$l['IdFormation']."' target=_blank>" . $l['diminutifFormation_fr'] . " " . $l['AnneeTrombinoscope'] . "</a>";
						}
						echo "</ul>";
					}	
				}


				// Cas où le début de la période est renseignée mais pas la fin, et vice-sersa, que la formation soit renseignée ou non
				if (($debut_periode != -1 AND $fin_periode == -1 AND $formation != -1) || ($debut_periode == -1 AND $fin_periode != -1 AND $formation != -1) || ($debut_periode != -1 AND $fin_periode == -1 AND $formation == -1) || ($debut_periode == -1 AND $fin_periode != -1 AND $formation == -1))
				{
					echo "<p>Vous devez renseigner le début et la fin de la période pour pouvoir effectuer votre recherche.</p>";
				}

				// Recherche avec la formation
				if ($debut_periode == -1 AND $fin_periode == -1 AND $formation != -1)
				{
					//	mysql_select_db($database_connexion1, $connexion1);
					//	$sql = " SELECT DISTINCT AnneeTrombinoscope, PhotoTrombinoscope, idFormationTrombi, IdFormation
					//	FROM trombinoscope
					//	INNER JOIN formation
					//	ON trombinoscope.IdFormationTrombi = formation.IdFormation
					//	WHERE formation.diminutifFormation_fr='" . $formation . "'";
					//	$result = mysql_query($sql) or die("Requete pas comprise");
						$result = $connexion->prepare(" SELECT DISTINCT AnneeTrombinoscope, PhotoTrombinoscope, idFormationTrombi, IdFormation
						FROM trombinoscope
						INNER JOIN formation
						ON trombinoscope.IdFormationTrombi = formation.IdFormation
						WHERE formation.diminutifFormation_fr='" . $formation . "'");
						$result->execute();
						if ($result == null)
						{
							echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
						}
						else
						{
							echo "<h2 style='text-align: center;'>Promotions de la formation " . $formation . "</h2><br />" ;
							echo "<ul style='list-style: none; text-align: center;'>";
							//while($l=mysql_fetch_object($result))
							while ($l=$result->fetch())
							{
							//	echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l->AnneeTrombinoscope&promo=$l->IdFormation' target=_blank>" . $formation . " " . $l->AnneeTrombinoscope . "</a>";
								echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l['AnneeTrombinoscope']."&promo=".$l['IdFormation']."' target=_blank>" . $formation . " " . $l['AnneeTrombinoscope'] . "</a>";
							}
							echo "</ul>";
						}
				}


				// Recherche avec la période
				if ($debut_periode != -1 AND $fin_periode != -1 AND $formation == -1)
				{
					//	mysql_select_db($database_connexion1, $connexion1);
					//	$sql = " SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation WHERE formation.IdFormation = trombinoscope.IdFormationTrombi AND AnneeTrombinoscope >='" . $debut_periode . "' AND AnneeTrombinoscope <='" . $fin_periode . "'";
					//	$result = mysql_query($sql) or die("Requete pas comprise");
						$result = $connexion->prepare(" SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation WHERE formation.IdFormation = trombinoscope.IdFormationTrombi AND AnneeTrombinoscope >='" . $debut_periode . "' AND AnneeTrombinoscope <='" . $fin_periode . "'");
						$result->execute();
						if ($result == null)
						{
							echo"<p>La recherche effectuée ne renvoie aucun résultat.</p>";
						}
						else
						{
							echo "<h2 style='text-align: center;'>Promotions du DIS sur la période " . $debut_periode . "-" . $fin_periode . "</h2><br />" ;
							echo "<ul style='list-style: none; text-align: center;'>";
							//while($l=mysql_fetch_object($result))
							while ($l=$result->fetch())
							{
								//echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l->AnneeTrombinoscope&promo=$l->IdFormation' target=_blank>" . $l->diminutifFormation_fr . " " . $l->AnneeTrombinoscope . "</a>";
								echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l['AnneeTrombinoscope']."&promo=".$l['IdFormation']."' target=_blank>" . $l['diminutifFormation_fr'] . " " . $l['AnneeTrombinoscope'] . "</a>";
							}
							echo "</ul>";
						}
				}


				// Recherche avec la période et la formation
				if ($debut_periode != -1 AND $fin_periode != -1 AND $formation != -1)
				{
					//	mysql_select_db($database_connexion1, $connexion1);
					//	$sql = " SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation WHERE formation.IdFormation = trombinoscope.IdFormationTrombi AND formation.diminutifFormation_fr ='". $formation ."' AND AnneeTrombinoscope >='" . $debut_periode . "' AND AnneeTrombinoscope <='" . $fin_periode . "'";
					//	$result = mysql_query($sql) or die("Requete pas comprise");
						$result = $connexion->prepare(" SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation WHERE formation.IdFormation = trombinoscope.IdFormationTrombi AND formation.diminutifFormation_fr ='". $formation ."' AND AnneeTrombinoscope >='" . $debut_periode . "' AND AnneeTrombinoscope <='" . $fin_periode . "'");
						$result->execute();
						if ($result == null)
						{
							echo"<p>La recherche effectuée ne renvoie aucun résultat : il n'y a pas de correspondance entre la formation et l'année.</p>";
						}
						else
						{
							$trouver = true ;
							$compteur_c = 0;
							echo "<h2 style='text-align: center;'>PROMOTIONS " . $formation . " de " . $debut_periode . " à " . $fin_periode . "</h2><br />" ;
							echo "<ul style='list-style: none; text-align: center;'>";
							//while($l=mysql_fetch_object($result))
							while ($l=$result->fetch())
							{
								echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l['AnneeTrombinoscope']."&promo=".$l['IdFormation']."' target=_blank>" . $l['diminutifFormation_fr'] . " " . $l['AnneeTrombinoscope'] . "</a>";
							}
							echo "</ul>";
						}
				}
	}
	else
	{
		//Affichage de l'ensemble des promotions du DIS, cela permet de tout afficher dès que l'utilisateur arrive sur la page de recherche
	//	mysql_select_db($database_connexion1, $connexion1);
	//	$sql = " SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation ORDER BY formation.diminutifFormation_fr ASC, AnneeTrombinoscope DESC";
	//	$result = mysql_query($sql) or die("Requete pas comprise");
		$result = $connexion->prepare(" SELECT DISTINCT AnneeTrombinoscope, formation.diminutifFormation_fr, IdFormation FROM trombinoscope, formation ORDER BY formation.diminutifFormation_fr ASC, AnneeTrombinoscope DESC");
		$result->execute();

		if ($result == null)
		{
			echo" <p>La recherche effectuée ne renvoie aucun résultat.</p>";
		}
		else
		{
			echo "<h2 style='text-align: center;'>Promotions du DIS</h2><br />" ;
			echo "<ul style='list-style: none; text-align: center;'>";
			//while($l=mysql_fetch_object($result))
			while ($l=$result->fetch())
			{
				//echo "<li><a href='detail_resultat_recherche_promotion.php?an=$l->AnneeTrombinoscope&promo=$l->IdFormation' target=_blank>" . $l->diminutifFormation_fr . " " . $l->AnneeTrombinoscope . "</a>";
				echo "<li><a href='detail_resultat_recherche_promotion.php?an=".$l['AnneeTrombinoscope']."&promo=".$l['IdFormation']."' target=_blank>" . $l['diminutifFormation_fr'] . " " . $l['AnneeTrombinoscope'] . "</a>";
			}
			echo "</ul>";
		}
	}

				?>
