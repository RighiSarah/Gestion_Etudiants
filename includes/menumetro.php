<head>
<style type="text/css">
.Cmetro{
	width:95%;
	margin: 10px 10px 10px 20px;
	padding: 5px 5px 5px 5px;
	text-align:center;
	background-color:#EBEBEB;
	}
	
.Cmetr{
	width:200px;
	height:150px;
	margin: 2px 20px 20px 2px;
	/*padding: 5px 20px 20px 5px;*/
	background-color:#F99;
	display:inline-table;	
	cursor: pointer;	
	background:#69F;
	font-family:Arial,sans-serif;
	color: #fff;
	font-size: 13px;	
	border: 1px solid #343282;	
	margin-bottom: 10px;	
	
	-webkit-border-radius: 3px;
	   -moz-border-radius: 3px;
	        border-radius: 3px;	
	-webkit-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset,
	        0px 0px 0px 3px rgb(254, 254, 254),
	        0px 5px 3px 3px rgb(210, 210, 210);
	   -moz-box-shadow:0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset,
	        0px 0px 0px 3px rgb(254, 254, 254),
	        0px 5px 3px 3px rgb(210, 210, 210);
	        box-shadow:0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset,
	        0px 0px 0px 3px rgb(254, 254, 254),
	        0px 5px 3px 3px rgb(210, 210, 210);
	-webkit-transition: all 0.2s linear;
	   -moz-transition: all 0.2s linear;
	     -o-transition: all 0.2s linear;
	        transition: all 0.2s linear;
	}
	.Cmetr:hover{
	background: #df253d;
}
.Cmetr:active,
.Cmetr:focus{
	background: #df253d;
	position: relative;
	top: 1px;
	border: 1px solid #df253d;	
	-webkit-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;
	   -moz-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;
	        box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;
}
.Cmetr{
	text-align: left;
	margin: 5px 0;
}
.Cmetr a{
		text-decoration:none;
		font-family:Arial, Helvetica, sans-serif;
		font-weight:bold;
		color:#FFF;
		display:block;
		border-bottom:#666 dashed 1px;
		}
		.Cmetr ul{
		font-family:Arial, Helvetica, sans-serif;
		font-size:10px;
		font-weight:bold;
		color:#FFF;
		}
		.Cmetr ul li a:hover{
		font-family:Arial, Helvetica, sans-serif;
		font-size:14px;
		font-weight:bold;
		color:#CCC;
		border-bottom:none;
		}
		.Cmetr ul li a{
		border-bottom:none;
		}
</style>
</head>
<?php 
    // Requête qui récupère les différents modules
	
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

<div class="Cmetro">
	<?php foreach ($requete_menu1 as $resultat) : ?>
		<div class="Cmetr">
        	<a href="<?php echo " ".ROOT_PROJECT; ?>/apps/<?php echo $resultat['route']; ?>">
			<?php echo $resultat['nomModule']; ?></a>
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
					<li><a href="<?php echo " ".ROOT_PROJECT; ?>/apps/<?php echo $resultat['route']; ?>/<?php echo $resultat2['routePage'] ; ?>"><?php echo $resultat2['page']; ?></a></li>
                    <?php endforeach ; ?>  
              </ul>                    
                 <?php endif ; ?>   
        </div> 
        
	<?php endforeach ; ?>
</div>

