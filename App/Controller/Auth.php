<?php

namespace App\Controller;

class Auth{

  public static function Login($account, $password){
    $user = new \App\Model\User();
    $id = $user->GetID($account);
    if($id!=0){
      $match = $user->MatchPassword($id, $password);
      if($match){
        $_SESSION['user'] = $user;
        header('Location: index.php?login=success');
      }
      else{
        header('Location: index.php?login=error');
      }
    }
    else{
      header('Location: index.php?login=error');
    }
  }

  public static function PasswordForgot($account){
    $reset = false;
    $user = new \App\Model\User();
    $id = $user->GetID($account);
    if($id!=0){
      $newPassword = "admin";
      $email = \App\Model\Master::sendMail($user->GetMail($id), 'Intranet DIS - Nouveau mot de passe', 'Votre nouveau mot de passe : '.$newPassword);
      //if($email) {
      if(1==1) {
        $reset = $user->UpdatePassword($id, $newPassword);
      }
    }
    unset($user);
    return $reset;
  }

  public static function Logout(){
    unset($_SESSION['user']);
    session_destroy();
    header('Location: index.php?logout=success');
  }

}

?>
