<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CreateParkingPage</title>
</head>
<body>

<form method="post" action="/Owner/createParking">

    <input type="number" name="slots" placeholder="Num of Slots">
    <input type="number" name="cost" placeholder="Cost">
    <input type="text" name="house" placeholder="House">
    <input type="text" name="street" placeholder="Street">
    <input type="text" name="postal" placeholder="Postal Code">
    <select name="city">
        <c:forEach items="${cities}" var="city">
            <option value="${city.id}">${city.name}</option>
        </c:forEach>
    </select>


</form>


</body>
</html>
