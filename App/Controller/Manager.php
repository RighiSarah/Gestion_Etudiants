<?php

namespace App\Controller;

class Manager{

  protected static function render($page, $var=array()){
    global $TWIG;

    $var["menu_droite"] = self::menu_droite();

    $render = $TWIG->render("$page.html", $var);
    return $render;
	}

  protected static function menu_droite(){
    // récupération du menu droite du site

      $file = @file_get_contents('http://dis.univ-lyon2.fr/');
      if(!empty($file)){
        $file = explode('<div class="encadre_fiche_contenu">',$file);
        $file = explode('</div>  <!-- .encadre_fiche_contenu -->',$file[1]);
        $file = $file[0];

        // formatage des urls
        $link = explode("<a",$file);
        foreach($link as $k=>$v){
          if(!strpos($v, 'href="http')){
            $link[$k] = str_replace('href="', 'href="http://dis.univ-lyon2.fr/',$v);
          }
        }
        $file = implode("<a",$link);
      }
      else{
        $file = "impossible de charger le menu";
      }

    return $file;
  }

}
