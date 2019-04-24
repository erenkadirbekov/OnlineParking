<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 22.04.2019
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> My employees</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Name and Surname</th>
                <th>Parking</th>
                <th>Change workplace</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="employee" items="${employees}">
                <tr>
                    <td>${employee.name} ${employee.surname}</td>
                    <td>${employee.employeesParking.city.name}, ${employee.employeesParking.street}, ${employee.employeesParking.houseNumber}</td>
                    <td><a href="/Owner/editEmployeePage/${employee.id}">Change workplace</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>>
</body>
</html>
