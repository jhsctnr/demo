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
        .field-error {
            border-color: #dc3545;
            color: #dc3545;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="py-5 text-center">
        <h2><spring:message code="page.updateItem"/></h2>
    </div>

    <form:form modelAttribute="item" method="post">
        <spring:hasBindErrors name="item">
        <div>
            <c:forEach var="err" items="${errors.globalErrors}">
            <p class="field-error"><spring:message code="${err.codes[0]}" arguments="${err.arguments}" text="${err.defaultMessage}"/></p>
            </c:forEach>
        </div>
        </spring:hasBindErrors>


        <div>
            <label for="id"><spring:message code="label.item.id"/></label>
            <input type="text" id="id" name="id" value="${item.id}" class="form-control" readonly>
        </div>
        <div>
            <label for="itemName"><spring:message code="label.item.itemName"/></label>
            <spring:bind path="item.itemName">
            <input type="text" id="itemName" name="itemName" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}" placeholder="이름을 입력하세요">
            <c:if test="${status.error}">
            <div class="field-error">
                <form:errors path="itemName"/>
            </div>
            </c:if>
            </spring:bind>
        </div>
        <div>
            <label for="price"><spring:message code="label.item.price"/></label>
            <spring:bind path="item.price">
            <input type="text" id="price" name="price" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}" placeholder="가격을 입력하세요">
            <c:if test="${status.error}">
            <div class="field-error">
                <form:errors path="price"/>
            </div>
            </c:if>
            </spring:bind>
        </div>
        <div>
            <label for="quantity"><spring:message code="label.item.quantity"/></label>
            <spring:bind path="item.quantity">
            <input type="text" id="quantity" name="quantity" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}" placeholder="수량을 입력하세요">
            <c:if test="${status.error}">
            <div class="field-error">
                <form:errors path="quantity"/>
            </div>
            </c:if>
            </spring:bind>
        </div>

        <hr class="my-4">

        <!--        single checkbox-->
        <div>판매 여부</div>
        <div>
            <div class="form-check">
                <input type="checkbox" id="open" name="open" class="form-check-input" ${item.open ne null ? 'checked' : ''}>
                <label for="open" class="form-check-label">판매 오픈</label>
                <input type="hidden" name="_open" value="on"/>
            </div>
        </div>

        <!-- multi checkbox -->
        <div>
            <div>등록 지역</div>
            <c:forEach var="region" items="${regions}" varStatus="status">
                <div class="form-check form-check-inline">
                    <input type="checkbox" id="regions${status.count}" name="regions" value="${region.key}" ${selectedRegion.contains(region.key) ? 'checked' : ''}
                           class="form-check-input">
                    <label class="form-check-label" for="regions${status.count}">${region.value}</label>
                </div>
            </c:forEach>
            <input type="hidden" name="_regions" value="on"/>
        </div>

        <!-- radio button -->
        <div>
            <div>상품 종류</div>
            <c:forEach var="type" items="${itemTypes}" varStatus="status">
                <div class="form-check form-check-inline">
                    <input type="radio" id="itemType${status.count}" name="itemType" value="${type.name()}" ${item.itemType eq type.name() ? 'checked' : ''}
                           class="form-check-input">
                    <label class="form-check-label" for="itemType${status.count}">${type.description}</label>
                </div>
            </c:forEach>
        </div>

        <!-- SELECT -->
        <div>
            <div>배송 방식</div>
            <select name="deliveryCode" class="form-select">
                <option value="">==배송 방식 선택==</option>
                <c:forEach var="deliveryCode" items="${deliveryCodes}">
                    <option value="${deliveryCode.name()}" ${item.deliveryCode eq deliveryCode.name() ? 'selected' : ''}>${deliveryCode.description}</option>
                </c:forEach>
            </select>
        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <button class="w-100 btn btn-primary btn-lg" type="submit"><spring:message code="button.save"/></button>
            </div>
            <div class="col">
                <button class="w-100 btn btn-secondary btn-lg"
                        onclick="location.href='/items/${itemId}'"
                        type="button"><spring:message code="button.cancel"/></button>
            </div>
        </div>
    </form:form>

</div> <!-- /container -->
</body>
</html>