const subcategories = {
    1: [
        { name: "Trends TikTok" },
        { name: "Trends Instagram" },
        { name: "Mèmes" },
        { name: "Formats viraux" },
        { name: "Challenges" }
    ],
    2: [
        { name: "TikTok" },
        { name: "Instagram" },
        { name: "YouTube" },
        { name: "Nouveautés" },
        { name: "Algorithmes" }
    ],
    3: [
        { name: "Portraits" },
        { name: "Stratégies" },
        { name: "Nouveaux talents" },
        { name: "Interviews" }
    ],
    4: [
        { name: "Revenus" },
        { name: "Marques d'influenceurs" },
        { name: "Influence marketing" },
        { name: "Études de cas" }
    ],
    5: [
        { name: "Fake news" },
        { name: "Manipulation" },
        { name: "Dropshipping" },
        { name: "Influence cachée" }
    ],
    6: [
        { name: "Société" },
        { name: "Psychologie" },
        { name: "Jeunesse" },
        { name: "Culture internet" }
    ]
};

document.querySelectorAll('input[name="categorie"]').forEach(radio => {
    radio.addEventListener('change', function() {
        const categoryId = this.dataset.category;
        const container = document.getElementById('subcategories-container');
        const list = document.getElementById('subcategories-list');
        
        if (this.checked) {
            list.innerHTML = '';
            if (subcategories[categoryId]) {
                subcategories[categoryId].forEach((sub, index) => {
                    const li = document.createElement('li');
                    const id = `f_subcategorie_${categoryId}_${index}`;
                    li.innerHTML = `
                        <input type="radio" name="subcategorie" id="${id}" value="${sub.name}" data-subcategory-id="${index + 1}">
                        <label for="${id}">${sub.name}</label>
                    `;
                    list.appendChild(li);
                });
                container.style.display = 'block';
            }
        }
    });
});

document.querySelector('form').addEventListener('reset', function() {
    document.getElementById('subcategories-container').style.display = 'none';
    document.getElementById('subcategories-list').innerHTML = '';
});
