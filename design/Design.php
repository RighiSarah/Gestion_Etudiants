<?php
require_once("htmlHelper.php");

class page {

	public $holder;
	public $form;
	public $title;
	
	public function __construct($title = null) {
		$this->title = $title;
		$this->holder = new holder();
	}
	
	public function verifier_droits($a) {		
		$var1 = $a->prepare('SELECT idPage FROM PAGE WHERE routePage = :PHP_SELF');
		$var1->execute(array('PHP_SELF' => $_SERVER['PHP_SELF']));
	
		if ($var1->rowCount() > 0) // S'il y a un des droits pour cette page
		{
			$roww = $var1->fetch();
			$var2 = $a->prepare('SELECT * FROM DROITPAGE WHERE idPage = :idP AND idRole = :idR');
			$var2->execute(array(
				'idP' => $roww['idPage'],
				'idR' => $_SESSION['role']
			));
						
			if ($var2->rowCount() == 0) // Je n'ai pas le droit d'etre sur cette page
			{
				echo('<meta http-equiv=Refresh content="0; url=../index.php" />');
			}
		}
	}
	
	public function start_header() {
		include "header1.php";
		if ($this->title == null || $this->title == "") {
			echo "<title>IntraDIS - L'intranet du DIS - Lyon 2</title>";
			$GLOBALS["pageTitle"] = "PLEASE CHOOSE A PAGE TITLE IN CONSTRUCTOR OF PAGE CLASS";
		}
		else {
			echo "<title>IntraDIS - L'intranet du DIS - Lyon 2 - $this->title</title>";
			$GLOBALS["pageTitle"] = $this->title;
		}
	}

	public function show_header($message="", $type="success") {
		include "header2.php";
		
		if ($message != null && $message != "") {
			switch($type) {
				case "success":
					echo "<div class=\"alert alert-success\"><span class=\"glyphicon glyphicon-ok\"></span> $message</div>";
					break;
				case "error":
					echo "<div class=\"alert alert-danger\"><span class=\"glyphicon glyphicon-ban-circle\"></span> $message</div>";
					break;
				case "warning":
					echo "<div class=\"alert alert-warning\"><span class=\"glyphicon glyphicon-warning-sign\"></span> $message</div>";
					break;
			}
		}

		echo "<div id=\"content-main\" class=\"row\">";
		echo "<div class=\"col-md-12\">";
	}

	public function start_content($action="", $method="post", $id = "mainForm") {
		if ($action == null || $action == "")
			$action = $_SERVER['PHP_SELF'];
		$this->form = $this->holder->form($id, $action, $method);		
		$this->form->renderOpen();
		
	}
	
	public function end_content() {
		$this->form->renderClose();
	}

	public function show_footer() {
		include "footer.php";
	}
	
	public function DBError($con) {
		echo "Query DB Failed!: (" . $con->errno . ") ". $con->error;
	}

	public function getData($id) {
		return $_REQUEST[$id];
	}
	
	public function getDataForLike($id) {
		$data = $this->getData($id);
		if ($data == null || $data == "") {
			$data = "%";
		}
		else {
			$data = "%$data%";
		}
		return $data;
	}
	
	// -----------------------------------------
	
	public function textbox($id, $value="", $isRequired = false, $requiredMsg = null, $class = "", $attr = array()) {
		$txt = new input($id, $value,  "dsInputText ".$class, $attr);
		$txt->__set("id", $id);
		$txt->isRequired($isRequired, $requiredMsg);
		$this->holder->add($txt);
		$txt->render();
	}
	
	public function passbox($id, $isRequired=false, $requiredMsg=null, $class="", $attr=array()) {
		$txtPass = new password($id, "", "dsInputText ".$class, $attr);
		$txtPass->__set("id", $id);
		$txtPass->isRequired($isRequired, $requiredMsg);
		$this->holder->add($txtPass);
		$txtPass->render();
	}
	
	public function dropdown($id, $opts, $selected = null, $isRequired = false, $requiredMsg=null, $class="", $attr=array()) {
		$dd = new select($id, "dsSelect ".$class);
		$dd->__set("id", $id);
		$dd->isRequired($isRequired, $requiredMsg);
		$dd->optionsFromArray($opts, $selected);
		$dd->render();
	}
	
	public function submit($id = "btnSubmit", $title="Submit", $class="", $attr=array()) {
		if ($id == null || $id == "")
			$id = "btnSubmit";
		$submit = new submit($id, $title, $class. " dsSubmit", $attr);
		$submit->render();
	}
	
	public function a($title, $link, $name, $class="", $attr = array()) {
		$hyLink = new a($link, "link", $title, $name, "dsLink ".$class, $attr);
		$this->holder->add($hyLink);
		$hyLink->render();
	}
	
	public function table($title, $columns, $rows) {
		$table = new table();
		$table->class = "dynamicTbl";
		$table->cellpadding = 2;
		$table->width = "100%";
		$table->cellspacing = 1;
		$table->border = 1;
		//$table->style = "background:#333";
		
		$tdOptions = array("style" => "background:#fff");
		$columnsObj = json_decode($columns);

		if ($columnsObj == NULL) {
			echo "Problem with column definition of table with title:$title";
			die;
		}

		echo "<div width='100%' style='text-align:center;font-weight:bold'>$title</div>";
		$thead = $table->thead();
		$tr = $thead->tr();
		foreach ($columnsObj as $currentCol) {
			$tr->th($currentCol->title,null,null,$tdOptions);
		}
		$tbody = $table->tbody();
		while ($row = $rows->fetch_assoc()) {
			$tr = $tbody->tr();
			foreach ($columnsObj as $currentCol) {
				$tr->td($row[$currentCol->field]);
			}
		}
		$table->render();
	}
}

function getPath($file) {
	$currentActualDirectory = strtolower(str_replace("\\", "/", getcwd()));
	$designFileDirectory = str_replace("/design/design.php", "", strtolower(str_replace("\\", "/", __FILE__)));
	$currentUrlDirectory = str_replace($designFileDirectory, "", $currentActualDirectory);

	$pageURL = 'http';
	if (isset($_SERVER["HTTPS"]) && strtolower($_SERVER["HTTPS"]) == "on") {$pageURL .= "s";}
	$pageURL .= "://";
	if ($_SERVER["SERVER_PORT"] != "80") {
		$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
	} else {
		$pageURL .= $_SERVER["SERVER_NAME"];
	}

	$pageURL = $pageURL.substr($_SERVER["SCRIPT_NAME"], 0, stripos($_SERVER["SCRIPT_NAME"], $currentUrlDirectory))."/".$file;
 
	if ($currentUrlDirectory == "") {
		return $file;
	}
	else {
		return $pageURL;
	}
}
function getCurrentMainDirectory() {
	$currentActualDirectory = strrev(str_replace("\\", "/", getcwd()));
	$currentUrlDirectory = strrev(substr($_SERVER["SCRIPT_NAME"],0, strripos($_SERVER["SCRIPT_NAME"], "/")));
	$iCounter = 0;
	for ($iCounter = 0; $iCounter < strlen($currentActualDirectory) && $iCounter < strlen($currentUrlDirectory); $iCounter++) {
		if ($currentActualDirectory[$iCounter] != $currentUrlDirectory[$iCounter])
			break;
	}
	$currentPath = strrev(substr($currentUrlDirectory,0, $iCounter));
	return $currentPath;
}
function writePath($file) {
	echo getPath($file);
}
?>