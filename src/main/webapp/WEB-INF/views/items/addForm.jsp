<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h2><spring:message code="page.addItem"/></h2>
    </div>

    <form:form modelAttribute="item" method="post">
        <spring:hasBindErrors name="item">
        <div>
            <c:forEach var="err" items="${errors.globalErrors}">
            <p class="field-error"><spring:message code="${err.codes[0]}" arguments="${err.arguments}"/></p>
            </c:forEach>
        </div>
        </spring:hasBindErrors>

        <div>
            <label for="itemName"><spring:message code="label.item.itemName"/></label>
            <spring:bind path="item.itemName">
            <input type="text" id="itemName" name="itemName"
                   class="form-control ${status.error ? 'field-error' : ''}" placeholder="이름을 입력하세요">
            <c:if test="${status.error}">
            <div class="field-error">
                <spring:message code="${status.errorCodes[0]}" arguments="${status.errors.getFieldError('itemName').arguments}"/>
            </div>
            </c:if>
            </spring:bind>
        </div>

        <div>
            <label for="price"><spring:message code="label.item.price"/></label>
            <spring:bind path="item.price">
            <input type="text" id="price" name="price"
                   class="form-control ${status.error ? 'field-error' : ''}" placeholder="가격을 입력하세요">
            <c:if test="${status.error}">
            <div class="field-error">
                <spring:message code="${status.errorCodes[0]}" arguments="${status.errors.getFieldError('price').arguments}" text="${status.errorMessage}"/>
            </div>
            </c:if>
            </spring:bind>

        </div>
        <div>
            <label for="quantity"><spring:message code="label.item.quantity"/></label>

            <input type="text" id="quantity" name="quantity"
                   class="form-control field-error" placeholder="수량을 입력하세요">
            <div class="field-error">
            </div>

        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <button class="w-100 btn btn-primary btn-lg" type="submit"><spring:message code="button.save"/></button>
            </div>
            <div class="col">
                <button class="w-100 btn btn-secondary btn-lg"
                        onclick="location.href='/items'"
                        type="button"><spring:message code="button.cancel"/></button>
            </div>
        </div>

    </form:form>

</div> <!-- /container -->
</body>
</html>