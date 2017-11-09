<?php

namespace App\Controller;

class Worker extends Manager{

  protected static function login(){
    # Page de connexion

    if(isset($_POST['account']) && isset($_POST['password'])){
      # Si le formulaire est envoyé, on instancie la connexion
      Auth::Login($_POST['account'], $_POST['password']);
    }

    return parent::render('login', [
        'title' => 'Authentification',
        'logged' => isset($_SESSION['user'])
    ]);
  }

  protected static function logout(){
      # Page de déconnexion

      Auth::Logout();
  }

  protected static function password_forgot(){
    // PROCESS ENVOI MAIL A FAIRE
    return parent::render('password_forgot', [
        'title' => 'Mot de passe perdu',
        'logged' => isset($_SESSION['user'])
    ]);

  }

  protected static function home(){
    # Page d'accueil

    return parent::render('home', [
        'title' => 'Accueil',
        'logged' => isset($_SESSION['user']),
        'user' => $_SESSION['user']->info(),
        'rw' => $_SESSION['user']->HasRW()
    ]);
  }


  protected static function documents(){
    # Page d'accueil

    $detail = array();
    if(isset($_GET['doc'])){
      $detail = \App\Model\Documents::Get(\App\Model\Master::decrypturl($_GET['doc']));
    }

    $edit = false;
    if(isset($_GET['edit'])){
      $detail = \App\Model\Documents::Get(\App\Model\Master::decrypturl($_GET['edit']));
      $edit = true;
    }

    $add = false;
    if(isset($_GET['add'])){
      $detail = array(
        "date_envoi_doc" => date("Y-m-d"),
        'date_publi_doc' => date("Y-m-d"),
        'langue_doc' => "Français"
      );
      $add = true;
    }

    if(isset($_POST['add']) && isset($_FILES)){
      $zip = \App\Model\Master::UploadInZIP(__PATH__.'/Content/documents/',$_FILES);
      $nid = \App\Model\Documents::Add(
        $_POST['titre'],
        $_POST['type'],
        $_POST['description'],
        $_POST['motscles'],
        $_POST['langue'],
        $_POST['date_pub'],
        $_POST['date_envoi'],
        $_POST['mission-doctorant'],
        $zip
      );
      header('Location: documents.php?doc='.\App\Model\Master::encrypturl($nid));
    }

    if(isset($_POST['edit'])){
      \App\Model\Documents::Edit(
        $_POST['edit'],
        $_POST['titre'],
        $_POST['type'],
        $_POST['description'],
        $_POST['motscles'],
        $_POST['langue'],
        $_POST['date_pub'],
        $_POST['date_envoi'],
        $_POST['mission-doctorant']
      );
      header('Location: documents.php?doc='.\App\Model\Master::encrypturl($_POST['edit']));
    }

    if(isset($_POST['delete'])){
      \App\Model\Documents::Delete($_POST['delete']);
      header('Location: documents.php');
    }


    return parent::render('documents', [
        'documents' => \App\Model\Documents::GetAll(),
        'title' => 'Documents',
        'detail' => $detail,
        'edit' => $edit,
        'add' => $add,
        #'list_docs' => \App\Model\Doctorants::ListAll(),
        'list_docs' => \App\Model\Etudiants::ListAll(),
        'list_missions' => \App\Model\Missions::MissionsJoinDoctorants($_SESSION['user']->id),
        'logged' => isset($_SESSION['user']),
        'user' => $_SESSION['user']->info(),
        'rw' => $_SESSION['user']->HasRW()
    ]);
  }

  protected static function etudiants(){
    # MLA Page etudiants
    $info_etudiant = array();

    // Récupération de la liste des doctorants
    $liste_etudiants = \App\Model\Etudiants::ListAll();
    if(isset($_GET['filter']) && $_GET['filter']=='missions' && $_SESSION['user']->info()['idRole']==2){
      // Si un filtre a été choisi, on l'applique
      $liste_etudiants = \App\Model\Etudiants::ListByMissions($_SESSION['user']->id);
    }

    // Formatage du tableau pour eviter les erreurs de dimensions
    \App\Model\Master::ArrayFormatter($liste_etudiants);

    // MLA Si un etudiant a été choisi on envoi son id
    if(isset($_POST['id_etudiant'])){
      header('Location: etudiants.php?id='.\App\Model\Master::encrypturl($_POST['id_etudiant']));
    }

    // Si le bouton modification est activé et que l'user a les droits
    if(isset($_POST['update_NumUtilisateur']) && $_SESSION['user']->HasRW()){
      // Si le formulaire a été envoyé
      if(isset($_POST['NomUtilisateur'])){
        // On met à jour
        \App\Model\Etudiants::Update(
          $_POST['update_NumUtilisateur'],
          $_POST['PrenomUtilisateur'],
          $_POST['NomUtilisateur'],
          $_POST['DateNaissanceUtilisateur'],
          $_POST['AdrRueUtilisateur'],
          $_POST['AdrCPUtilisateur'],
          $_POST['AdrVilleUtilisateur'],
          $_POST['AdrPaysUtilisateur'],
          $_POST['nationaliteUtilisateur'],
          $_FILES['photo']
        );
        // on redirige vers la page de l'etudiant
        header('Location: etudiants.php?id='.\App\Model\Master::encrypturl($_POST['update_NumUtilisateur']));
      }
    }

    // Si le bouton suppression est activé et que l'user a les droits
    if(isset($_POST['delete_NumUtilisateur']) && $_SESSION['user']->HasRW()){
      \App\Model\Etudiants::Delete($_POST['delete_NumUtilisateur']);
      header('Location: etudiants.php');
    }

    // Si on récupère l'id d'un etudiant un affiche sa page
    if(isset($_GET['id'])){
      $id = \App\Model\Master::decrypturl($_GET['id']);
      $info_etudiant = \App\Model\Etudiants::GetInfo($id);
      if(empty($info_etudiant)){
        self::error(404);
      }
    }

    // On affiche la page etudiant.html avec les variables
    return parent::render('etudiants', [
      'title' => 'Etudiants',
      'logged' => isset($_SESSION['user']),
      'user' => $_SESSION['user']->info(),
      'role' => $_SESSION['user']->info()['idRole'],
      'rw' => $_SESSION['user']->HasRW(),
      'liste_etudiants' => $liste_etudiants,
      'info_etudiant' => $info_etudiant,
      'display_form_update' => isset($_POST['update_NumUtilisateur'])
    ]);
  }

  protected static function missions(){

    $userISteacher = false;
    $userISstudent = false;
    $missions = array();

    // Si l'utilisateur est un enseignant
    if($_SESSION['user']->info()['idRole']==2){
      $userISteacher = true;

      $missions = \App\Model\Missions::GetMissionsByTeacherID($_SESSION['user']->id);
      // S'il est rattaché à une et une seule mission, on le formatte
      if(!isset($missions[0]) && isset($missions['id_mission'])){
        $missions = [$missions];
      }

      if(!empty($missions)){
        foreach($missions as $key=>$mission){
          $doctorants = \App\Model\Missions::GetStudentsOfMission($mission['id_mission']);
          if(!isset($doctorants[0]) && isset($doctorants['NumUtilisateur'])){
            $doctorants = [$doctorants];
          }
          $missions[$key]['doctorants'] = $doctorants;
        }
      }

      $detail = array();
      if(isset($_GET['mission'])){
        $id = \App\Model\Master::decrypturl($_GET['mission']);
        $detail = \App\Model\Missions::GetDetails($id);
      }

      if(isset($_POST['delete'])){
        \App\Model\Missions::Delete($_POST['delete']);
        header('Location: missions.php');
      }

      $edit = false;
      if(isset($_GET['edit'])){
        $id = \App\Model\Master::decrypturl($_GET['edit']);
        $detail = \App\Model\Missions::GetDetails($id);
        $edit = true;
      }

      $add = false;
      if(isset($_GET['add'])){
        $add = true;
        $detail = ['full'];
      }

      if(isset($_POST['edit_mission'])){
        if(isset($_POST['id_doc'])){
          $doctorants_add_edit = $_POST['id_doc'];
        }
        else{
          $doctorants_add_edit = array();
        }
        \App\Model\Missions::Edit($_POST['edit_mission'], $_POST['objet'], $_POST['date_debut'], $_POST['date_fin'], $_POST['description'], $doctorants_add_edit);
        header('Location: missions.php?mission='.\App\Model\Master::encrypturl($_POST['edit_mission']));
      }

      if(isset($_POST['add_mission'])){
        if(isset($_POST['id_doc'])){
          $doctorants_add_edit = $_POST['id_doc'];
        }
        else{
          $doctorants_add_edit = array();
        }
        $id = \DataBaseQuery::Get('SELECT MAX(id_mission) FROM missions')+1;
        \App\Model\Missions::Add($id, $_POST['objet'], $_POST['date_debut'], $_POST['date_fin'], $_POST['description'], $doctorants_add_edit);
        header('Location: missions.php?mission='.\App\Model\Master::encrypturl($id));
      }

    }

    return parent::render('missions',[
      'title' => 'Missions',
      'logged' => isset($_SESSION['user']),
      'user' => $_SESSION['user']->info(),
      'rw' => $_SESSION['user']->HasRW(),
      'userISteacher' => $userISteacher,
      'missions' => $missions,
      'liste_doctorants'=> \DataBaseQuery::Get('SELECT * FROM utilisateur WHERE IdRole = 5'),
      'detail' => $detail,
      'edit' => $edit,
      'add' => $add
    ]);
  }

  protected static function reunions(){

    # Page réunions

    // Si le formulaire d'édition a été envoyé -> on modifie
    if(isset($_POST['edit_reunion'])){
      \App\Model\Reunions::Edit(
        $_POST['edit_reunion'],
        $_POST['date_reunion'],
        $_POST['heure_debut'],
        $_POST['heure_fin'],
        $_POST['titre'],
        $_POST['description'],
        $_POST['id_doc']
      );
      // On redirige vers la page de la réunion
      header('Location: reunions.php?reunion='.\App\Model\Master::encrypturl($_POST['edit_reunion']));
    }

    // Si le premier formulaire d'ajout est envoyé
    $add_reunion_choice_mission = null;
    if(isset($_POST['add_reunion_choice_mission'])){
      $add_reunion_choice_mission = $_POST['add_reunion_choice_mission'];
    }

    // Si l'url demande d'afficher le formulaire d'ajout et que l'utilisateur est un tuteur
    $list_missions = array();
    $liste_doctorants_mission = array();
    $form_add = 0;
    if(isset($_GET['add']) && $_SESSION['user']->info()['idRole']==2){
      $form_add = 1;
      $list_missions = \App\Model\Missions::GetMissionsByTeacherID($_SESSION['user']->id);
    }
    if(isset($_GET['add']) && !empty($add_reunion_choice_mission) && $_SESSION['user']->info()['idRole']==2){
      $form_add = 2;
      $liste_doctorants_mission = \App\Model\Missions::GetStudentsOfMission($add_reunion_choice_mission);
    }

    // si suppression
    if(isset($_POST['delete_id'])){
      \App\Model\Reunions::Delete($_POST['delete_id']);
      header('Location: reunions.php');
    }

    // Si le formulaire d'ajout d'une réunion a été envoyé
    $message_form = "";
    if(isset($_POST['add_reunion'])){
      $id = \App\Model\Reunions::Add(
        $_POST['date_reunion'],
        $_POST['heure_debut'],
        $_POST['heure_fin'],
        $_POST['titre'],
        $_POST['description'],
        $_POST['id_mission'],
        $_SESSION['user']->id,
        $_POST['id_doc']
      );
      $message_form = "Erreur : Impossible d'ajouter la réunion";
      if(!empty($id)) $message_form = "Réunion ajouté";
      unset($_GET);
      header('Location: reunions.php?reunion='.\App\Model\Master::encrypturl($id));
    }

    // Si l'url demande d'afficher les informations d'une réunion
    $info_reunion = array();
    if(isset($_GET['reunion'])){
      $id_reunion = \App\Model\Master::decrypturl($_GET['reunion']);
      $info_reunion = \App\Model\Reunions::GetInfo($id_reunion);
    }

    // Si l'url demande d'afficher le formulaire d'édition d'une réunion
    $edit_reunion = array();
    if(isset($_GET['edit'])){
      $id_reunion = \App\Model\Master::decrypturl($_GET['edit']);
      $edit_reunion = \App\Model\Reunions::GetInfo($id_reunion);
    }

    $reunions = \App\Model\Reunions::GetReunionsEnseignant($_SESSION['user']->id);

    return parent::render('reunions', [
      'title' => 'Réunions',
      'logged' => isset($_SESSION['user']),
      'user' => $_SESSION['user']->info(),
      'rw' => $_SESSION['user']->HasRW(),
      'reunions' => $reunions,
      'info_reunion' => $info_reunion,
      'edit_reunion' => $edit_reunion,
      'form_add' => $form_add,
      'list_missions' => $list_missions,
      'add_reunion_choice_mission' => $add_reunion_choice_mission,
      'liste_doctorants_mission' => $liste_doctorants_mission,
      'message_form' => $message_form
    ]);
  }

  protected static function settings(){
    # Page paramètres
    $form_error = null;
    if(isset($_POST['nom'])){
      $form_error = $_SESSION['user']->Update($_POST, $_FILES['photo']);
    }

    return parent::render('settings', [
      "form_error" => $form_error,
      'title' => 'Paramètres',
      'logged' => isset($_SESSION['user']),
      'user' => $_SESSION['user']->info(),
      'rw' => $_SESSION['user']->HasRW(),
      'CountDoctorants' => \App\Model\Doctorants::Count(),
      //'CountMissions' => \App\Model\Missions::Count(),
      'CountDocuments' => \App\Model\Documents::Count()
    ]);
  }

  protected static function agenda(){
    // Récuperation des variables passées, on donne soit année; mois; année+mois
    if(!isset($_GET['mois'])) $num_mois = date("n"); else $num_mois = $_GET['mois'];
    if(!isset($_GET['annee'])) $num_an = date("Y"); else $num_an = $_GET['annee'];

    // pour pas s'embeter a les calculer a l'affchage des fleches de navigation...
    if($num_mois < 1) { $num_mois = 12; $num_an = $num_an - 1; }
    elseif($num_mois > 12) {	$num_mois = 1; $num_an = $num_an + 1; }

    // nombre de jours dans le mois et numero du premier jour du mois
    $int_nbj = date("t", mktime(0,0,0,$num_mois,1,$num_an));
    $int_premj = date("w",mktime(0,0,0,$num_mois,1,$num_an));

    // tableau des jours, tableau des mois...
    $tab_jours = array("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche");
    $tab_mois = array("","Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Decembre");

    $int_nbjAV = date("t", mktime(0,0,0,($num_mois-1<1)?12:$num_mois-1,1,$num_an)); // nb de jours du moi d'avant
    $int_nbjAP = date("t", mktime(0,0,0,($num_mois+1>12)?1:$num_mois+1,1,$num_an)); // b de jours du mois d'apres

    // on affiche les jours du mois et aussi les jours du mois avant/apres, on les indique par une * a l'affichage on modifie l'apparence des chiffres *
    $tab_cal = array(array(),array(),array(),array(),array(),array()); // tab_cal[Semaine][Jour de la semaine]
    $int_premj = ($int_premj == 0)?7:$int_premj;
    $t = 1; $p = "";
    for($i=0;$i<6;$i++) {
    	for($j=0;$j<7;$j++) {
    		if($j+1 == $int_premj && $t == 1) { $tab_cal[$i][$j] = $t; $t++; } // on stocke le premier jour du mois
    		elseif($t > 1 && $t <= $int_nbj) { $tab_cal[$i][$j] = $p.$t; $t++; } // on incremente a chaque fois...
    		elseif($t > $int_nbj) { $p="*"; $tab_cal[$i][$j] = $p."1"; $t = 2; } // on a mis tout les numeros de ce mois, on commence a mettre ceux du suivant
    		elseif($t == 1) { $tab_cal[$i][$j] = "*".($int_nbjAV-($int_premj-($j+1))+1); } // on a pas encore mis les num du mois, on met ceux de celui d'avant
    	}
    }

    return parent::render('agenda', [
      'title' => 'Agenda',
      'logged' => isset($_SESSION['user']),
      'user' => $_SESSION['user']->info(),
      'rw' => $_SESSION['user']->HasRW(),
      "num_mois" => $num_mois,
      "num_an" => $num_an,
      "tab_jours" => $tab_jours,
      "tab_mois" => $tab_mois,
      "tab_cal" => $tab_cal,
      'reunions' => \App\Model\Reunions::GetReunionsEnseignant($_SESSION['user']->id)
    ]);
  }

  protected static function error($id){
    return parent::render('error', [
      'id' => $id,
      'title' => 'Erreur '.$id,
      'logged' => isset($_SESSION['user']),
      'user' => $_SESSION['user']->info(),
      'rw' => $_SESSION['user']->HasRW()
    ]);
  }

}
