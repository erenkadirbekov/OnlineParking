ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map('map', {
       center: [43.2566700, 76.9286100],
       zoom: 12
    }, {
        searchControlProvider: 'yandex#search'
    });

    var placemark = new ymaps.Placemark([43.218135, 76.842955], {
        balloonContentHeader: '<a href = "/index"></a><br>' +
            '<span class="description">Something</span>',
        balloonContentBody: '<img src="img/cinema.jpg" height="150" width="200"> <br/> ' +
            '<a href="tel:+7-123-456-78-90">+7 (123) 456-78-90</a><br/>' +
            '<b>Ближайшие сеансы</b> <br/> Сеансов нет.',
        // Зададим содержимое нижней части балуна.
        balloonContentFooter: 'Информация предоставлена:<br/>OOO "Рога и копыта"',
        // Зададим содержимое всплывающей подсказки.
        hintContent: 'Рога и копыта'
    });

    myMap.geoObjects.add(placemark);

    //placemark.balloon.open();
}





