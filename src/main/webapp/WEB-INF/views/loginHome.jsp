<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="max-width: 600px">
    <div class="py-5 text-center">
        <h2>홈 화면</h2>
    </div>
    <h4 class="mb-3" >로그인: ${member.name}</h4>
    <hr class="my-4">
    <div class="row">
        <div class="col">
            <button class="w-100 btn btn-secondary btn-lg" type="button"
                    onclick="location.href='/items'">
                상품 관리
            </button>
        </div>
        <div class="col">
            <form action="/logout" method="post">
                <button class="w-100 btn btn-dark btn-lg" type="submit">
                    로그아웃
                </button>
            </form>
        </div>
    </div>
    <hr class="my-4">
</div> <!-- /container -->
</body>
</html>