<?php

class DataBaseQuery{

    const DISPLAY_PDO_ERROR = true;
    const PARAM_ERROR = "ERROR :: PARAM(S) DOESN'T FIT WITH THE QUERY";

    public static $PDO;
    public static $PDOerror = false;

    public static function RegisterPDO($driver, $port, $host, $user, $pwd, $dbname, $error = false){
        if($error) $error = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING);
        else $error = array();
        try{
            $bd = new PDO($driver.':host='.$host.';port:'.$port.';dbname='.$dbname, $user, $pwd ,$error);
        }
        catch (Exception $e){
            self::$PDOerror = true;
            die('DataBase Error : ' . $e->getMessage());
        }
        self::$PDO = $bd;
        return self::$PDO;
    }

    public static function RegisterPDOsqlite($file){
      try{
        $pdo = new PDO('sqlite:'.$file);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // ERRMODE_WARNING | ERRMODE_EXCEPTION | ERRMODE_SILENT
        self::$PDO = $pdo;
      }
      catch(Exception $e) {
        self::$PDOerror = true;
        die('Erreur : ' . $e->getMessage());
      }
    }

    public static function Get($sql, ...$bind){
        $ret = null;
        if(!self::$PDOerror) {
            $ret = array();
            if (self::DefineBindParam($sql, $bind)) {
                $stmt = self::PrepareQuery($sql, $bind);
                $stmt->execute();
                while ($data = $stmt->fetch()) {
                    foreach ($data as $k => $v)
                        if (is_int($k))
                            unset($data[$k]);
                    $ret[] = $data;
                }
                $stmt->closeCursor();
                if (count($ret) == 1) {
                    $ret = $ret[0];
                    if (count($ret) == 1)
                        $ret = $ret[key($ret)];
                }
            }
        }
        return $ret;
    }

    public static function Set($sql, ...$bind) {
        $ret = null;
        if(!self::$PDOerror) {
            $ret = false;
            if (self::DefineBindParam($sql, $bind)) {
                $stmt = self::PrepareQuery($sql, $bind);
                $ret = $stmt->execute();
                $stmt->closeCursor();
            }
        }
        return $ret;
    }

    public static function NewID($table){
        $ret = null;
        // Récupère le premier champ d'entier et retourne un max + 1 dessus
        if(!self::$PDOerror) {
            $rows = self::Get('SELECT * FROM '.$table.' LIMIT 1');
            if(!empty($rows)) {
                foreach ($rows as $k => $v) {
                    if (is_int($v)) {
                        $ret = (self::Get('SELECT MAX(' . $k . ') AS max FROM ' . $table) + 1);
                        break;
                    }
                }
            }
        }
        return $ret;
    }

    protected static function DefineBindParam($sql, $bind){
        if (!is_array($bind)) $bind = [$bind];
        $NBparam = count($bind);
        $words = explode(" ", $sql);
        $NBwords = count($words);
        $i = 0;
        for ($j = 0; $j < $NBwords; $j++)
            if (strpos($sql, "$" . ($i + 1)))
                $i++;
        if ($i == $NBparam && is_string($sql)) return true;
        else return false;
    }

    protected static function PrepareQuery($sql, $bind){
        $sql = str_replace("$", ":", $sql);
        $stmt = self::$PDO->prepare($sql);
        $NBparam = count($bind);
        for ($i = 0; $i < $NBparam; $i++)
            $stmt->bindParam(":" . ($i + 1), $bind[$i]);
        return $stmt;
    }

}
