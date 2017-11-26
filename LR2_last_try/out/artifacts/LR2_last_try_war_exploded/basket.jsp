<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="http://mimimi.com" %>

<c:set var="lang" value="${util:getLanguage(pageContext.request, pageContext.response)}"/>

<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="language"/>

<html>
<head>
    <style>
        body {
            background: rgb(255, 174, 192);
        }
    </style>
    <script>

        function hideBuyAndPriceAndFilter() {
            var price = document.getElementsByClassName("price");
            for (let i of price) {
                i.style.display = "none";
            }
            var buy = document.getElementsByClassName("buy");
            for (let i of buy) {
                i.style.display = "none";
            }
        }

        function showPrice() {
            var prices = document.getElementsByClassName("price_block");
            for (let price_of_price_block of prices) {
                const name = price_of_price_block.id.split("_")[0];
                let price_of_item = document.getElementById(name + "_price");
                price_of_item = Number(price_of_item.innerHTML.split("$")[1]);
                let count = document.getElementById(name + "_count_block");
                count = Number(count.innerHTML.split(": ")[1]);

                price_of_item *= count;
                if (price_of_price_block.innerHTML[price_of_price_block.innerHTML.length - 1] !== '$') {
                    price_of_price_block.innerHTML += "$" + price_of_item;
                }
            }
        }

        function showSummaryPrice() {
            if (${util:countCart(pageContext.request)} ===
            0
        )
            {
                $('#summary').css("display", "none");
                $('#checkoutBasket').css("display", "none");
            }
        }

        function add(item) {
            location.href = "Basket?" + item + "=1";
        }

        function reduce(item) {
            location.href = "Basket?" + item + "=-1";
        }

    </script>

</head>
<body>
<div id="square">
    <jsp:include page="header.jsp"/>

    <div id="list">

        <c:forEach items="${pageContext.session.attributeNames}" var="item">

            <c:if test="${item.toString() ne 'language' and item.toString() ne 'javax.servlet.jsp.jstl.fmt.request.charset'}">

                <c:set var="toy" value="${util:getToy(Long.parseLong(item))}" scope="request"/>
                <jsp:include page="picture.jsp"/>

                <div id="${item}_count_and_price_block" class="count_and_price_block" align="center"
                     style="width: 300px;
                        height: auto;
                        border: 2px solid rgb(215, 0, 70);
                        margin-top: 30px;
                        margin-right: 30%;
                        min-height: 50px;
                        float: right;">
                    <h4 id="${item}_count_block" class="count_block">
                        <fmt:message key="quantity"/>: ${pageContext.session.getAttribute(item)}
                    </h4>
                    <h4 id="${item}_price_block" class="price_block">
                        <fmt:message key="price"/>:
                    </h4>
                    <div id="buttons" style="display: inline">
                        <img class="add_reduce" src="images/plus.png" width="80" height="70" onclick="add('${item}')">
                        <img class="add_reduce" src="images/minus.png" width="80" height="70"
                             onclick="reduce('${item}')">
                    </div>
                </div>
                <div style="clear: both"></div>
            </c:if>
        </c:forEach>
    </div>

    <div id="summary" style="float: right; color: rgb(215, 0, 70); margin-right: 5%;">
        <h1>
            <fmt:message key="total_cost"/>: $${util:countCart(pageContext.request)}
        </h1>
    </div>

    <div id="checkoutBasket" onclick="location.href='Checkout'" class="button_style"
         style="float: left; margin-left: 5%">
        <fmt:message key="checkout"/>
    </div>
</div>
<script>
    hideBuyAndPriceAndFilter();
    showPrice();
    showSummaryPrice();
</script>
</body>
</html>
