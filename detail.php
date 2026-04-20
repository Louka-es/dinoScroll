<?php //detail.php
require("config/settings.php");

$read = $sql->prepare("
    SELECT 
        articles.*, 
        users.name AS author_name,
        categories.name AS category_name,
        subcategories.name AS subcategory_name
    FROM articles 
    JOIN users ON articles.user_id = users.id
    JOIN categories ON articles.category_id = categories.id
    JOIN subcategories ON articles.subcategory_id = subcategories.id
    WHERE articles.id = :i
");

$read ->execute([
    ":i"=> $_GET["id"],
]);

    $data = $read->fetch(PDO::FETCH_ASSOC);

    // var_dump($data);

if (empty($_GET["id"])) {
    flash_in("error", "⛔ ID d'article invalide.");
    header("Location: .");
    exit();
}

if ($read->rowCount() == 0):
    flash_in("error", "⛔ Cet article n'est pas inscrit dans notre base de donnée.");
    header("Location: .");
    exit();
endif;

?>
<!DOCTYPE html>
<html>
<head>
    <?php include("partials/head.php"); ?>
    <link rel="stylesheet" href="css/detail.css">
    <title><?= $data["title"] ?> - Articles</title>
</head>
<body>
    <?php include("partials/menu.php"); ?>
    <main class="detail-main">
        <article class="article-detail">
            <div class="article-header">
                <h1><?= htmlspecialchars($data["title"]) ?></h1>
                <p class="article-resume"><?= htmlspecialchars(substr($data["content"], 0, 150)) ?>...</p>
                
                <div class="article-meta">
                    <span class="article-tag"><?= htmlspecialchars($data["category_name"]) ?></span>
                    <span class="article-date">Dernière mise à jour <?= date('d F Y', strtotime($data["updated"])) ?></span>
                    <span class="article-read-time">5 min de lecture</span>
                </div>
            </div>

            <?php if (!empty($data['image'])): ?>
                <img src="<?= htmlspecialchars($data['image']) ?>" alt="<?= htmlspecialchars($data['title']) ?>" class="article-image">
            <?php else: ?>
                <img src="https://i.imgur.com/v349G31.png" alt="<?= htmlspecialchars($data['title']) ?>" class="article-image">
            <?php endif; ?>

            <div class="article-content">
                <h2>Contenu de l'article</h2>
                <p><?= nl2br(htmlspecialchars($data["content"])) ?></p>

                <div class="article-footer-detail">
                    <div class="article-info">
                        <p><strong>Auteur :</strong> <?= htmlspecialchars($data["author_name"]) ?></p>
                        <p><strong>Catégorie :</strong> <?= htmlspecialchars($data["category_name"]) ?></p>
                        <p><strong>Sous-catégorie :</strong> <?= htmlspecialchars($data["subcategory_name"]) ?></p>
                        <p><strong>Créé le :</strong> <?= date('d F Y', strtotime($data["created"])) ?></p>
                    </div>
                </div>
            </div>
        </article>
    </main>
    <?php include("partials/footer.php"); ?>
</body>
</html>