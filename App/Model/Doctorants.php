<?php

namespace App\Model;

class Doctorants extends Master{

  public static function ListAll(){
    /*

    Méthode pour lister tout les Doctorants

    */

    return \DataBaseQuery::Get('SELECT * FROM utilisateur WHERE IdRole = 5');
  }

  public static function ListByMissions($id_enseignant){
    /*

    Méthode pour récuperer la liste des missions pour un enseignant donné

    */

    return \DataBaseQuery::Get('SELECT utilisateur.* , missions.*
                                FROM utilisateur, missions, missions2etudiants
                                WHERE utilisateur.IdRole = 5
                                AND utilisateur.NumUtilisateur = missions2etudiants.id_etu
                                AND missions.id_enseignant = $1
                                AND missions2etudiants.id_mission = missions.id_mission'
                                ,$id_enseignant
                              );
  }

  public static function GetInfo($id_doctorant){
    /*

    Méthode pour récuperer toutes les informations relatives à un doctorant

    */

    // Informations de base
    $infos = \DataBaseQuery::Get('SELECT * FROM utilisateur WHERE NumUtilisateur = $1', $id_doctorant);
    if(!empty($infos)){
      // Decodage des caractères spéciaux
      foreach($infos as $key=>$info){
        $infos[$key] = htmlspecialchars_decode($info);
      }

      // Formatage en français de la date de naissance
      if(isset($infos['DateNaissanceUtilisateur'])){
        $date = date('d m Y', strtotime($infos['DateNaissanceUtilisateur']));
        $month = \App\Model\Master::FrenchMonth($date{3}.$date{4});
        $infos['DateNaissanceUtilisateurFormat'] = $date{0}.$date{1}.' '.$month.' '.$date{6}.$date{7}.$date{8}.$date{9};
      }

      // Gestion de la photo de profil
      $imgpath = 'Content/img/';
      if(!empty($infos['photoUtilisateur']) && file_exists($imgpath.$infos['photoUtilisateur'])){
        // Si une photo a été uploadé on la charge
        $infos['photoUtilisateur'] = $imgpath.$infos['photoUtilisateur'];
      }
      else{
        // Sinon on charge l'image par défaut
        $infos['photoUtilisateur'] = $imgpath.'DefaultUser.png';
      }

      // Liste des missions du doctorants
      $infos['missions'] = \DataBaseQuery::Get('SELECT missions.* FROM missions, missions2etudiants WHERE missions2etudiants.id_mission AND missions2etudiants.id_etu = $1', $id_doctorant);
      \App\Model\Master::ArrayFormatter($infos['missions']);

      // Cursus du doctorants
      $infos['cursus'] = \DataBaseQuery::Get('SELECT * FROM `inscrire` INNER JOIN formation ON formation.idFormation = inscrire.idFormation WHERE inscrire.NumEtudiant = $1', $id_doctorant);

      $infos['url'] = parent::encrypturl($infos['NumUtilisateur']);
    }

    return $infos;
  }

  public static function Update($id,$prenom,$nom,$datenaiss,$rue,$cp,$ville,$pays,$nationalite,$photo){
    /*

    Méthode de mise à jour des informations de base d'un doctorant

    */

    // Si une photo est jointe
    if(isset($photo['name']) && !empty($photo['name'])){
      $extension = explode('.',$photo['name']);
      $extension = $extension[count($extension)-1];
      $filename = md5(uniqid()).'.'.$extension;
      // On l'upload
      $upload = parent::Upload($photo, $filename, __PATH__.'Content/img/');
      if(!$upload){
        $filename = null;
      }
      \DataBaseQuery::Set('
        UPDATE utilisateur
        SET PrenomUtilisateur = $2,
        NomUtilisateur = $3,
        DateNaissanceUtilisateur = $4,
        AdrRueUtilisateur = $5,
        AdrCPUtilisateur = $6,
        AdrVilleUtilisateur = $7,
        AdrPaysUtilisateur = $8,
        nationaliteUtilisateur = $9,
        photoUtilisateur = $10
        WHERE NumUtilisateur = $1
        ',
        $id,
        htmlspecialchars($prenom),
        htmlspecialchars($nom),
        $datenaiss,
        htmlspecialchars($rue),
        $cp,
        htmlspecialchars($ville),
        htmlspecialchars($pays),
        htmlspecialchars($nationalite),
        $filename
      );
    }
    // Sinon on execute une requete sans intégrer la photo
    else{
      \DataBaseQuery::Set('
        UPDATE utilisateur
        SET PrenomUtilisateur = $2,
        NomUtilisateur = $3,
        DateNaissanceUtilisateur = $4,
        AdrRueUtilisateur = $5,
        AdrCPUtilisateur = $6,
        AdrVilleUtilisateur = $7,
        AdrPaysUtilisateur = $8,
        nationaliteUtilisateur = $9
        WHERE NumUtilisateur = $1
        ',
        $id,
        htmlspecialchars($prenom),
        htmlspecialchars($nom),
        $datenaiss,
        htmlspecialchars($rue),
        $cp,
        htmlspecialchars($ville),
        htmlspecialchars($pays),
        htmlspecialchars($nationalite)
      );
    }
  }


  public static function Count(){
    return \DataBaseQuery::Get('SELECT COUNT(NumUtilisateur) FROM utilisateur WHERE IdRole = 5');
  }

  public static function Delete($id){
    // suppression de l'utilisateur
    $user = \DataBaseQuery::Set('DELETE FROM utilisateur WHERE NumUtilisateur = $1 AND IdRole = 5', $id);
    // si suppression ok on supprimer les entrées des autres tables;
    if($user){
      \DataBaseQuery::Set('DELETE FROM reunions2etudiants WHERE id_etu = $1', $id);
      \DataBaseQuery::Set('DELETE FROM missions2etudiants WHERE id_etu = $1', $id);
      \DataBaseQuery::Set('DELETE FROM documents2etudiants2missions WHERE id_etu = $1', $id);
      \DataBaseQuery::Set('DELETE FROM etudiant WHERE NumEtudiant = $1', $id);
    }
  }

}

?>
