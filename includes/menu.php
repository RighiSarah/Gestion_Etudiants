<?php
    // Adresse du fichier cache
    $cache = $_SERVER['DOCUMENT_ROOT'].''.ROOT_APPS.'/cache/menus/menu-'.$user->getRole().'.cache';
    // Expiration au bout de 24h
    $expire = time() -300 ;
?> 
<?php // Si le fichier n'existe pas ou si il est p�rim�, on lance la requete ?>
<?php if(!file_exists($cache) || filemtime($cache) < $expire) : ?>
    <?php ob_start(); ?>

        <?php 
            $requete_menu1 = $connexion->prepare('
            SELECT * FROM module
            WHERE etat = 1 AND idModule
            IN (
                SELECT idModule
                FROM association_40
                WHERE idRole = :Role
                )
            ORDER BY ordre ASC');
			
            $requete_menu1 -> execute(array('Role' => $user->getRole()));
		?>
		<ul>
		<?php foreach ($requete_menu1 as $resultat) : ?>

			<li><a href="<?php echo ROOT_PROJECT; ?>/apps/<?php echo $resultat['route']; ?>"><?php echo $resultat['nomModule']; ?></a> 
			<?php 
				$requete_menu2 = $connexion->prepare('
					SELECT * FROM page
					WHERE subMenu =0 AND idModule = :Module AND idPage 
					IN (
						SELECT idPage 
						FROM droitpage 
						WHERE idRole = :Role
						)
					ORDER BY ordrePage ASC
						');

				$requete_menu2 -> execute(array(
					'Module' => $resultat['idModule'],
					'Role' => $user->getRole()));
				?>
			 <?php if( $requete_menu2=$requete_menu2->fetchAll()) : ?>
			 <ul>
				<?php foreach ($requete_menu2 as $resultat2) : ?>
					<li><a href="<?php echo ROOT_PROJECT; ?>/apps/<?php echo $resultat['route']; ?>/<?php echo $resultat2['routePage'] ; ?>"><?php echo $resultat2['page']; ?></a>
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
			<li><a href="http://dis.univ-lyon2.fr/~ichouaikhia/projet_anglais/" target="_blank">English for Students</a></li>
		</ul>
    <?php $menu = ob_get_contents(); ?>
    <?php ob_end_clean(); ?>
    <?php $fichier = fopen($cache, 'w+'); ?>
    <?php fwrite($fichier, $menu); ?>
    <?php fclose($fichier); ?>
<?php endif ; ?>

<?php // on lit le cache ?>
<?php readfile($cache); ?>