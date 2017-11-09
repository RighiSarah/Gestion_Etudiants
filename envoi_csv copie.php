<?php 
$fichier=$_FILES['myFiles']['name'];
$uploaddir='Content/csv/';
$uploadfile=$uploaddir.basename($_FILES['myFiles']['name']);
move_uploaded_file($_FILES['myFiles']['tmp_name'], $uploadfile);
$ligne = 1; // compteur de ligne
$fic = fopen($uploadfile, "a+");
$servername="localhost:8889";
$username="mlatreche";
$password="MLAT74";
$dbname="PROJET_ETUDIANTS";
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
   while($tab=fgetcsv($fic,1024,';'))
{
	
$champs = count($tab);//nombre de champ dans la ligne en question	


echo "<b> Les " . $champs . " champs de la ligne " . $ligne . " sont :</b><br />";
$ligne ++;
//affichage de chaque champ de la ligne en question

for($i=0; $i<$champs; $i ++)
{
echo $tab[$i] . "<br />";

}

$Nom=$tab[0];
$Prenom=$tab[1];
$Email=$tab[2];
$conn->exec("INSERT INTO utilisateur (NomUtilisateur,PrenomUtilisateur,EmailUtilisateur,idRole) VALUES (".$conn->quote($Nom).",".$conn->quote($Prenom).",".$conn->quote($Email).",2)");
//$stmt->bindValue(":Nom", $Nom);
// $stmt->bindValue(":Prenom", $Prenom);
// $stmt->bindValue(":Email", $Email);
 // $stmt->execute();
    echo "Nouveau champ créé";
 
}
  
    }
catch(PDOException $e)
    {
    echo "<br>" . $e->getMessage();
    }


?>