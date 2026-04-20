<?php //login.php
require("config/settings.php");

if(!empty($_POST)):
    $searchUser = $sql->prepare("SELECT * FROM users WHERE name = :u");
    $searchUser->execute([':u' => $_POST['name']]);

    if($searchUser->rowCount() == 0):
        flash_in('error',"Utilisateur inexistant");
    else:
        $user = $searchUser->fetch(PDO::FETCH_ASSOC);
        if($user['password'] != hPassword($_POST['mdp'])):
            flash_in('error','Mot de passe incorrect');
        else:
            $_SESSION['name'] = $user['name'];
            $_SESSION['userid'] = $user['id'];
            $_SESSION['role'] = $user['role'];
            flash_in('success','Connexion réussie');
            header("Location: .");
            exit();
        endif;
    endif;
endif;

// ?>
<!DOCTYPE html>
<html>
<head>
    <?php include("partials/head.php"); ?>
    <title>Se connecter</title>
</head>
<body>
    <?php include("partials/menu.php"); ?>
    <main>
        <h1>Se connecter</h1>

        <form action="<?= $_SERVER['PHP_SELF'] ?>" method="POST">
            <p>
                <label for="f_name">Nom :</label>
                <input type="text" name="name" id="f_name" placeholder="ex : Toto">
            </p>
            <p>
                <label for="f_pass">Mot de passe :</label>
                <input type="password" name="mdp" id="f_pass" placeholder="Votre mot de passe">
            </p>
            <p>
                <button type="submit">Se connecter</button>
            </p>
        </form>
    </main>
    
    <?php include("partials/footer.php"); ?>
</body>
</html>