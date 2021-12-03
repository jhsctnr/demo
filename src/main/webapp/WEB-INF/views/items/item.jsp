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
        <input type="text" id="itemName" name="itemName" class="form-control" value="${item.itemName}" readonly>
    </div>
    <div>
        <label for="price"><spring:message code="label.item.price"/></label>
        <input type="text" id="price" name="price" class="form-control" value="${item.price}" readonly>
    </div>
    <div>
        <label for="quantity"><spring:message code="label.item.quantity"/></label>
        <input type="text" id="quantity" name="quantity" class="form-control" value="${item.quantity}" readonly>
    </div>

    <hr class="my-4">

    <!--        single checkbox-->
    <div>판매 여부</div>
    <div>
        <div class="form-check">
            <input type="checkbox" id="open" name="open" class="form-check-input"
                   ${item.open ne null ? 'checked' : ''}
                   disabled>
            <label for="open" class="form-check-label">판매 오픈</label>
        </div>
    </div>

    <!-- multi checkbox -->
    <div>
        <div>등록 지역</div>
        <c:forEach var="region" items="${regions}" varStatus="status">
            <div class="form-check form-check-inline">
                <input type="checkbox" id="regions${status.count}" name="regions" value="${region.key}" ${selectedRegion.contains(region.key) ? 'checked' : ''}
                       class="form-check-input" disabled>
                <label class="form-check-label" for="regions${status.count}">${region.value}</label>
            </div>
        </c:forEach>
    </div>

    <!-- radio button -->
    <div>
        <div>상품 종류</div>
        <c:forEach var="type" items="${itemTypes}" varStatus="status">
            <div class="form-check form-check-inline">
                <input type="radio" id="itemType${status.count}" name="itemType" value="${type.name()}" ${item.itemType eq type.name() ? 'checked' : ''}
                       class="form-check-input" disabled>
                <label class="form-check-label" for="itemType${status.count}">${type.description}</label>
            </div>
        </c:forEach>
    </div>

    <!-- SELECT -->
    <div>
        <div>배송 방식</div>
        <select name="deliveryCode" class="form-select" disabled>
            <option value="">==배송 방식 선택==</option>
            <c:forEach var="deliveryCode" items="${deliveryCodes}">
                <option value="${deliveryCode.name()}" ${item.deliveryCode eq deliveryCode.name() ? 'selected' : ''}>${deliveryCode.description}</option>
            </c:forEach>
        </select>
    </div>

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <button class="w-100 btn btn-primary btn-lg"
                    onclick="location.href='/items/${item.id}/edit'"
                    type="button"><spring:message code="page.updateItem"/></button>
        </div>
        <div class="col">
            <form action="/items/delete" method="post">
                <input type="hidden" name="itemId" value="${item.id}"/>
                <button class="w-100 btn btn-primary btn-lg"
                        type="submit"><spring:message code="button.delete"/></button>
            </form>
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