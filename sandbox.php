<?php

include __DIR__.'/App/Autoload.php';

header('Content-type: text');

print_r(
  array($_POST,$_FILES)
);


function UploadInZIP($dir, $files){
  $name = $dir.uniqid().'.zip';
  $zip = new ZipArchive();
  if($zip->open($name, ZipArchive::CREATE) === true){
    $nb_files = count($files['files']['name']);
    for($i=0;$i<$nb_files;$i++){
      $zip->addFromString($files['files']['name'][$i], file_get_contents($files['files']['tmp_name'][$i]));
    }
  }
  $zip->close();
  return $name;
}

UploadInZIP(__DIR__.'/Content/documents/',$_FILES);



?>
