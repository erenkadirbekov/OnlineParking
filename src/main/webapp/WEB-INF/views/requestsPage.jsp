<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 06.03.2019
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Requests</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Slots</th>
                <th>Owner</th>
                <th>City</th>
                <th>House number</th>
                <th>Street</th>
                <th>Postal code</th>
                <th>Cost</th>
                <th>Show in map</th>
                <th>Confirm</th>
                <th>Reject</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${parkings}" var="parking">
                <tr>
                    <td>${parking.slots}</td>
                    <td>${parking.owner.name} ${parking.owner.surname}</td>
                    <td>${parking.city.name}</td>
                    <td>${parking.houseNumber}</td>
                    <td>${parking.street}</td>
                    <td>${parking.postalCode}</td>
                    <td>${parking.cost}</td>
                    <td><a href="/Admin/parkingLocation/${parking.id}" class="btn btn-primary">Confirm</a></td>
                    <td>
                        <form action="/Admin/addParking" method="post">
                            <input type="hidden" name="id" value="${parking.id}">
                            <button type="submit" class="btn btn-primary">Confirm</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </td>
                    <td>
                        <form action="/Admin/rejectRequest" method="post">
                            <input type="hidden" name="id" value="${parking.id}">
                            <button type="submit" class="btn btn-danger">Reject</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
