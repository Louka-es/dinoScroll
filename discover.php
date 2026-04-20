<?php //discover.php
require("config/settings.php");

$reqArticles = $sql->prepare("
    SELECT 
        articles.*, 
        categories.name AS category_name,
        subcategories.name AS subcategory_name
    FROM articles
    JOIN categories ON articles.category_id = categories.id
    JOIN subcategories ON articles.subcategory_id = subcategories.id
    ORDER BY articles.id DESC
");

$reqArticles->execute();
$all_articles = $reqArticles->fetchAll(PDO::FETCH_ASSOC);


// ?>
<!DOCTYPE html>
<html>
<head>
    <?php include("partials/head.php"); ?>
    <title>Découverte - DinoScroll</title>
</head>
<body>
    <main>
    <?php include("partials/menu.php"); ?>
    <div class="search-bar">
        <input class="search-input" type="text" placeholder="Rechercher...">
        <button class="search-icon">
            <img src="img/loupe.png" alt="Rechercher">
        </button>
    </div>

    <section class="resultatDeRecherche">
            <h2>Résultat de la recherche</h2>
            <div class="no-results-message" style="display: none; text-align: center; font-size: 1.2rem; color: #666; padding: 2rem;">Aucun résultat</div>
            <div class="articles-grid">
                <?php foreach ($all_articles as $article): ?>
                    <a href="detail.php?id=<?= htmlspecialchars($article['id']) ?>" class="article-card">
                        <?php if (!empty($article['image'])): ?>
                            <img src="<?= htmlspecialchars($article['image']) ?>" alt="<?= htmlspecialchars($article['title']) ?>" class="article-image">
                        <?php else: ?>
                            <img src="https://i.imgur.com/v349G31.png" alt="<?= htmlspecialchars($article['title']) ?>" class="article-image">
                        <?php endif; ?>
                        <div class="article-content">
                            <h4><?= htmlspecialchars(substr($article['title'], 0, 50)) ?></h4>
                            <p><?= htmlspecialchars(substr($article['content'], 0, 80)) ?>...</p>
                            <div class="article-footer">
                                <span class="category"><?= htmlspecialchars($article['subcategory_name']) ?></span>
                            </div>
                        </div>
                    </a>
                <?php endforeach; ?>
            </div>
    </section>
    </main>
    <?php include("partials/footer.php"); ?>
    <script src="js/discover.js"></script>
</body>
</html>

