<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        include ("connect_db.php");
        // put your code here
          $stmt ="SELECT distinct promotion FROM `etudiant`  order by promotion";
          $conn = new mysqli($host, $user, $password, $dbname);
          $promo = mysqli_query($conn,$stmt);
          $array = array();
          while($row=mysqli_fetch_assoc($promo)){
              $array[] = $row;
          }          
        ?>
    </body>
</html>
