<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html >
<head>
    <meta charset="utf-8">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container" style="max-width: 600px">
    <div class="py-5 text-center">
        <h2><spring:message code="page.items"/></h2>
    </div>

    <div class="row">
        <div class="col">
            <button class="btn btn-primary float-end"
                    onclick="location.href='/items/add'"
                    type="button"><spring:message code="page.addItem"/></button>
        </div>
    </div>

    <hr class="my-4">
    <div>
        <table class="table">
            <thead>
            <tr>
                <th><spring:message code="label.item.id"/></th>
                <th><spring:message code="label.item.itemName"/></th>
                <th><spring:message code="label.item.price"/></th>
                <th><spring:message code="label.item.quantity"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${items}">
            <tr>
                <td><a href="/items/${item.id}" >${item.id}</a></td>
                <td><a href="/items/${item.id}" >${item.itemName}</a></td>
                <td>${item.price}</td>
                <td>${item.quantity}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div> <!-- /container -->

</body>
</html>