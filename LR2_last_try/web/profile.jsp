<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="utils" uri="http://mimimi.com" %>

<html>
<head>

    <meta charset="utf-8">
    <c:set var="lang" value="${utils:getLanguage(pageContext.request, pageContext.response)}"/>

    <fmt:setLocale value="${lang}"/>
    <fmt:setBundle basename="language"/>
</head>
<body>
<div id="square">
    <jsp:include page="header.jsp"/>

    <div id="time"></div>

    <h2><fmt:message key="your_orders"/></h2>

    <table>
        <tr>
            <th><fmt:message key="order_id"/></th>
            <th><fmt:message key="order_structure"/></th>
            <th><fmt:message key="order_date"/></th>
            <th><fmt:message key="order_delivery_method"/></th>
        </tr>
        <c:forEach items="${utils:getOrders(pageContext.request)}" var="order">
            <tr>
                <td>${order.id}</td>
                <td>
                    <ul>
                        <c:forEach items="${order.details}" var="detail">
                            <li>
                                "${detail.toy.getToyLanguage(lang).name}" x ${detail.quanity}
                            </li>
                        </c:forEach>
                    </ul>
                </td>
                <td>${utils:formatDate(order.date)}</td>
                <td>${order.getDeliveryMethod()}</td>
            </tr>
        </c:forEach>
    </table>


    <div class="block">

        <h2><fmt:message key="your_comments"/></h2>

        <div id="comments">

        </div>

        <p><fmt:message key="add_comment"/><br>
            <textarea id="input_comment" cols="40" rows="3"></textarea>
        <div class="button" id="add_comment_btn" onclick="addComment()">
            <fmt:message key="add_comment"/>
        </div>
    </div>
</div>
<script type="text/javascript" src="scripts/profile.js"></script>
</body>
</html>
