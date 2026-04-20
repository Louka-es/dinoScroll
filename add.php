<?php //add.php
require("config/settings.php");

if(empty($_SESSION['name'])):
    flash_in("error", "⛔ Vous devez être connecté pour ajouter un article.");
    header("Location: login.php");
    exit();
endif;

if($_SESSION['role'] != "admin"):
    flash_in("error", "⛔ Vous devez être administrateur pour ajouter un article.");
    header("Location: login.php");
    exit();
endif;

if(!empty($_POST)):

    $error = false;

    if(empty($_POST['titre'])):
        $error = true;
        var_dump("titre vide");
    endif;

        if(empty($_POST['categorie'])):
        $error = true;
        var_dump('categorie vide');
        else:
            if ($_POST['categorie'] == "Tendances"):
                $_POST['categorie'] = 1;
            elseif ($_POST['categorie'] == "Plateformes"):
                $_POST['categorie'] = 2;
            elseif ($_POST['categorie'] == "Createurs"):
                $_POST['categorie'] = 3;
            elseif ($_POST['categorie'] == "Business"):
                $_POST['categorie'] = 4;
            elseif ($_POST['categorie'] == "Derives"):
                $_POST['categorie'] = 5;
            elseif ($_POST['categorie'] == "Santé"):
                $_POST['categorie'] = 6;
            endif;
        endif;

    if(!$error):
        if(empty($_POST['content'])) {
            $_POST['content'] = null;
        }

        $subcategory_id = 1; 
        if (!empty($_POST['subcategorie'])) {
            $subcategories_map = [
                // Catégorie 1
                "Trends TikTok" => 1, "Trends Instagram" => 2, "Mèmes" => 3, "Formats viraux" => 4, "Challenges" => 5,
                // Catégorie 2
                "TikTok" => 6, "Instagram" => 7, "YouTube" => 8, "Nouveautés" => 9, "Algorithmes" => 10,
                // Catégorie 3
                "Portraits" => 11, "Stratégies" => 12, "Nouveaux talents" => 13, "Interviews" => 14,
                // Catégorie 4
                "Revenus" => 15, "Marques d'influenceurs" => 16, "Influence marketing" => 17, "Études de cas" => 18,
                // Catégorie 5
                "Fake news" => 19, "Manipulation" => 20, "Dropshipping" => 21, "Influence cachée" => 22,
                // Catégorie 6
                "Société" => 23, "Psychologie" => 24, "Jeunesse" => 25, "Culture internet" => 26
            ];
            $subcategory_id = $subcategories_map[$_POST['subcategorie']] ?? 1;
        }

        $add = $sql->prepare("INSERT INTO articles (title, content, image, user_id, category_id, subcategory_id) VALUES (:title, :content, :image, :user_id, :category, :subcategory)");

        $add->execute([
            ':title' => $_POST['titre'],
            ':content' => $_POST['content'],
            ':image' => $_POST['image'],
            ':user_id' => $_SESSION['userid'],
            ':category' => $_POST['categorie'],
            ':subcategory' => $subcategory_id,
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
    <title>Ajouter un article</title>
</head>
<body>
    <?php include("partials/menu.php"); ?>
    <main>
        <h1>Ajouter un article</h1>
        <form method="POST" action="<?= $_SERVER['PHP_SELF'] ?>">
            <p>
                <label for="f_titre">Titre de l'article :</label>
                <input type="text" name="titre" id="f_titre" placeholder="Titre de l'article">
            </p>
            <p>
                <label for="f_content">Contenu :</label>
                <textarea name="content" id="f_content" placeholder="Description de l'article"></textarea>
            </p>

            <p>
                <label>Catégorie :</label>
            </p>
            <ul>
                <li>
                    <input type="radio" name="categorie" id="f_categorie_tendances" value="Tendances" data-category="1">
                    <label for="f_categorie_tendances">Tendances</label>
                </li>
                <li>
                    <input type="radio" name="categorie" id="f_categorie_plateformes" value="Plateformes" data-category="2">
                    <label for="f_categorie_plateformes">Plateformes</label>
                </li>
                <li>
                    <input type="radio" name="categorie" id="f_categorie_createurs" value="Createurs" data-category="3">
                    <label for="f_categorie_createurs">Createurs</label>
                </li>
                <li>
                    <input type="radio" name="categorie" id="f_categorie_business" value="Business" data-category="4">
                    <label for="f_categorie_business">Business</label>
                </li>
                <li>
                    <input type="radio" name="categorie" id="f_categorie_derives" value="Derives" data-category="5">
                    <label for="f_categorie_derives">Derives</label>
                </li>
                <li>
                    <input type="radio" name="categorie" id="f_categorie_sante" value="Santé" data-category="6">
                    <label for="f_categorie_sante">Santé</label>
                </li>
            </ul>

            <div id="subcategories-container" style="display: none; margin-top: 20px;">
                <p>
                    <label>Sous-catégories :</label>
                </p>
                <ul id="subcategories-list">
                </ul>
            </div>

            <div>
                <p>
                    <label for="f_image">URL de l'image :</label>
                    <input type="text" name="image" id="f_image" placeholder="URL de l'image">
                </p>
            </div>

            <p>
                <button type="submit">Ajouter</button>
                <button type="reset">Effacer</button>
            </p>


            
        </form>
    </main>

    <script src="js/add.js"></script>
    <?php include("partials/footer.php"); ?>
</body>
</html>