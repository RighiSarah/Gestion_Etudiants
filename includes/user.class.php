<?php
/*
 * La classe User permet d'obtenir facilement les données de la personne connectée
 */
class user {
    // Déclarations des données utilisateur
    private $id_user;
    private $nom;
    private $prenom;
    private $mail;
    private $login;
    private $id_role;
    private $role;
    private $mdp;
    private $photo;
    private $sexe;
    private $nationalite;
    private $type;
    private $dateNaissance;
    private $adresse;
    private $cp;
    private $ville;
    private $pays;
    private $telephone;
    
    // Constructeur
    public function __construct($id_user) {
       // Récupère les données de l'utilisateur
        include ('admin/connexion.php');
        $requete = $connexion->prepare('
            SELECT *
            FROM utilisateur as u, role as r
            WHERE NumUtilisateur=:id AND u.idRole = r.idRole');
        
        $requete->execute(array(
            'id' => $id_user));
        
        $resultat = $requete->fetch();
        //Affectation des données dans l'objet
        $this->id_user = $resultat['NumUtilisateur'];
        $this->nom = $resultat['NomUtilisateur'];
        $this->prenom= $resultat['PrenomUtilisateur'];
        $this->mail = $resultat['EmailUtilisateur'];
        $this->login = $resultat['LoginUtilisateur'];
        $this->id_role = $resultat['idRole'];
        $this->role = $resultat['nomRole'];
        $this->mdp = $resultat['PassUtilisateur'];
        $this->photo = $resultat['photoUtilisateur'];
        $this->sexe = $resultat['sexeUtilisateur'];
        $this->type = $resultat['TypeUtilisateur'];
        $this->dateNaissance = $resultat['DateNaissanceUtilisateur'];
        $this->adresse = $resultat['AdrRueUtilisateur'];
        $this->cp = $resultat['AdrCPUtilisateur'];
        $this->ville = $resultat['AdrVilleUtilisateur'];
        $this->pays = $resultat['AdrPaysUtilisateur'];
        $this->telephone = $resultat['telUtilisateur'];
        $this->nationalite = $resultat['nationaliteUtilisateur'];
    }
    
    
    //Getters
    public function getId(){
        return $this->id_user;
    }

    public function getNom(){
        return $this->nom;
    }

    public function getMdp(){
        return $this->mdp;
    }
    
    public function getPrenom(){
        return $this->prenom;
    }
    
    public function getNomComplet(){
        return $this->prenom.' '.$this->nom;
    }    
    
    public function getMail(){
        return $this->mail;
    }
    
    public function getLogin(){
        return $this->login;
    }
    
    //getRole(0) renvoi un entier
    //getRole(1) renvoi le nom du statut
    public function getRole($choix=0){
        if( $choix == 0 ){
            return $this->id_role;
        }
        elseif( $choix == 1){
            return $this->role;
        }
        return $this->prenom;
    }
    
    public function getPhoto() {
        return $this->photo;
    }
    
    public function getSexe() {
        return $this->sexe;
    }
    
    public function getNationalite() {
        return $this->nationalite;
    }
    
    public function getType() {
        return $this->type;
    }

    public function getDateNaissance() {
        return $this->dateNaissance;
    }

    public function getAdrRue() {
        return $this->adresse;
    }

    public function getAdrCP() {
        return $this->cp;
    }

    public function getAdrVille() {
        return $this->ville;
    }

    public function getAdrPays() {
        return $this->pays;
    }

    public function getTelephone() {
        return $this->telephone;
    }
    
    // Setters
    public function setMdp($NewMdp, $OldMdp=NULL) {
            $this->mdp = sha1(sha1($NewMdp).'INTRADIS');
    }
    
    public function setNom($new) {
        if(!empty($new)) {
            $this->nom = $new;
        }
    }
    
    public function setPrenom($new) {
        if(!empty($new)) {
            $this->prenom = $new;
        }
    }
    
    public function setMail($new) {
        if(!empty($new)) {
            $this->mail = $new;
        }
    }
    
    public function setLogin($new) {
        if(!empty($new)) {
            $this->login = $new;
        }
    }
    
    public function setPhoto($new) {
        if(!empty($new)) {
            $this->photo = $new;
        }
    }

    public function setSexe($new) {
        if(!empty($new)) {
            $this->sexe = $new;
        }
    }
    
    public function setNationalite($new) {
        if(!empty($new)) {
            $this->nationalite = $new;
        }
    }
    
    public function setRole($new) {
        if(!empty($new)) {
            $this->id_role = $new;
        }
    }
    
    public function setType($new) {
        if(!empty($new)) {
            $this->Type = $new;
        }
    }

    public function setAdrRue($new) {
        $this->adresse = $new;
    }

    public function setAdrCP($new) {
        $this->cp = $new;
    }

    public function setDateNaissance($new) {
        $this->dateNaissance = $new;
    }

    public function setAdrVille($new) {
        $this->ville = $new;
    }

    public function setAdrPays($new) {
        $this->pays = $new;
    }

    public function setTelephone($new) {
        $this->telephone = $new;
    }

    public function maj()
    {
        include ('admin/connexion.php');
        $sql = 'UPDATE utilisateur SET ';
        $sql .= 'NomUtilisateur = ?, ';
        $sql .= 'PrenomUtilisateur = ?, ';
        $sql .= 'DateNaissanceUtilisateur = ?, ';
        $sql .= 'AdrRueUtilisateur = ?, ';
        $sql .= 'AdrCPUtilisateur = ?, ';
        $sql .= 'AdrVilleUtilisateur = ?, ';
        $sql .= 'AdrPaysUtilisateur = ?, ';
        $sql .= 'telUtilisateur = ?, ';
        $sql .= 'EmailUtilisateur = ?, ';
        $sql .= 'LoginUtilisateur = ?, ';
        $sql .= 'sexeUtilisateur = ?, ';
        $sql .= 'nationaliteUtilisateur = ? ';
        $sql .= 'WHERE NumUtilisateur = ?';
        

        $q = $connexion->prepare($sql);
        $q->execute(array(
                $this->getNom(),
                $this->getPrenom(),
                $this->getDateNaissance(),
                $this->getAdrRue(),
                $this->getAdrCP(),
                $this->getAdrVille(),
                $this->getAdrPays(),
                $this->getTelephone(),
                $this->getMail(),
                $this->getLogin(),
                $this->getSexe(),
                $this->getNationalite(),
                $this->getId()
                 ));
    }
    
    public function majMdp() {
        include ('admin/connexion.php');
        $sql = 'UPDATE utilisateur SET ';
        $sql .= 'PassUtilisateur = ? ';
        $sql .= 'WHERE NumUtilisateur = ?';

        $q = $connexion->prepare($sql);
        $q->execute(array(
                $this->getMdp(),
                $this->getId()
                 ));
    }

}
?>