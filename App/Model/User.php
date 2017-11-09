<?php

namespace App\Model;

class User extends Master{

  public $account;
  public $id;

  public function Exist($account){
    return \DataBaseQuery::Get("SELECT COUNT(NumUtilisateur) FROM utilisateur WHERE LoginUtilisateur = $1", $account)!==0;
  }

  public function GetID($account){
    $id = 0;
    if(self::Exist($account)){
      $this->account = $account;
      $id = \DataBaseQuery::Get("SELECT NumUtilisateur FROM utilisateur WHERE LoginUtilisateur = $1", $account);
    }
    return $id;
  }

  public function MatchPassword($id, $password){
    $this->id = $id;
    $hash = \DataBaseQuery::Get("SELECT PassUtilisateur FROM utilisateur WHERE NumUtilisateur = $1", $id);
    # return $hash==md5($password);
    # Connexion ouverte
    return true;
  }

  public function Info(){
    $data = \DataBaseQuery::Get("SELECT * FROM utilisateur WHERE NumUtilisateur = $1", $this->id);
    foreach($data as $key=>$info){
      $data[$key] = htmlspecialchars_decode($info);
    }

    // Gestion de la photo de profil
    $imgpath = 'Content/img/';
    if(!empty($data['photoUtilisateur']) && file_exists($imgpath.$data['photoUtilisateur'])){
      // Si une photo a été uploadé on la charge
      $data['photoUtilisateur'] = $imgpath.$data['photoUtilisateur'];
    }
    else{
      // Sinon on charge l'image par défaut
      $data['photoUtilisateur'] = $imgpath.'DefaultUser.png';
    }

    $data['url'] = \App\Model\Master::encrypturl($data['NumUtilisateur']);

    return $data;
  }

  public function UpdatePassword($id, $pwd){
    return \DataBaseQuery::Set('UPDATE Utilisateur SET PassUtilisateur = $1 WHERE NumUtilisateur = $2', md5($pwd), $id);
  }

  public function GetMail($id){
    return \DataBaseQuery::Get('SELECT EmailUtilisateur FROM utilisateur WHERE NumUtilisateur = $1', $id);
  }

  public function HasRW(){
    return \DataBaseQuery::Get('SELECT COUNT(NumUtilisateur) FROM utilisateur WHERE (IdRole = 1 OR IdRole = 2) AND NumUtilisateur = $1', $this->id);
  }

  public function Update($d=array(), $photo=null){
    foreach($d as $k=>$v){
      $d[$k] = htmlspecialchars($v);
    }

    if($d['pwd1']!="" && $d['pwd2']!=""){
      if($d['pwd2']==$d['pwd1']){
        \DataBaseQuery::Set('UPDATE Utilisateur SET PassUtilisateur = $1 WHERE NumUtilisateur = $2', md5($d['pwd1']), $this->id);
      }
      else{
        return "PWD_ERROR";
      }
    }

    $upload = false;
    if(isset($photo['name']) && !empty($photo['name'])){
      $extension = explode('.',$photo['name']);
      $extension = $extension[count($extension)-1];
      $filename = md5(uniqid()).'.'.$extension;
      // On l'upload
      $upload = parent::Upload($photo, $filename, __PATH__.'Content/img/');
    }

    if($upload==false){
      $d['photo'] = \DataBaseQuery::Get('SELECT photoUtilisateur FROM Utilisateur WHERE NumUtilisateur = $1', $this->id);
    }
    else{
      $d['photo'] = $filename;
    }

    $sql = "
    UPDATE Utilisateur
    SET NomUtilisateur = $1,
    PrenomUtilisateur = $2,
    DateNaissanceUtilisateur = $3,
    AdrRueUtilisateur = $4,
    AdrCPUtilisateur = $5,
    AdrVilleUtilisateur = $6,
    AdrPaysUtilisateur = $7,
    telUtilisateur = $8,
    EmailUtilisateur = $9,
    nationaliteUtilisateur = $10,
    photoUtilisateur = $11
    WHERE NumUtilisateur = $12
    ";
    $update = \DataBaseQuery::Set(
      $sql,
      $d['nom'],
      $d['prenom'],
      $d['datenaiss'],
      $d['rue'],
      $d['cp'],
      $d['ville'],
      $d['pays'],
      $d['tel'],
      $d['email'],
      $d['nationalite'],
      $d['photo'],
      $this->id
    );
    if($update){
      return "FORM_OK";
    }
    else{
      return "FORM_ERROR";
    }
  }


}

?>
