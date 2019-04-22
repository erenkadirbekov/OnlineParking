<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 18.04.2019
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New car brand or model</title>
</head>
<body>
    <c:if test="${error != null}">
        <c:choose>
            <c:when test="${error == 'exists'}">
                Such model/brand exists, please try again
            </c:when>
        </c:choose>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Error</strong> Check ${error} field
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    New car brand
    <form action="/Admin/addNewCarBrand" method="post">
        <input type="text" name="name" placeholder="enter name of the brand">
        <button type="submit">Add brand</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>

    New car model
    <form action="/Admin/addNewCarModel" method="post">
        <input type="text" name="name" placeholder="enter name of the model">
        <select name="brandId">
            <option name="notSelected" value="0">Not selected</option>
            <c:forEach var="brand" items="${brands}">
                <option value="${brand.id}">${brand.name}</option>
            </c:forEach>
        </select>
        <button type="submit">Add model</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</body>
</html>
