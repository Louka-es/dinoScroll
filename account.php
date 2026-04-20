<?php //account.php
require("config/settings.php");

if(!empty($_POST)):
    $error = false;

    if (empty($_POST["pseudo"])):
        $error = true;
    endif;

    if (empty($_POST["mdp"])):
        $error = true;
    endif;

    if ($_POST["mdp"] != $_POST["confirm"]):
        $error = true;
    endif;

    if (!$error):
        $_POST['mdp'] = hPassword($_POST["mdp"]);

        var_dump($_POST);
        $add = $sql->prepare("INSERT INTO users (name, password, role) VALUES (:name, :password, :role)");

        $add->execute([
            ':name' => $_POST['pseudo'],
            ':password' => $_POST['mdp'],
            ':role' => 'user'
        ]);

    header("Location: .");
    exit();
    endif;
endif;

// ?>
<!DOCTYPE html>
<html>
<head>
    <?php include("partials/head.php"); ?>
    <title>S'inscrire</title>
</head>
<body>
    <?php include("partials/menu.php"); ?>
    <main>
        <h1>S'inscrire</h1>

        <form action="<?= $_SERVER['PHP_SELF'] ?>" method="POST">
            <p>
                <label for="f_name">Pseudo :</label>
                <input type="text" name="pseudo" id="f_name" placeholder="ex : Toto">
            </p>
            <p>
                <label for="f_pass">Mot de passe :</label>
                <input type="password" name="mdp" id="f_pass" placeholder="Votre mot de passe">
            </p>
            <p>
                <label for="f_pass_conf">Confirmer le mot de passe :</label>
                <input type="password" name="confirm" id="f_confirm" placeholder="Confirmez votre mot de passe">
            </p>
            <p>
                <button type="submit">S'inscrire</button>
            </p>
        </form>
    </main>
    
    <?php include("partials/footer.php"); ?>
</body>
</html>