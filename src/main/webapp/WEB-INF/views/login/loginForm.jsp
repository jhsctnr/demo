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
        <h2>로그인</h2>
    </div>
    <form:form modelAttribute="loginForm" method="post">
        <spring:hasBindErrors name="item">
            <div>
                <c:forEach var="err" items="${errors.globalErrors}">
                    <p class="field-error"><spring:message code="${err.codes[0]}" arguments="${err.arguments}" text="${err.defaultMessage}"/></p>
                </c:forEach>
            </div>
        </spring:hasBindErrors>
        <div>
            <label for="loginId">로그인 ID</label>
            <spring:bind path="loginForm.loginId">
            <input type="text" id="loginId" name="loginId" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}" />
            <c:if test="${status.error}">
            <div class="field-error">
                <form:errors path="loginId"/>
            </div>
            </c:if>
            </spring:bind>
        </div>
        <div>
            <label for="password">비밀번호</label>
            <spring:bind path="loginForm.password">
            <input type="password" id="password" name="password" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}">
            <c:if test="${status.error}">
                <div class="field-error">
                    <form:errors path="password"/>
                </div>
            </c:if>
            </spring:bind>
        </div>
        <hr class="my-4">
        <div class="row">
            <div class="col">
                <button class="w-100 btn btn-primary btn-lg" type="submit">
                    로그인</button>
            </div>
            <div class="col">
                <button class="w-100 btn btn-secondary btn-lg"
                        onclick="location.href='/'"
                        type="button">취소</button>
            </div>
        </div>
    </form:form>
</div> <!-- /container -->
</body>
</html>