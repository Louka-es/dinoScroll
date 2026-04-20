<?php //logout.php

require("settings.php");

$_SESSION["name"] = null;
$_SESSION["userid"] = null;

flash_in("success", "Déconnexion réussie");
header("Location: ..");
?>