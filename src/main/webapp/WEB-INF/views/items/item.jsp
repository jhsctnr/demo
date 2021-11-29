<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html >
<head>
    <meta charset="utf-8">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 560px;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="py-5 text-center">
        <h2><spring:message code="page.item"/></h2>
    </div>

    <!-- 추가 -->
    <c:if test="${param.status}">
    <h2>저장 완료</h2>
    </c:if>
    <div>
        <label for="itemId"><spring:message code="label.item.id"/></label>
        <input type="text" id="itemId" name="itemId" class="form-control" value="${item.id}" readonly>
    </div>
    <div>
        <label for="itemName"><spring:message code="label.item.itemName"/></label>
        <input type="text" id="itemName" name="itemName" class="form-control" value="상품A" value="${item.itemName}" readonly>
    </div>
    <div>
        <label for="price"><spring:message code="label.item.price"/></label>
        <input type="text" id="price" name="price" class="form-control" value="10000" value="${item.price}" readonly>
    </div>
    <div>
        <label for="quantity"><spring:message code="label.item.quantity"/></label>
        <input type="text" id="quantity" name="quantity" class="form-control" value="10" value="${item.quantity}" readonly>
    </div>

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <button class="w-100 btn btn-primary btn-lg"
                    onclick="location.href='/item/${item.id}/edit'"
                    type="button"><spring:message code="page.updateItem"/></button>
        </div>
        <div class="col">
            <button class="w-100 btn btn-secondary btn-lg"
                    onclick="location.href='/items'"
                    type="button"><spring:message code="button.cancel"/></button>
        </div>
    </div>

</div> <!-- /container -->
</body>
</html>