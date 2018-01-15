<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
//ce sont les identifiants permettant la connexion avec PhpMyAdmin
$hostname_connexion1 = "localhost";
$database_connexion1 = "g3_bdetudiants";
$username_connexion1 = "root";
$password_connexion1 = "root";
$connexion1 = mysqli_connect($hostname_connexion1, $username_connexion1, $password_connexion1) or trigger_error(mysqli_error($connexion1),E_USER_ERROR); 
?>