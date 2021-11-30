<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
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
        <h2>회원 가입</h2>
    </div>
    <h4 class="mb-3">회원 정보 입력</h4>

    <form:form modelAttribute="member" method="post">
        <spring:hasBindErrors name="member">
        <div>
            <c:forEach var="err" items="${errors.globalErrors}">
            <p class="field-error"><spring:message text="${err.defaultMessage}"/></p>
            </c:forEach>
        </div>
        </spring:hasBindErrors>
        <div>
            <label for="loginId">로그인 ID</label>
            <spring:bind path="member.loginId">
            <input type="text" id="loginId" name="loginId" class="form-control ${status.error ? 'field-error' : ''}" value="${status.value}">
            <c:if test="${status.error}">
            <div class="field-error">
                <form:errors path="loginId"/>
            </div>
            </c:if>
            </spring:bind>
        </div>
        <div>
            <label for="password">비밀번호</label>
            <spring:bind path="member.password">
            <input type="password" id="password" name="password" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}">
            <c:if test="${status.error}">
            <div class="field-error">
                <form:errors path="password"/>
            </div>
            </c:if>
            </spring:bind>
        </div>
        <div>
            <label for="name">이름</label>
            <spring:bind path="member.name">
            <input type="text" id="name" name="name" value="${status.value}"
                   class="form-control ${status.error ? 'field-error' : ''}">
            <div class="field-error" >
                <form:errors path="name"/>
            </div>
            </spring:bind>
        </div>
        <hr class="my-4">
        <div class="row">
            <div class="col">
                <button class="w-100 btn btn-primary btn-lg" type="submit">회원 가입</button>
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