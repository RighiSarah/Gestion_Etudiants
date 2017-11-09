<?php

namespace App\Model;

class Master{

    const SALT_URL = "184315956daf1pa049bcc7b6";

    public static function ArrayFormatter(&$array){
      if(!isset($array[0])){
        $tmp[] = $array;
        $array = $tmp;
      }
    }

    public static function sendMail($to,$subject,$body){
        /*$mail = new \PHPmailer();
        $mail->IsSMTP();
        $mail->SMTPAuth   = true;
        $mail->SMTPSecure = "ssl";
        $mail->Host       = "smtp.gmail.com";
        $mail->Port       = 465;
        $mail->Username   = "trials.php@gmail.com";
        $mail->Password = "trials.php.php";
        $mail->From = 'no-reply@univ-lyon2.fr';
        $mail->FromName='Intranet-DIS';
        $mail->AddAddress($to);
        $mail->CharSet = 'UTF-8';
        $mail->Subject = $subject;
        $mail->Body = $body;
        $send = $mail->Send();
        $mail->SmtpClose();
        unset($mail);
        return $send;*/
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
        $headers .= "From: no-reply@univ-lyon2.fr" . "\r\n";
        return mail($to,$subject,$body,$headers);
    }

    public static function FrenchMonth($num){
      $month = array(
        "01" => "Janvier",
        "02" => "Février",
        "03" => "Mars",
        "04" => "Avril",
        "05" => "Mai",
        "06" => "Juin",
        "07" => "Juillet",
        "08" => "Août",
        "09" => "Septembre",
        "10" => "Octobre",
        "11" => "Novembre",
        "12" => "Décembre"
      );
      return $month[$num];
    }

    public static function Upload($FILE, $name, $uploads_dir){
      if(!empty($FILE)){
        $upload = false;
        if($FILE["error"]==0) {
          $tmp_name = $FILE["tmp_name"];
          $upload = move_uploaded_file($tmp_name, "$uploads_dir/$name");
        }
        return $upload;
      }
    }

    public static function encrypturl($text){
      return trim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256,
      self::SALT_URL, $text, MCRYPT_MODE_ECB,
      mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256,
      MCRYPT_MODE_ECB), MCRYPT_RAND))));
    }

    public static function decrypturl($text){
      $text = preg_replace('/\s/', '+', $text);
      return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, self::SALT_URL,
      base64_decode($text), MCRYPT_MODE_ECB,
      mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256,
      MCRYPT_MODE_ECB), MCRYPT_RAND)));
    }

    public static function UploadInZIP($dir, $files){
      $cutname = uniqid().'.zip';
      $name = $dir.$cutname;
      $zip = new \ZipArchive();
      if($zip->open($name, \ZipArchive::CREATE) === true){
        $nb_files = count($files['files']['name']);
        for($i=0;$i<$nb_files;$i++){
          $zip->addFromString($files['files']['name'][$i], file_get_contents($files['files']['tmp_name'][$i]));
        }
      }
      $zip->close();
      return $cutname;
    }

}
