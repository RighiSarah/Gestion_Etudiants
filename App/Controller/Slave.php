<?php

namespace App\Controller;

class Slave extends Worker{

  public static function Run($page){
    if(isset($_SESSION['user'])){
      if(method_exists('\App\Controller\Worker', $page)){
        echo parent::$page();
      }
      else{
        echo parent::error(404);
      }
    }
    else{
        switch($page){
            case "password_forgot":
                echo parent::password_forgot();
                break;
            default:
                echo parent::login();
                break;
        }

    }
  }

}
