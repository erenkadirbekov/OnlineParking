<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 30.03.2019
  Time: 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Location of parking</title>
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=54c2e55f-61d2-415d-9910-d0db37ea584f" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="/resources/js/showSingleParkingsLocation.js" type="text/javascript"></script>
    <meta name="id" content="${parking.id}">
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
    <form action="/Admin/addParking" method="post">
        <input type="hidden" name="id" value="${parking.id}">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">Принять и добавить</button>
    </form>
    <br>
    <a class="btn btn-primary" href="/Admin/requests">Вернуться</a>
</body>
</html>
