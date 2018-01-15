<?php
// Appel du Fichier de configuration
    require_once('admin/config.php');
// Appel du Fichier de connexion
    require_once('admin/connexion.php');
// Appel du Fichier de fonctions
    require_once($_SERVER['DOCUMENT_ROOT'].ROOT_PROJECT.'/functions.php');
    
spl_autoload_register ('chargerClasse'); // On charge les classes si besoin
$user = new user($_SESSION['id']); // Création de l'utilasateur
$page->start_header(); ?>
<script src="/<?php echo ROOT_PROJECT; ?>/js/notifier.min.js"></script>
<script src="<?php echo ROOT_PROJECT; ?>/js/table_filter_excel.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PROJECT; ?>/design/css/table_filter.css">
<script type="text/javascript" src="<?php echo ROOT_PROJECT; ?>/apps/stage_fiches/script/module.js"></script>
<script>
	function affErrorMsg(){
		$("#errormsg").slideToggle("slow");
	};
</script>
<?php $page->show_header();?>
<?php if (get_module_sidebar()==TRUE) : ?>
	<!-- Sidebar -->
	<div id="sidebar" class="col-md-3">
		<div class="inner">
			<h4 class="title-main"><?php echo get_module_nom(); ?></h4>
			<?php include($_SERVER['DOCUMENT_ROOT'].ROOT_PROJECT.'/includes/ssmenu.php') ;?>
		</div>
	</div>
	<!-- FIN Sidebar -->
	<!-- Corps du contenu -->
	<div id="content" class="col-md-9">
<?php else: ?>
	<!-- Corps du contenu -->
	<div id="content" class="col-md-12">
<?php endif ; ?>