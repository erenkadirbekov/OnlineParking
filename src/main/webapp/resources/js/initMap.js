ymaps.ready(init);


function init() {
    var geolocation = ymaps.geolocation;
        var myMap = new ymaps.Map('map', {
            center: [43.2566700, 76.9286100],
            zoom: 12
        }, {
            searchControlProvider: 'yandex#search'
        });

    // Сравним положение, вычисленное по ip пользователя и
    // положение, вычисленное средствами браузера.
    geolocation.get({
        provider: 'yandex',
        mapStateAutoApply: true
    }).then(function (result) {
        // Красным цветом пометим положение, вычисленное через ip.
        result.geoObjects.options.set('preset', 'islands#redCircleIcon');
        result.geoObjects.get(0).properties.set({
            balloonContentBody: 'Мое местоположение'
        });
        myMap.geoObjects.add(result.geoObjects);
    });

    geolocation.get({
        provider: 'browser',
        mapStateAutoApply: true
    }).then(function (result) {
        // Синим цветом пометим положение, полученное через браузер.
        // Если браузер не поддерживает эту функциональность, метка не будет добавлена на карту.
        result.geoObjects.options.set('preset', 'islands#blueCircleIcon');
        result.geoObjects.get(0).properties.set({
            balloonContentBody: 'Мое местоположение'
        });
        myMap.geoObjects.add(result.geoObjects);
    });
    fetch('http://localhost:8080/Driver/getMarkers').then(data => data.json()).then(data => {
        var geoCode = new ymaps.geoCoordSystem(50, 23);
        geolocation.get({
            provider: 'browser',
            mapStateAutoApply: true
        }).then(function (result) {
            // Синим цветом пометим положение, полученное через браузер.
            // Если браузер не поддерживает эту функциональность, метка не будет добавлена на карту.
            console.log(result)
            data.forEach(marker => {
                var m = new ymaps.Placemark([marker.latitude, marker.longitude], {
                    balloonContentHeader: '<a href = "/index"></a><br>' +
                        '<span class="description">' + marker.street + ' ' + marker.houseNumber + '</span>',
                    balloonContentBody: '<img src="img/cinema.jpg" height="150" width="200"> <br/> ' +
                        '<a href="distance from your location: "></a><br/>' +
                        '<b>Cost</b> <br/>' + marker.cost + ' tenge',
                    // Зададим содержимое нижней части балуна.
                    balloonContentFooter: 'Информация предоставлена:<br/>OOO "Рога и копыта"',
                    // Зададим содержимое всплывающей подсказки.
                    hintContent: 'Рога и копыта'
                });
                myMap.geoObjects.add(m);
            })
            result.geoObjects.options.set('preset', 'islands#blueCircleIcon');
            myMap.geoObjects.add(result.geoObjects);
        }).catch((error) => {
             console.log(error)
        });
    });


}






