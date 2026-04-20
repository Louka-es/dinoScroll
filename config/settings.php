<?php //settings.php

session_start();


define("SQL_HOST", "localhost");
define("SQL_USER","root");
define("SQL_PASS","");
define("SQL_DBNAME","dinoscroll");

try {
    $sql = new PDO("mysql:host=".SQL_HOST.";dbname=".SQL_DBNAME.";charset=utf8", SQL_USER, SQL_PASS );
    
    } catch (Exception $e) {
        die("Erreur SQL : ".$e->getMessage());
    }


/*** Fonctions ***/

function hPassword($pwd) {
    $step1 = hash("sha512", $pwd);
    $step2 = 'sertgvcftyhbghyujhy-yu_è-('.$step1;
    return hash("sha512", $step2);
}

function flash_in($t, $m) {
    if (empty($_SESSION['messages'])) {
        $_SESSION['messages'] = [];
    }
    $_SESSION['messages'][] = [$t, $m];
}

function flash_out() {
    if (!empty($_SESSION['messages'])) :
        echo '<aside id="messages">';
        foreach ($_SESSION['messages'] as $value) {
            echo '<p class="alert '.$value[0].'">' .$value[1].'</p>';
        }

        echo '</aside>';
    endif;

    $_SESSION['messages'] = [];
}
