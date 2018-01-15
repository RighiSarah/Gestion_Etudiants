<?php 

// Connexion à la base de donnée (ne pas modifier)
    try {
        $connexion = new PDO('mysql:host='.SERVER_DB.';dbname='.DB, USER_DB, PASS_DB, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8')); 
    } catch (PDOException $erreur) {
        // En cas d'echec lors de la tentative de connexion, un bandeau blanc affiche un message d'erreur en route
        echo "<div style=\" margin-bottom:10px;background-color:white; font-family: Arial,sans-serif; height:30px; line-height:30px; color: red; font-weight:bold; text-align:center;\">Serveur Indisponible</div>";
    }

?>