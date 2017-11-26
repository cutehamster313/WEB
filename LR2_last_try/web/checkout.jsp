<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="utils" uri="http://mimimi.com" %>

<html>
<head>
    <style>
        body {
            background: rgb(255, 174, 192);
        }

        #square {
            width: 74%;
            background: white;
            margin: 5% 13% 7%;
            overflow: hidden;
            padding-bottom: 5%;
        }
    </style>

    <meta charset="utf-8">
    <c:set var="lang" value="${utils:getLanguage(pageContext.request, pageContext.response)}"/>

    <fmt:setLocale value="${lang}"/>
    <fmt:setBundle basename="language"/>
</head>
<body>

<div id="square">
    <jsp:include page="header.jsp"/>


    <div>
        <h2><fmt:message key="list_of"/></h2>

        <table>
            <tr>
                <th><fmt:message key="product_name"/></th>
                <th><fmt:message key="product_quanity"/></th>
            </tr>
            <c:forEach items="${pageContext.session.attributeNames}" var="item">
                <tr>
                    <c:set var="product" value="${utils:getToyByString(item)}"/>
                    <c:if test="${product ne null}">
                        <td>${product.getToyLanguage(lang).name}</td>
                        <td>${pageContext.session.getAttribute(item)}</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div>
        <div>
            <div class="button_style" id="order_pickup_switcher" onClick="showPickup()"><fmt:message
                    key="pickup"/></div>
            <div class="button_style" id="order_delivery_switcher" onClick="showDelivery()"><fmt:message
                    key="delivery"/></div>
        </div>

        <div id="pickup"
             style="display: flex; flex-direction: column; justify-content: flex-start;align-items: flex-start;">

            <select id="choose_shop_list" onchange="changedList()" style="margin-bottom: 10px">
                <option value="-1" disabled selected><fmt:message key="choose_shop"/></option>
                <c:forEach items="${utils:getShops()}" var="shop">
                    <option value="${shop.id}">${shop.name}</option>
                </c:forEach>
            </select>

            <div id="map" style="width: 400px; height: 400px;"></div>

            <c:forEach items="${utils:getShops()}" var="shop">
                <div class="shopId" style="display: none">${shop.id}</div>
                <div id="name${shop.id}" style="display: none">${shop.name}</div>
                <div id="x${shop.id}" style="display: none">${shop.coordinateX}</div>
                <div id="y${shop.id}" style="display: none">${shop.coordinateY}</div>
            </c:forEach>

        </div>
        <div id="delivery">
            <p><fmt:message key="input_address"/><br>
                <textarea id="input_address_delivery" onkeyup="checkButtonInDelivery()" cols="40" rows="3"></textarea>
            </p>
        </div>

    </div>

    <div id="summary" style="float: right; color: rgb(215, 0, 70); margin-right: 5%;">
        <h1>
            <fmt:message key="total_cost"/>: $${utils:countCart(pageContext.request)}
        </h1>
    </div>

    <div id="order_buy_btn" onclick="buyTickets()" class="button_style" style="float: left; margin-left: 5%">
        <fmt:message key="buy"/>
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
    <script type="text/javascript" src="scripts/checkout.js"></script>
</div>
</body>
</html>