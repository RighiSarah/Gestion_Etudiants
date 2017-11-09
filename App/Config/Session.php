<?php

ini_set('session.name', str_replace(' ','_',PROJECT));
session_cache_expire(30);
session_start();

?>
