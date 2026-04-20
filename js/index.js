// index.js

const searchInputIndex = document.querySelector('input.search-input');
const bouttonIndex = document.getElementById('bouttonIndex');

bouttonIndex.addEventListener('click', () => {
    const contenu = searchInputIndex.value;
    localStorage.setItem('searchQuery', contenu);
    window.location.href = 'discover.php';
});

searchInputIndex.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
        bouttonIndex.click();
    }
});

document.querySelectorAll('.video-player').forEach(video => {
    video.addEventListener('click', () => {
        document.querySelectorAll('.video-player').forEach(v => {
            if (v !== video) {
                v.pause();
            }
        });

        if (video.paused) {
            video.play();
        } else {
            video.pause();
        }
    });
});

