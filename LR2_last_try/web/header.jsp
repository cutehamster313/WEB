<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.11.2017
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <fmt:setLocale value="${pageContext.request.getParameter('language').toLowerCase()}"/>
    <fmt:setBundle basename="_language"/>
</head>
<body>
<div id="header">
    <div id="line">
        <a id="title_href" href="http://localhost:8080/LR2" style="text-decoration: none">
            <h1 align="center" style="font-style: normal; font-size: 60px"> Mimimishka</h1>
        </a>
    </div>
    <br>
    <div id="language" style="float: right; margin-right: 10px">
        <img id="RU" class="languages" src="rus.jpg" width="50" height="25" onclick="setLanguage('RU')">
        <img id="EN" class="languages" src="en.png" width="50" height="25" onclick="setLanguage('EN')">
        <img id="DE" class="languages" src="de.jpg" width="50" height="25" onclick="setLanguage('DE')">
    </div>

    <button id="enter" class="button_style")>
        <fmt:message key="enter"/>
    </button>
    <button id="basket" class="button_style" onclick="forwardBasket(); return false;">
        <fmt:message key="basket"/>
    </button>
    <button id="history" class="button_style">
        <fmt:message key="history"/>
    </button>

    <%--<div style="clear: both"></div>--%>

    <div id="filter" style="float: right; margin-right: 100px; margin-top: -20px">
        <h2 id="filter_title" align="center" style="color: rgb(215, 0, 70);">
            Фильтр
        </h2>
        <select id="filter_select" style="margin-top: -18px" onchange="setFilter()" >
            <option id="All" value="All">
                Все игрушки
            </option>
            <option id="Racoon" value="Racoon">
                Енот
            </option>
            <option id="Bear" value="Bear">
                Медведь
            </option>
        </select>
    </div>
</div>
</body>
</html>
