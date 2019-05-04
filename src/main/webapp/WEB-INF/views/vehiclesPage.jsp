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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
    $(document).ready(function () {
        $('#brand').change(function () {
            var $modelSelect = $('#model');
            var $selectedOptionValue = $(this).children("option:selected").val();
            /*fetch("http://localhost:8080/Driver/getModels/" + $(this).children("option:selected").val()).then(data => data.json()).then(data => {
                data.forEach(model => {
                    $modelSelect.append('<option value=' + model.id + '>' + model.name + '</option>');
                });
            });*/
            if ($selectedOptionValue === "-1") {
                $modelSelect.empty();
            }
            else {
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:8080/Driver/getModels/' + $(this).children("option:selected").val(),
                    dataType: 'json',
                    success: function (data) {
                        $modelSelect.empty();
                        $.each(data, function(index, model) {
                            $modelSelect.append('<option value=' + model.id + '>' + model.name + '</option>');
                        });
                    }
                });
            }

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
    <label>Add new car</label>
    <form action="/Driver/addUserCar" method="post">
        Brand: <select id="brand" name="brandId">
            <option value="-1">Choose brand</option>
            <c:forEach items="${brands}" var="brand">
                <option value="${brand.id}">${brand.name}</option>
            </c:forEach>
        </select>
        Model: <select id="model" name="modelId" />
        <input type="hidden" name="userId" value="${user.id}">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">Add</button>
    </form>
</body>
</html>
