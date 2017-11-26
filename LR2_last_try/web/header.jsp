<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="http://mimimi.com" %>

<html>
<head>
    <fmt:setLocale value="${util:getLanguage(pageContext.request, pageContext.response)}"/>
    <fmt:setBundle basename="language"/>
    <link href="styles/header.css" rel="stylesheet" type="text/css">
</head>
<body onload="init('${util:getUserName(pageContext.request)}', ${util:countCart(pageContext.request)})">
<div id="header">
    <div id="line">
        <a id="title_href" href="LR2" style="text-decoration: none">
            <h1 align="center" style="font-style: normal; font-size: 60px"> Mimimishka</h1>
        </a>
    </div>
    <br>
    <div id="language" style="float: right; margin-right: 10px">
        <img id="RU" class="languages" src="images/rus.jpg" width="50" height="25" onclick="setLanguage('RU')">
        <img id="EN" class="languages" src="images/en.png" width="50" height="25" onclick="setLanguage('EN')">
        <img id="DE" class="languages" src="images/de.jpg" width="50" height="25" onclick="setLanguage('DE')">
    </div>

    <button id="enter" class="button_style" onclick="location.href='Profile'">
        <div id="loggedIn" style="display: none"><fmt:message
                key="hello"/> ${util:getUserName(pageContext.request)} </div>
        <div id="loggedOut" style="display: none"><fmt:message key="signin"/></div>
    </button>
    <button id="singout" class="button_style" onclick="logout()">
        <fmt:message key="signout"/>
    </button>
    <button id="basket" class="button_style" onclick="location.href='Basket'">
        <fmt:message key="basket"/>
    </button>
    <button id="checkout" class="button_style" onclick="location.href='Checkout'">
        <fmt:message key="checkout"/>
    </button>

</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="scripts/header.js"></script>
</body>
</html>
