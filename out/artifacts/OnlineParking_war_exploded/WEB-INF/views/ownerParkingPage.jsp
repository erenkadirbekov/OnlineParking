<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/resources/css/bootstrap.css">
</head>
<body>

<h1> Welcome to Parking Page</h1>

<form action="/logout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit">Logout</button>
</form>

<a href="/Owner/ownerPage">GO Back</a>


<div>

    <label>${parking.id}</label>
    <label>${parking.city.name}</label>
    <label>${parking.street}</label>
    <label>${parking.houseNumber}</label>
    <label>${parking.cost}</label>
    <label>${parking.slots}</label>
    <label>${parking.status}</label>
    <c:forEach items="${employees}" var="employee">

        <label>${employee.name} ${employee.surname}</label>

    </c:forEach>
    <a href="/Owner/createEmployee/${parking.id}">Add employee to parking</a>
    <c:if test="${parking.status == 1}">
        <form action="/Admin/deactivateParking" method="post">
            <input type="hidden" name="parkingId" value="${parking.id}">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="btn btn-danger">Deactivate</button>
        </form>
    </c:if>
</div>




</body>
</html>
