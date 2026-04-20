// discover.js

const searchInput = document.querySelector('input.search-input');
const searchButton = document.querySelector('.search-icon');
const articleGrid = document.querySelector('.articles-grid');
const noResultsMsg = document.querySelector('.no-results-message');

const savedSearchQuery = localStorage.getItem('searchQuery');
if (savedSearchQuery) {
    searchInput.value = savedSearchQuery;
    localStorage.removeItem('searchQuery');
    performSearch();
}

function performSearch() {
    const searchQuery = searchInput.value.toLowerCase();
    const cards = articleGrid.querySelectorAll('.article-card');
    let visibleCount = 0;
    
    cards.forEach(card => {
        const title = card.querySelector('h4').textContent.toLowerCase();
        
        if (searchQuery === '' || title.includes(searchQuery)) {
            card.style.display = '';
            visibleCount++;
        } else {
            card.style.display = 'none';
        }
    });
    
    if (visibleCount === 0 && searchQuery !== '') {
        noResultsMsg.style.display = '';
    } else {
        noResultsMsg.style.display = 'none';
    }
}

if (searchButton && searchInput) {
    searchButton.addEventListener('click', performSearch);
    searchInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            performSearch();
        }
    });
}