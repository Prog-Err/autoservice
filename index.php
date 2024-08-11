<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Автосервис</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="preload" href="/icons/Search.svg" as="image">
    <link rel="preload" href="/icons/SearchHover.svg" as="image">
    <link rel="preload" href="/icons/SearchActive.svg" as="image">
</head>

<body>
    <header class="header">
        <div class="header-content">
            <img src="/icons/Car.svg" alt="Выберите автомобиль" class="header-icon">
            <span class='text'>Выберите автомобиль</span>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="sidebar">
                <div class="filter-box selected " data-filter="all" title='Все автомобили'>
                    <div class="filter-icon all-icon"></div>
                </div>
                <div class="filter-box" data-filter="hatchback" title='Хэтчбек'>
                    <div class="filter-icon hatchback-icon"></div>
                </div>
                <div class="filter-box" data-filter="sedan" title='Седан'>
                    <div class="filter-icon sedan-icon"></div>
                </div>
                <div class="filter-box " data-filter="jeep" title='Джип'>
                    <div class="filter-icon jeep-icon"></div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div id="selectedFilter">Все автомобили</div>
                    <span class="close-button"></span>
                </div>
                <div class="search-box">
                    <input type="text" id="searchInput" placeholder="Поиск">
                </div>
                <div id="carList">
                    <!-- <div class="car-card">
                        <img src="/catalog/jeep/9.webp" alt="Автомобиль 1" class="car-image">
                        <div class="heart-icon"></div>
                        <div class="car-title">Название автомобиля 1</div>
                    </div> -->
                </div>
            </div>
        </div>
    </main>


    <script src="index.js"></script>
</body>

</html>