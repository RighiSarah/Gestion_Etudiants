<?php

# VENDOR

# TWIG
include __PATH__.'/Vendor/Twig/Autoloader.php';

\Twig_Autoloader::register();

$loader = new Twig_Loader_Filesystem('Templates');
$TWIG = new Twig_Environment($loader, array(
  'debug' => DEBUG
));

include __PATH__.'/Vendor/PHPMailer/PHPMailerAutoload.php';

?>
