<?php  //partials/menu.php?>
<header>
    <div class="header-left">
        <a href="." class="logo-link">
            <img class="logoImg" src="img/logoTexte.png" alt="Logo DinoScroll">
        </a>
    </div>

    <nav class="header-right">
        <a href="add.php" class="add-article-btn" title="Ajouter un article">
            <img src="img/plus.png" alt="Ajouter">
        </a>
        <?php if (!empty($_SESSION['name'])): ?>
            <a href="config/logout.php" class="logout-btn">Se déconnecter</a>
        <?php else: ?>
            <a href="account.php" class="login-btn">Créer un compte</a>
            <a href="login.php" class="login-btn">Se connecter</a>
        <?php endif; ?>
    </nav>
</header>

<?php flash_out()?>