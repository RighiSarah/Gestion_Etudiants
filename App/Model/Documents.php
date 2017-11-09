<?php

namespace App\Model;

class Documents extends Master{

  public static function Count(){
    return \DataBaseQuery::Get('SELECT COUNT(*) FROM documents');
  }

  public static function GetAll(){
    $doc = \DataBaseQuery::Get('SELECT documents.*, documents2etudiants2missions.* FROM documents INNER JOIN documents2etudiants2missions ON documents2etudiants2missions.id_doc = documents.id_doc');
    parent::ArrayFormatter($doc);
    foreach($doc as $k=>$v){
      $doc[$k]['doctorant'] = \DataBaseQuery::Get('SELECT * FROM utilisateur WHERE NumUtilisateur = $1', $v['id_etu']);
      $doc[$k]['mission'] = \DataBaseQuery::Get('SELECT * FROM missions WHERE id_mission = $1', $v['id_mission']);
      $doc[$k]['url'] = parent::encrypturl($v['id_doc']);
      $doc[$k]['url_mission'] = parent::encrypturl($v['id_mission']);
      $doc[$k]['url_doctorant'] = parent::encrypturl($v['id_etu']);
    }
    return $doc;
  }

  public static function Get($id){
    $doc = \DataBaseQuery::Get('SELECT documents.*, documents2etudiants2missions.* FROM documents INNER JOIN documents2etudiants2missions ON documents2etudiants2missions.id_doc = documents.id_doc WHERE documents.id_doc = $1', $id);
    $doc['doctorant'] = \DataBaseQuery::Get('SELECT * FROM utilisateur WHERE NumUtilisateur = $1', $doc['id_etu']);
    $doc['mission'] = \DataBaseQuery::Get('SELECT * FROM missions WHERE id_mission = $1', $doc['id_mission']);
    $doc['url'] = parent::encrypturl($doc['id_doc']);
    $doc['url_mission'] = parent::encrypturl($doc['id_mission']);
    $doc['url_doctorant'] = parent::encrypturl($doc['id_etu']);
    return $doc;
  }

  public static function Add($titre, $type, $description, $motscles, $langue, $date_pub, $date_envoi, $mission_doctorants, $zip){
    $id = \DataBaseQuery::Get("SELECT MAX(id_doc)+1 FROM documents");
    $sql = 'INSERT INTO documents (id_doc, titre_doc, type_doc, description_doc, mots_cles_doc, langue_doc, date_publi_doc, date_envoi_doc, nom_fichier)
    VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)';

    $add = \DataBaseQuery::Set($sql, $id, $titre, $type, $description, $motscles, $langue, $date_pub, $date_envoi, $zip);

    if($add){
      $mission_doctorants = explode("~",$mission_doctorants);
      $mission = $mission_doctorants[0];
      $doctorant = $mission_doctorants[1];

      \DataBaseQuery::Set('INSERT INTO documents2etudiants2missions (id_doc, id_etu, id_mission) VALUES ($1,$2,$3)',$id, $doctorant, $mission);
    }
    return $id;
  }

  public static function Edit($id, $titre, $type, $description, $motscles, $langue, $date_pub, $date_envoi, $mission_doctorants){

    $sql = 'UPDATE documents SET titre_doc = $1,
    type_doc = $2,
    description_doc = $3,
    mots_cles_doc = $4,
    langue_doc = $5,
    date_publi_doc = $6,
    date_envoi_doc = $7
    WHERE id_doc = $8';

    $add = \DataBaseQuery::Set($sql, $titre, $type, $description, $motscles, $langue, $date_pub, $date_envoi, $id);

    if($add){
      $mission_doctorants = explode("~",$mission_doctorants);
      $mission = $mission_doctorants[0];
      $doctorant = $mission_doctorants[1];

      \DataBaseQuery::Set('DELETE FROM documents2etudiants2missions WHERE id_doc = $1', $id);

      \DataBaseQuery::Set('INSERT INTO documents2etudiants2missions (id_doc, id_etu, id_mission) VALUES ($1,$2,$3)',$id, $doctorant, $mission);
    }

  }

  public static function Delete($id_doc){

    $file = \DataBaseQuery::Get("SELECT nom_fichier FROM documents WHERE id_doc = $1",$id_doc);
    unlink(__PATH__.'/Content/documents/'.$file);

    $del = \DataBaseQuery::Set("DELETE FROM documents WHERE id_doc = $1",$id_doc);

    if($del){
      \DataBaseQuery::Set('DELETE FROM documents2etudiants2missions WHERE id_doc = $1', $id_doc);
    }

  }

}

?>
