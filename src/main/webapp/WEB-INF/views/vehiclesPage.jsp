<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Тынышбай Нуржан
  Date: 03.05.2019
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vehicles</title>
</head>
<body>
<script type="text/javascript">
    $('select.brand').select({
        ajax: {
            url: '/Driver/'
        }
    })
    $(document).ready(function () {
        $("#brand").change(function () {
            var modelSelect = $("#model");
            $.ajax({
                type: 'GET',
                url: '/Driver/getModels/' + $(this).children("option:selected").val()
            }).then(function (data) {
                data.forEach(model => {
                    var option = new Option(data.name, data.id, false, false);
                    modelSelect.appendChild(option);
                });
            });
        });
    });
</script>
    <table>
        <thead>
        <tr>
            <th>Brand</th>
            <th>Model</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="driverCar" items="${driverCars}">
            <tr>
                <td>
                    ${driverCar.brand.name}
                </td>
                <td>
                        ${driverCar.model.name}
                </td>
                <td>
                    <form action="/Driver/deleteUserCar" method="post">
                        <input type="hidden" name="carId" value="${driverCar.id}">
                        <button type="submit">Delete</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form action="/" method="post">
        <select id="brand">
            <option value="-1">Choose brand</option>
            <c:forEach items="${brands}" var="brand">
                <option value="${brand.id}">${brand.name}</option>
            </c:forEach>
        </select>
        <select id="model">

        </select>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</body>
</html>
