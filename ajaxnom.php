<?php require_once('connexion1.php');
  // on verifie qu'on est bien connecté
  if (!isset($_SESSION)) {
    session_start();
  }

	if ((!isset($_POST["Selannee"])) AND (!isset($_POST["Selformation"]))) {
		header('Location: recherche_promotion.php');
	}

	if (isset($_POST["Selannee"]))
	{
	$choixA = $_POST["Selannee"] ;
	}

	if (isset($_POST["Selformation"]))
	{
	$choixB= $_POST["Selformation"];
	}

	if ($choixB != -1) {
		echo"<label> ".$choixB." </label> ";
	}
	if ($choixA != -1) {
		echo"<label> ".$choixA." </label> ";
	}


	echo "<select name='nom' id='nom'>";
	echo "<option value='-1' selected>Tous</option><br />";


	/* recherche par annee/formation*/
	if (($choixA!=-1)&&($choixB!=-1))  {
			include("connexion1.php");
			mysql_select_db($database_connexion1, $connexion1);

			$sqlt = "SELECT DISTINCT (utilisateur.NomUtilisateur) as nomutil
				FROM utilisateur, inscrire, formation
				WHERE utilisateur.NumUtilisateur=inscrire.NumEtudiant
				AND inscrire.idFormation = formation.idFormation
				AND utilisateur.idRole ='5'
				AND formation.diminutifFormation_fr = '".$choixB."'
				AND inscrire.anneeInscrire='".($choixA - 1)."'
				ORDER BY utilisateur.NomUtilisateur" ;
			$res = mysql_query($sqlt) or die("Requete pas comprise");

		}


	/*recherche par annee*/
	if(($choixA!=-1)&&($choixB==-1)){
			include("connexion1.php");
			mysql_select_db($database_connexion1, $connexion1);

			$sqlt = "SELECT DISTINCT (utilisateur.NomUtilisateur) as nomutil
				FROM utilisateur, trombinoscope, inscrire
				WHERE utilisateur.NumUtilisateur=inscrire.NumEtudiant
				AND trombinoscope.IdFormationTrombi=inscrire.IdFormation
				AND utilisateur.idRole ='5'
				AND inscrire.anneeInscrire='".($choixA -1)."'
				ORDER BY utilisateur.NomUtilisateur" ;
			$res = mysql_query($sqlt) or die("Requete pas comprise");

		}

	/*recherche par formation*/
	if(($choixB!=-1)&&($choixA==-1)){
			include("connexion1.php");
			mysql_select_db($database_connexion1, $connexion1);

			$sqlt = "SELECT DISTINCT (utilisateur.NomUtilisateur) as nomutil
				FROM utilisateur, trombinoscope, inscrire, formation
				WHERE utilisateur.NumUtilisateur=inscrire.NumEtudiant
				AND trombinoscope.IdFormationTrombi=inscrire.IdFormation
				AND inscrire.idFormation = formation.idFormation
				AND utilisateur.idRole ='5'
				AND formation.diminutifFormation_fr = '".$choixB."'
				ORDER BY utilisateur.NomUtilisateur" ;
			$res = mysql_query($sqlt) or die("Requete pas comprise");
		}

	while ($row=mysql_fetch_array($res))
						{
						echo"<option>".($row[0])."</option>";
						}

		/*while($row = mysql_fetch_assoc($res)){
			echo"<option>".$row["nomutil"]."</option>";

	}*/

	echo "</select>";

	$num_rows = mysql_num_rows($res);
?>
