<?php

namespace App\Model;

class Reunions extends Master{

  public static function GetReunionsEnseignant($id_ens){
    $data = \DataBaseQuery::Get('
      SELECT *
      FROM missions
      INNER JOIN reunions
      ON reunions.id_mission=missions.id_mission
      WHERE missions.id_enseignant=$1
      ORDER BY date_reunion ASC
      ',
      $id_ens
    );
    parent::ArrayFormatter($data);
    if(!empty($data)){
      foreach($data as $key=>$row){
        $data[$key]['url'] = parent::encrypturl($row['id_reunion']);
      }
    }
    return $data;
  }

  public static function Delete($id){
    \DataBaseQuery::Set('DELETE FROM reunions2etudiants WHERE id_reunion = $1', $id);
    \DataBaseQuery::Set('DELETE FROM reunions WHERE id_reunion = $1', $id);
  }

  public static function GetInfo($id_reunion){
    $data = \DataBaseQuery::Get('
      SELECT *
      FROM reunions
      INNER JOIN missions
      ON reunions.id_mission=missions.id_mission
      WHERE reunions.id_reunion = $1',
      $id_reunion
    );
    if(!empty($data)){
      $data['teacher'] = \App\Model\Missions::GetTeacherOfMission($data['id_mission']);
      $data['students'] = \App\Model\Missions::GetStudentsOfMission($data['id_mission']);
      $data['students_reunion'] = \DataBaseQuery::Get('SELECT utilisateur.* FROM utilisateur INNER JOIN reunions2etudiants ON reunions2etudiants.id_etu = utilisateur.NumUtilisateur WHERE reunions2etudiants.id_reunion = $1', $id_reunion);
      parent::ArrayFormatter($data['students_reunion']);
      $data['url_edit'] = parent::encrypturl($id_reunion);
    }
    return $data;
  }

  public static function Edit($id_reunion, $date, $debut, $fin, $titre, $description, $id_doc=array()){

    \DataBaseQuery::Set('DELETE FROM reunions2etudiants WHERE id_reunion = $1', $id_reunion);

    if(!empty($id_doc)){
      foreach($id_doc as $k=>$v){
        \DataBaseQuery::Set('INSERT INTO reunions2etudiants (id_reunion, id_etu) VALUES ($1, $2)', $id_reunion, $v);
      }
    }

    return \DataBaseQuery::Set(
      'UPDATE reunions
      SET date_reunion = $2,
      heure_debut = $3,
      heure_fin = $4,
      objet_reunion = $5,
      reunion = $6
      WHERE id_reunion = $1
      ',
      $id_reunion,
      $date,
      $debut,
      $fin,
      $titre,
      $description
    );
  }

  public static function Add($date, $debut, $fin, $titre, $description, $mission, $ens, $doc=array()){
    $newid = \DataBaseQuery::Get('SELECT MAX(id_reunion) FROM reunions') + 1;
    $reunions = \DataBaseQuery::Set(
      'INSERT INTO reunions
      (id_reunion, date_reunion, heure_debut, heure_fin, objet_reunion, reunion, id_mission, id_enseignant)
      VALUES
      ($1 ,$2 ,$3, $4, $5, $6, $7, $8)
      ',
      $newid,
      $date,
      $debut,
      $fin,
      $titre,
      $description,
      $mission,
      $ens
    );

  if(!empty($doc) && $reunions){
    foreach($doc as $k=>$v){
      \DataBaseQuery::Set(
        'INSERT INTO reunions2etudiants (id_reunion, id_etu) VALUES ($1, $2)',
        $newid, $v
      );
    }
  }
  else{
    $newid = null;
  }
  return $newid;
  }

}

 ?>
