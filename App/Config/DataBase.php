<?php

# DATABASE
if(PROD){
  # Configuration pour execution sur le Localhost de M. Boussaid
  $driver = 'mysql';
  $host = 'localhost';
  $port = 3306;
  $user = 'root';
  $password = '';
  $database = 'PROJET_ETUDIANTS';
}
else{
  # Configuration pour execution sur toutes les machines de développement
  $driver = 'mysql';
  $host = 'localhost';
  $port = null;
  $user = 'root';
  $password = '';
  $database = 'PROJET_ETUDIANTS';
}

try{
  $pdo = new PDO("$driver:host=$host;port=$port;dbname=$database", $user, $password);
}
catch(PDOException $e){
  die("DATABASE ERROR : ".$e->getMessage());
}

\DataBaseQuery::$PDO = $pdo;

?>
