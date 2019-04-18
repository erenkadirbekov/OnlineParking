<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 06.03.2019
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New parking</title>
</head>
<body>
    <form action="/Admin/addParking" method="post">
        Slots: ${parking.slots}
        Owner: ${parking.owner.name} ${parking.owner.surname}
        City: ${parking.city.name}
        House: ${parking.houseNumber}
        Street: ${parking.street}
        Postal Code: ${parking.postalCode}
        Cost: ${parking.cost}

        Latitude: <input type="text" name="latitude" placeholder="Enter latitude">
        Longitude: <input type="text" name="longitude" placeholder="Enter longitude">

        <input type="hidden" name="id" value="${parking.id}">
        <button type="submit">ADD</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</body>
</html>
