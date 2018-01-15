<!doctype html>
<html>
	<head>
	<meta charset="utf-8">
	<link href="../css/css.css" rel="stylesheet">
	</head>
	<style>
	#sep-haut {
			margin-top: 50px;
	}


	#act {
			background: black;
	}

	#zone1_accueilsite h2 {
			padding: 5px;
	}

	#act li {
			background: black;
	}


	#menu-accordeon {
	padding:0;
	margin:0;
	list-style:none;
	width: 165px;
}
#menu-accordeon ul {
	padding:0;
	margin:0;
	list-style:none;
}
#menu-accordeon li {
	 background-color:#2C58A5;
	 border-radius: 5px;
	 margin-bottom:2px;
	 text-transform: uppercase;
	 position: relative;
}
#menu-accordeon li li {
	 max-height:0;
	 overflow: hidden;
	 transition: all .5s;
	 border-radius:0;
	 background: #444;
	 box-shadow: none;
	 border:none;
	 margin:0
}

#menu-accordeon li li li{
	 max-height:0;
	 overflow: hidden;
	 transition: all .5s;
	 border-radius:0;
	 background: #808080 ;
	 box-shadow: none;
	 border:none;
	 padding-left: 5px;
	 margin:0
}
#menu-accordeon a {
	display:block;
	text-decoration: none;
	color: #fff;
	padding: 1px 5px;
	font-family: verdana;
	font-size:1.2em
}
#menu-accordeon ul li a, #menu-accordeon li:hover li a {
	font-size:1em
}
#menu-accordeon li:hover {
	 background: #729EBF
}
#menu-accordeon li li:hover {
	 background: #999;
}
#menu-accordeon ul li:last-child {
	 border-radius: 0 0 6px 6px;
	 border:none;
}
#menu-accordeon li:hover li {
	max-height: 15em;
}</style>
<body>

	<div id="menu">
		<ul id="menu-accordeon">
			<li id="act"><a href="../index.php">Accueil</a>
			</li>
			<li><a href="../gestion_syllabus/diplome.php">Syllabus</a>
			</li>
			<li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=seance&action=index">Absence</a>
				<ul>
					<li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=seance&action=index" >Séances</a>
					 <ul>
						 <li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=seance&action=index" >   Consultation</a></li>
						 <li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=seance&action=ajouterSeance"><span>    Ajouter séance</a></li>
					 </ul>
				 </li>
					<li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=Etudiant&action=index" >Etudiants</a></li>
					<li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=GroupeTd&action=index" >Groupes</a>
					 <ul>
						 <li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=GroupeTd&action=index" > Consultation</a></li>
						 <li><a href="../gestion_absence/Gestion%20Des%20Absences/index.php?controller=GroupeTd&action=ajouterGroupe" >   Ajouter groupe</a></li>
					 </ul>
				 </li>
				</ul>
			</li>
			<li><a href="../gestion_competence">Competence</a>
			</li>
			<li><a href="../gestion_insertionpro">Insertion Pro</a>
				<ul>
					 <li><a href="../gestion_insertionpro/modAjouter.php">Ajouter un emploi</a></li>
					 <li><a href="../gestion_insertionpro/travailler.php">Résultat</a>
						 <ul>
							 <li><a href="../gestion_insertionpro/travailler.php" >   Consultation</a></li>
							 <li><a href="../gestion_insertionpro/statistiques.php" >statistiques</a></li>
						 </ul>
					 </li>
					 <li><a href="../gestion_insertionpro/moderation.php">Moderation</a></li>
				</ul>
			</li>
			<li><a href="../gestion_trombinoscope">Trombinoscope</a>
				<ul>
					 <li><a href="../gestion_trombinoscope/recherche_promotion.php">Recherche de promo</a></li>
					 <li><a href="../gestion_trombinoscope/recherche_etudiant.php">Recherche d'étudiants</a></li>
					 <li><a href="../gestion_trombinoscope/creation_promotion.php">Création d'une promo</a></li>
				</ul>
			</li>
			<li><a href="../gestion_candidature">Candidature</a>
				<ul>
					 <li><a href="../gestion_candidature/listeCandidature.php">liste de candidature</a></li>
					 <li><a href="../gestion_candidature/FormInscription.php">ajouter un candidat</a></li>
					 <li><a href="../gestion_candidature/ModifierCandidat.php">modifier un candidat</a></li>
					 <li><a href="../gestion_candidature/Recherche.php">rechercher</a></li>
				</ul>
			</li>
		</ul>
		<div class="separateur"></div>
	</div> <!-- #menu -->

</body>
</html>
