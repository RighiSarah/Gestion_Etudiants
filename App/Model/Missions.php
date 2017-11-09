<?php

namespace App\Model;

class Missions extends Master{

  public static function Count(){
    return \DataBaseQuery::Get('SELECT COUNT(*) FROM missions');
  }

  public static function GetMissionsByTeacherID($id){
    $data = \DataBaseQuery::Get('SELECT * FROM missions WHERE id_enseignant = $1', $id);
    parent::ArrayFormatter($data);
    foreach($data as $k=>$v){
      $data[$k]['url'] = parent::encrypturl($v['id_mission']);
      $data[$k]['students'] = self::GetStudentsOfMission($v['id_mission']);
    }
    return $data;
  }

  public static function GetMissionByStudentID($id){
    $sql = '
    SELECT *
    FROM missions
    WHERE id_mission IN (
      SELECT id_mission
      FROM missions2etudiants
      WHERE id_etu = $1
    )
    ';
    $data = \DataBaseQuery::Get($sql, $id);
    parent::ArrayFormatter($data);
    foreach($data as $k=>$v){
      $data[$k]['url'] = parent::encrypturl($v['id_mission']);
      $data[$k]['students'] = self::GetStudentsOfMission($v['id_mission']);
    }
    return $data;
  }

  public static function GetStudentsOfMission($id_mission){
    $sql = '
    SELECT *
    FROM utilisateur
    WHERE NumUtilisateur IN (
      SELECT id_etu
      FROM missions2etudiants
      WHERE id_mission = $1
    )
    ';
    $data = \DataBaseQuery::Get($sql, $id_mission);
    parent::ArrayFormatter($data);
    foreach($data as $k=>$v){
      $data[$k]['url'] = parent::encrypturl($v['NumUtilisateur']);
    }
    return $data;
  }

  public static function GetTeacherOfMission($id_mission){
    $sql = '
    SELECT utilisateur.*
    FROM utilisateur
    INNER JOIN missions
    ON missions.id_enseignant = utilisateur.NumUtilisateur
    WHERE missions.id_mission = $1
    ';
    return \DataBaseQuery::Get($sql, $id_mission);
  }

  public static function MissionsJoinDoctorants($id_ens){
    $data = \DataBaseQuery::Get('
    SELECT utilisateur.*, missions.*
    FROM utilisateur
    INNER JOIN missions2etudiants ON missions2etudiants.id_etu = utilisateur.NumUtilisateur
    INNER JOIN missions ON missions2etudiants.id_mission = missions.id_mission
    WHERE missions.id_enseignant = $1',$id_ens);
    \App\Model\Master::ArrayFormatter($data);
    return($data);
  }

  public static function InsertNewMission($id_mission){
    $sql = '
    SELECT *
    FROM utilisateur
    INNER JOIN missions
    ON missions.id_enseignant = utilisateur.NumUtilisateur
    WHERE missions.id_mission = $1
    ';
    return \DataBaseQuery::Get($sql, $id_mission);


  }


  public static function GetDetails($id_mission){
    $data = \DataBaseQuery::Get('
      SELECT *
      FROM missions
      WHERE missions.id_mission = $1',
      $id_mission
    );
    if(!empty($data)){
      $data['teacher'] = \App\Model\Missions::GetTeacherOfMission($data['id_mission']);
      $data['students'] = \App\Model\Missions::GetStudentsOfMission($data['id_mission']);
      $data['url'] = parent::encrypturl($id_mission);
    }
    return $data;
  }

  public static function Edit($id_mission, $objet, $debut, $fin, $description, $doc=array()){
    $mission = \DataBaseQuery::Set(
      'UPDATE missions
      SET objet_mission = $2,
      date_debut = $3,
      date_fin = $4,
      id_enseignant = $5,
      mission = $6
      WHERE id_mission = $1
      ',
      $id_mission,
      $objet,
      $debut,
      $fin,
      $_SESSION['user']->info()['NumUtilisateur'],
      $description
    );

    var_dump($mission);

    if($mission){
      \DataBaseQuery::Set('DELETE FROM missions2etudiants WHERE id_mission = $1', $id_mission);
      if(!empty($doc)){
        foreach($doc as $k=>$v){
          \DataBaseQuery::Set('INSERT INTO missions2etudiants (id_mission, id_etu) VALUES ($1, $2)', $id_mission, $v);
        }
      }
    }
  }

  public static function Add($id, $objet, $debut, $fin, $description, $doc=array()){
    $sql = "INSERT INTO missions (id_mission, objet_mission, date_debut, date_fin, id_enseignant, mission) VALUES ($1,$2,$3,$4,$5,$6)";
    $mission = \DataBaseQuery::Set($sql, $id, $objet, $debut, $fin, $_SESSION['user']->info()['NumUtilisateur'], $description);

    if($mission){
      if(!empty($doc)){
        foreach($doc as $k=>$v){
          \DataBaseQuery::Set('INSERT INTO missions2etudiants (id_mission, id_etu) VALUES ($1, $2)', $id, $v);
        }
      }
    }
  }

  public static function Delete($id){
    $sql = "DELETE FROM missions WHERE id_mission = $1; DELETE FROM missions2etudiants WHERE id_mission = $1";
    return \DataBaseQuery::Set($sql, $id);
  }

}

?>
