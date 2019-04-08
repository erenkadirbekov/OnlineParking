ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map('map', {
        center: [43.2566700, 76.9286100],
        zoom: 12
    }, {
        searchControlProvider: 'yandex#search'
    });

    myMap.events.add('click', function (e) {
        if (!myMap.balloon.isOpen()) {
            var coords = e.get('coords');
            var token = $("meta[name='_csrf']").attr("content");
            var parameterName = $("meta[name='_csrf_parameterName']").attr("content");
            myMap.balloon.open(coords, {
                contentHeader:'Вы выбрали!',
                contentBody:`<form action="/Owner/parkingLocation" method="post">
                    <input type="hidden" name="latitude" value="${coords[0]}">
                    <input type="hidden" name="longitude" value="${coords[1]}">
                    <input type="hidden" name="${parameterName}" value="${token}" />
                    <button type="submit">Потвердить</button>
                </form>`,
                contentFooter:'footer'
            });
        }
        else {
            myMap.balloon.close();
        }
    });
}