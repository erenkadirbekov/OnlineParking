ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map('map', {
        center: [43.2566700, 76.9286100],
        zoom: 12
    }, {
        searchControlProvider: 'yandex#search'
    });

    var id = $("meta[name = 'id']").attr("content");

    var myPlacemark;

    fetch('http://localhost:8080/Admin/getMarker/' + id).then(data => data.json()).then(data => {


            var coords = [data.latitude, data.longitude];
            var address = data.street + " " + data.house;
            myPlacemark = createPlacemark(coords);
            myMap.geoObjects.add(myPlacemark);
            getAddress(coords, address)

    });

    function createPlacemark(coords) {
        return new ymaps.Placemark(coords, {
            iconCaption: 'поиск...'
        }, {
            preset: 'islands#violetDotIconWithCaption',
            draggable: true
        });
    }

    // Определяем адрес по координатам (обратное геокодирование).
    function getAddress(coords, address) {
        myPlacemark.properties.set('iconCaption', 'поиск...');
        ymaps.geocode(coords).then(function (res) {
            var firstGeoObject = res.geoObjects.get(0);

            myPlacemark.properties
                .set({
                    // Формируем строку с данными об объекте.
                    iconCaption: "Адрес указанный в запросе: " + address,
                    // В качестве контента балуна задаем строку с адресом объекта.
                    balloonContent: firstGeoObject.getAddressLine()
                });
        });
    }
}