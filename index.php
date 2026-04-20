<?php //index.php
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

$reqVideos = $sql->prepare("
    SELECT 
        videos.*, 
        categories.name AS category_name,
        subcategories.name AS subcategory_name
    FROM videos
    JOIN categories ON videos.category_id = categories.id
    JOIN subcategories ON videos.subcategory_id = subcategories.id
    ORDER BY videos.id DESC
");
$reqVideos->execute();
$all_videos = $reqVideos->fetchAll(PDO::FETCH_ASSOC);

$articles_by_category = [];
foreach ($all_articles as $article) {
    $category_id = $article['category_id'];
    if (!isset($articles_by_category[$category_id])) {
        $articles_by_category[$category_id] = [];
    }
    $articles_by_category[$category_id][] = $article;
}

$categories = [
    1 => 'Trends',
    2 => 'Plateformes',
    3 => 'Créateurs',
    4 => 'Business',
    5 => 'Dérivés',
    6 => 'Santé'
];

$filtered_articles = $all_articles;
if (isset($_GET['cat'])) {
    $filtered_articles = $articles_by_category[$_GET['cat']] ?? [];
}

// ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <?php include("partials/head.php"); ?>
    <title>Accueil - DinoScroll</title>
</head>
<body>
    <?php include("partials/menu.php"); ?>
    <div class="search-bar">
        <input class="search-input" type="text" placeholder="Rechercher...">
        <button class="search-icon" id="bouttonIndex">
            <img src="img/loupe.png" alt="Rechercher">
        </button>
    </div>
    <main>
        <section class="a-la-une">
            <h2>À la une</h2>
            <section class="contenuA-la-une">
            <div class="featured-first">
                <?php
                if (!empty($all_articles)) {
                    $article = $all_articles[0];
                    echo '<a href="detail.php?id=' . htmlspecialchars($article['id']) . '" class="featured-card">';
                    if (!empty($article['image'])) {
                        echo '  <img src="' . htmlspecialchars($article['image']) . '" alt="' . htmlspecialchars($article['title']) . '" class="featured-image">';
                    } else {
                        echo '  <img src="https://i.imgur.com/v349G31.png" alt="' . htmlspecialchars($article['title']) . '" class="featured-image">';
                    }
                    echo '  <div class="featured-content">';
                    echo '    <h3>' . htmlspecialchars($article['title']) . '</h3>';
                    echo '    <p> <span class="category">' . htmlspecialchars($article['category_name']) . ' </span></p>';
                    echo '  </div>';
                    echo '</a>';
                }
                ?>
            </div>

            <div class="carrousel-verticale">
                <?php 
                $featured_count = 0;
                $article_index = 0;
                foreach ($all_articles as $article) {
                    if ($article_index > 0 && $featured_count < 7) {
                        echo '<a href="detail.php?id=' .$article['id'] . '" class="featured-card" style="text-decoration: none; color: inherit;">';
                        if (!empty($article['image'])) {
                            echo '  <img src="' . htmlspecialchars($article['image']) . '" alt="' . htmlspecialchars($article['title']) . '" class="featured-image">';
                        } else {
                            echo '  <img src="https://i.imgur.com/v349G31.png" alt="' . htmlspecialchars($article['title']) . '" class="featured-image">';
                        }
                        echo '  <div class="featured-content">';
                        echo '    <h3>' . $article['title'] . '</h3>';
                        echo '    <p><span class="category">' . htmlspecialchars($article['category_name']) . '</span></p>';
                        echo '    <p class="subcategory">' . $article['subcategory_name'] . '</p>';
                        echo '  </div>';
                        echo '</a>';
                        $featured_count++;
                    }
                    $article_index++;
                }
                ?>
            </div>
            </section>
            <span class="centrage"><a class="view-more" href="discover.php">Découvrir plus d'articles</a></span>
        </section>

        <section class="bloc-feed">
            <h2>Dino Feed</h2>
            <div class="videos-carrousel">
                <?php 
                $count = 0;
                foreach ($all_videos as $video) {
                    if ($count < 8) {
                        echo '<div class="video-card">';
                        echo '  <div class="video-overlay">';
                        echo '  <video src="' . htmlspecialchars($video['link']) . '" class="video-player"></video>';
                        echo '    <span class="category" style="margin-top: 0.5rem;" >' . htmlspecialchars($video['category_name']) . ' - ' . htmlspecialchars($video['subcategory_name']) . '</span>';
                        echo '    <p>' . htmlspecialchars(substr($video['caption'], 0, 80)) . '...</p>';
                        echo '  </div>';
                        echo '</div>';
                        $count++;
                    }
                }
                ?>
            </div>
        </section>
        </main>

        <section class="citation-du-jour">
            <h2>Citation du jour</h2>
            <div class="citationauteur">
                <span class="lacitation">“Plus tu crées, plus t'es inspirée. Le plus dur, c'est de s'y mettre.”</span>
                <span class="auteur">- Léna Situation</span>
            </div>
        </section>

        <section class="category-filter-section" id = "category-filter">
            <nav class="category-nav">
                <?php foreach ($categories as $cat_id => $cat_name): ?>
                    <a href="index.php?cat=<?= $cat_id ?>#category-filter" class="cat-nav-link">
                        <h3 class="cat-nav-item <?= (isset($_GET['cat']) && $_GET['cat'] == $cat_id) ? 'active' : '' ?>">
                            <?= htmlspecialchars($cat_name) ?>
                        </h3>
                    </a>
                <?php endforeach; ?>
            </nav>

            <div class="articles-grid">
                <?php foreach ($filtered_articles as $article): ?>
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
    <?php include("partials/footer.php"); ?>
    <script src="js/index.js"></script>
</body>
</html>