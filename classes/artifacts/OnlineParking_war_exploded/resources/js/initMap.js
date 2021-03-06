ymaps.ready(init);


function init() {
        var myMap = new ymaps.Map('map', {
            center: [43.2566700, 76.9286100],
            zoom: 12
        }, {
            searchControlProvider: 'yandex#search'
        });
    fetch('http://localhost:8080/Driver/getMarkers').then(data => data.json()).then(data => {

        data.forEach(marker => {
            var m = new ymaps.Placemark([marker.latitude, marker.longitude], {
                balloonContentHeader: '<a href = "/index"></a><br>' +
                    '<span class="description">' + marker.street + ' ' + marker.houseNumber + '</span>',
                balloonContentBody:
                    '<a href="tel:+7-123-456-78-90">+7 (123) 456-78-90</a><br/>' +
                    '<b>Cost</b> <br/>' + marker.cost + ' tenge <br/> <a href="/Driver/chosenParking?id='+marker.id+'">Open</a>'
                ,
                // Зададим содержимое нижней части балуна.
                balloonContentFooter: 'Информация предоставлена:<br/>Online Parking',
                // Зададим содержимое всплывающей подсказки.
                hintContent: 'Online Parking'
            });
            myMap.geoObjects.add(m);
        })
    });


}






