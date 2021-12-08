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
        <div id="realgrid" style="width: 100%; height: 300px;"></div>
        <div id="container1" style="width:100%; height:400px;"></div>
        <div id="container" style="width:100%; height:400px;"></div>
    </div>

</div> <!-- /container -->
<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<%--realgrid--%>
<script type="text/javascript" src="/resources/js/realgridjs-lic.js"></script>
<script type="text/javascript" src="/resources/js/realgridjs_eval.1.1.39.min.js"></script>
<script type="text/javascript" src="/resources/js/realgridjs-api.1.1.39.js"></script>
<script type="text/javascript" src="/resources/js/jszip.min.js"></script>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script type="text/javascript" src="/resources/js/items.js"></script>

</body>
</html>