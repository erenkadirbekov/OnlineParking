<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_parameterName" content="${_csrf.parameterName}"/>
    <title>Parking location</title>
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=54c2e55f-61d2-415d-9910-d0db37ea584f" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="/resources/js/setParkingsLocation.js" type="text/javascript"></script>
    <style>
        #map {
            width: 100%;
            height: 90%;
        }
    </style>

</head>
<body>
    <div id="map" style="
    width: 100%; height: 700px"></div>
</body>
</html>
