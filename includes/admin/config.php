<?php
    
// Connexion à la base de donnée
    define("SERVER_DB","localhost");
    define("USER_DB","root");
    define("PASS_DB","root");
    define("DB","g3_bdetudiants");
    define("COD_DB",2);  // 1=PostgreSql  2=MySql   3=Oracle
    $configActive=1;
// Paths (ne pas modifier)
    //define("ROOT_PROJECT","intranet");
    define("ROOT_PROJECT","/Integration");
    define("ROOT_APPS", ROOT_PROJECT."/apps");
        
// Messages d'erreur (ne pas modifier)
    define('ERREUR_NEED_CO','Vous ne pouvez pas accéder à cette page si vous n\'êtes pas connecté.');  

?>
