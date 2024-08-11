
const filterBoxs = document.querySelectorAll('.filter-box');

filterBoxs.forEach(box => {
    box.addEventListener('click', () => select(filterBoxs, box));
});

document.getElementById('searchInput').addEventListener('keydown', function (event) {
    if (event.key === 'Enter') {
        filter()
    }
});

window.addEventListener('load', () => {
    filter();
});

function select(filterBoxs, box) {
    filterBoxs.forEach(i => {
        i.classList.remove('selected');
    });

    box.classList.add('selected');
    const selectedFilter = document.getElementById('selectedFilter');
    selectedFilter.textContent = box.title;
    selectedFilter.dataset.filter = box.dataset.filter
    filter()
}

function selectCard(card) {
    if (card.classList.contains('selected')) {
        card.classList.remove('selected');

    } else {
        card.classList.add('selected');
    }
}
function filter() {
    const selectedFilter = document.getElementById('selectedFilter');
    const bodyType = selectedFilter.dataset.filter
    const search = document.getElementById('searchInput').value;

    fetch('/filter.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ search: search, bodyType: bodyType })
    })
        .then(response => response.json())
        .then(data => {
            let carList = document.getElementById('carList');
            carList.innerHTML = ''; // Очищаем предыдущие результаты
            if (data.length > 0) {
                data.map(car => {
                    const carCard = document.createElement('div');
                    carCard.classList.add('car-card');
                    carCard.addEventListener('click', () => selectCard(carCard)); // добавляем event select

                    const carImage = document.createElement('img');
                    carImage.src = car.image;
                    carImage.alt = car.title;
                    carImage.classList.add('car-image');

                    const heartIcon = document.createElement('div');
                    heartIcon.classList.add('heart-icon');

                    const carTitle = document.createElement('div');
                    carTitle.classList.add('car-title');
                    carTitle.textContent = car.title;

                    // Добавляем элементы в карточку
                    carCard.appendChild(carImage);
                    carCard.appendChild(heartIcon);
                    carCard.appendChild(carTitle);

                    // Добавляем карточку в список
                    carList.appendChild(carCard);
                });
            } else {
                carList.innerHTML = 'Нет автомобилей, соответствующих фильтру';
            }
        })
        .catch(error => console.error('Ошибка:', error));
}