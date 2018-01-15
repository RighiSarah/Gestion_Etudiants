<?php
    $module = substr(substr($_SERVER['SCRIPT_FILENAME'],strlen($_SERVER['DOCUMENT_ROOT'].ROOT_APPS )+1),0,strpos(substr($_SERVER['SCRIPT_FILENAME'],strlen($_SERVER['DOCUMENT_ROOT'].ROOT_APPS )+1),'/' ));
	$xml_module = simplexml_load_file($_SERVER['DOCUMENT_ROOT'].'/'.ROOT_PROJECT.'/apps/'.$module.'/config.xml');
    // Adresse du fichier cache
    $cache = $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_APPS.'/cache/menus/ssmenu-'.$xml_module->parametres->appSlug.'-'.$user->getRole().'.cache';
    // Expiration au bout de 24h
    $expire = time() -300 ;
?> 
<?php // Si le fichier n'existe pas ou si il est p�rim�, on lance la requete ?>
<?php if(!file_exists($cache) || filemtime($cache) < $expire) : ?>
    <?php ob_start(); ?>
        <?php
        $requete_ssmenu1 = $connexion->prepare('SELECT * FROM module WHERE nomModule= :nom');
        $requete_ssmenu1 -> execute(array(
            'nom' => get_module_nom()));
        ?> 
  		<?php foreach ($requete_ssmenu1 as $resultat) : ?>
			<?php 
				$requete_menu2 = $connexion->prepare('
					SELECT * FROM page
					WHERE subMenu =0 AND idModule = :Module AND idPage 
					IN (
						SELECT idPage 
						FROM droitpage 
						WHERE idRole = :Role
						)
						');

				$requete_menu2 -> execute(array(
					'Module' => $resultat['idModule'],
					'Role' => $user->getRole()));
			?>
			 <?php if( $requete_menu2=$requete_menu2->fetchAll()) : ?>
			 <ul class="list-unstyled">
				<?php foreach ($requete_menu2 as $resultat2) : ?>
					<li><a class="ssmenu" href="<?php echo " ".ROOT_PROJECT; ?>/apps/<?php echo $resultat['route']; ?>/<?php echo $resultat2['routePage'] ; ?>"><?php echo $resultat2['page']; ?></a>
					<?php 
					$requete_menu3 = $connexion->prepare('
						SELECT * FROM page
						WHERE subMenu =:Pere AND idModule = :Module AND idPage 
						IN (
							SELECT idPage 
							FROM droitpage 
							WHERE idRole = :Role
							)
						ORDER BY ordrePage ASC
					');
					
					$requete_menu3 -> execute(array(
						'Pere' => $resultat2[0],
						'Module' =>$resultat['idModule'],
					'Role' => $user->getRole()));
					?>
					<?php if( $requete_menu3=$requete_menu3->fetchAll()) : ?>
					<ul>
						<?php foreach ($requete_menu3 as $resultat3) : ?>
							<li><a href="<?php echo " ".ROOT_PROJECT ; ?>/apps/<?php echo $resultat['route']; ?>/<?php echo $resultat3['routePage'] ; ?>"><?php echo $resultat3['page']; ?></a></li>
						<?php endforeach ; ?>
					</ul>
					<?php endif ; ?>
				<?php endforeach ; ?>
			 </ul>
			 <?php endif ; ?>
			</li>
		<?php endforeach ; ?>
		</ul>
    <?php $ssmenu = ob_get_contents(); ?>
    <?php ob_end_clean(); ?>
    <?php $fichier = fopen($cache, 'w+'); ?>
    <?php fwrite($fichier, $ssmenu); ?>
    <?php fclose($fichier); ?>
<?php endif ; ?>

<?php // on lit le cache ?>
<?php readfile($cache); ?>