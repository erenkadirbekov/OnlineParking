<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Driver Page</title>
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=54c2e55f-61d2-415d-9910-d0db37ea584f" type="text/javascript"></script>
    <script src="/resources/js/initMap.js" type="text/javascript"></script>
    <style>
        #map {
            width: 100%;
            height: 90%;
        }
    </style>
</head>
<body>

    <h1> Welcome, Driver, ${user.surname} ${user.name}</h1>

    <div id="map" style="width: 500px; height: 400px"></div>

    <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">Logout</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Street</th>
                <th>House</th>
                <th>Cost</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${parkings}" var="park">
            <tr>
                <td>${park.id}</td>
                <td>${park.street}</td>
                <td>${park.houseNumber}</td>
                <td>${park.cost}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>




</body>
</html>
