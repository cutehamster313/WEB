<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <c:set var="characteristics_ru" value="${[['Енотик', 'enot1.jpg', 'Милый енотик станет отличным другом для Вас или Вашего ребенка!', '15$'],
                                            ['Белый Мишка', 'white_bear.jpg', 'Улыбчивый белый мишка подарит Вам солнечное настроение!', '10$'],
                                            ['Розовый Мишка', 'pink_bear.jpg', 'Розовый мишка станет отличным признанием в Ваших чувствах!', '13$']]}"/>
    <c:set var="characteristics_en" value="${[['Racoon', 'enot1.jpg', 'A cute racoon will be a great friend for you or your child!', '15$'],
                                            ['White Bear', 'white_bear.jpg', 'Smiling white bear will give you a sunny mood!', '10$'],
                                            ['Pink Bear', 'pink_bear.jpg', 'Lächelnder weißer Bär gibt Ihnen eine sonnige Stimmung!', '13$']]}"/>
    <c:set var="characteristics_de" value="${[['Waschbär', 'enot1.jpg', 'Ein niedlicher Waschbär wird ein großer Freund für Sie oder Ihr Kind sein!', '15$'],
                                            ['Weißer Bär', 'white_bear.jpg', 'Lächelnder weißer Bär gibt Ihnen eine sonnige Stimmung!', '10$'],
                                            ['Rosa Bär', 'pink_bear.jpg', 'Rosa Bär wird eine große Anerkennung Ihrer Gefühle sein!', '13$']]}"/>
    <c:set var="language" value="${pageContext.request.getParameter('language').toLowerCase()}" scope="request"/>
    <fmt:setLocale value="${pageContext.request.getParameter('language').toLowerCase()}"/>
    <fmt:setBundle basename="_language"/>

    <style>
        body {
            background: rgb(255, 174, 192);
        }

        #square{
            width: 74%;
            background: white;
            margin-top: 5%;
            margin-left:  13%;
            margin-right: 13%;
            margin-bottom: 7%;
            overflow: hidden;
            padding-bottom: 5%;
        }

        #line{
            width: 100%;
            height: 80px;
            background: rgb(215, 0, 70);
            margin-top: -4%;
        }

        .button_style {
            margin-left: 18px;
            border: 0;
            background: lightgrey;
            width: 125px;
            height: 25px;
        }
        .button_style:hover {
            background: rgb(255, 174, 192);
        }

        .button_style:active {
            background: rgb(215, 0, 70);
        }

        .languages{
            margin-right: 15px;
        }

        .languages:hover{
            cursor: pointer;
        }

    </style>
    <script>
        function setLanguage(param) {
            if (param === undefined){
                param = '${pageContext.request.getParameter("language") == null ?
              pageContext.request.getAttribute("language") : pageContext.request.getParameter("language")}';
            }
            var items = document.getElementsByClassName("picture");
            for (var i of items){
                if (i.id.indexOf (param.toUpperCase()) === -1){
                    i.style.display = 'none';
                }
                else {
                    i.style.display = "block";
                }
            }
            switch(param.toUpperCase()){
                case 'RU':{
                    document.getElementById("enter").innerHTML = "Вход";
                    document.getElementById("basket").innerHTML = "Корзина";
                    document.getElementById("history").innerHTML = "История покупок";
                    document.getElementById("filter_title").innerHTML = "Фильтр";
                    document.getElementById("Racoon").innerHTML = "Еноты";
                    document.getElementById("Bear").innerHTML = "Медведи";
                    document.getElementById("All").innerHTML = "Все игрушки";
                    document.getElementById("RU").style = 'border: 3px black solid; margin-right: 15px';
                    document.getElementById("EN").style = 'border: 0px; margin-right: 15px';
                    document.getElementById("DE").style = 'border: 0px; margin-right: 15px';
                    break;
                }
                case 'EN':{
                    document.getElementById("enter").innerHTML = "Enter";
                    document.getElementById("basket").innerHTML = "Basket";
                    document.getElementById("history").innerHTML = "Purchase history";
                    document.getElementById("filter_title").innerHTML = "Filter";
                    document.getElementById("Racoon").innerHTML = "Racoons";
                    document.getElementById("Bear").innerHTML = "Bears";
                    document.getElementById("All").innerHTML = "All toys";
                    document.getElementById("RU").style = 'border: 0px; margin-right: 15px';
                    document.getElementById("EN").style = 'border: 3px black solid; margin-right: 15px';
                    document.getElementById("DE").style = 'border: 0px; margin-right: 15px';
                    break;
                }
                case 'DE':{
                    document.getElementById("enter").innerHTML = "Eingang";
                    document.getElementById("basket").innerHTML = "Warenkorb";
                    document.getElementById("history").innerHTML = "Kaufhistorie";
                    document.getElementById("filter_title").innerHTML = "Filter";
                    document.getElementById("Racoon").innerHTML = "Waschbären";
                    document.getElementById("Bear").innerHTML = "Bären";
                    document.getElementById("All").innerHTML = "All toys";
                    document.getElementById("RU").style = 'border: 0px; margin-right: 15px';
                    document.getElementById("EN").style = 'border: 0px; margin-right: 15px';
                    document.getElementById("DE").style = 'border: 3px black solid; margin-right: 15px';
                    break;
                }
            }
            language = param;
        }

        function hideBuyAndPriceAndFilter() {
            var price = document.getElementsByClassName("price");
            for (let i of price){
                i.style.display = "none";
            }
            var buy = document.getElementsByClassName("buy");
            for (let i of buy){
                i.style.display = "none";
            }
            document.getElementById("filter").style.display = "none";
        }

        function showPrice() {
            var prices = document.getElementsByClassName("price_block");
            for (let price_of_price_block of prices){
                const name = price_of_price_block.id.split("_")[0];
                let price_of_item = document.getElementById(name + "_price");
                price_of_item = Number(price_of_item.innerHTML.split("$")[0].split(": ")[1]);
                let count = document.getElementById(name + "_count_block_" + "${language}");
                count = Number(count.innerHTML.split(": ")[1]);

                price_of_item *= count;
                if (price_of_price_block.innerHTML[price_of_price_block.innerHTML.length - 1] !== '$'){
                    price_of_price_block.innerHTML += price_of_item + "$";
                }
            }
        }

        function showSummaryPrice() {
            var price_blocks = document.getElementsByClassName("price_block");
            var sum = 0;
            for (let i of price_blocks){
                sum += Number(i.innerHTML.split(":")[1].split("$")[0]);
            }
            if (sum !== 0){
                let summary_block = document.getElementById("summary").innerHTML;
                let before = summary_block.split(":")[1];
                let after = " " + sum + "$" + before;
                document.getElementById("summary").innerHTML = summary_block.replace(before, after);
                document.getElementById("summary").style.display = "block";
                console.log(sum);
            }
        }

        function add(item) {
            location.href = "http://localhost:8080/Basket?language=" + '${language}' + "&" + item + "=1";
        }

        function reduce(item) {
            location.href = "http://localhost:8080/Basket?language=" + '${language}' + "&" + item + "=-1";
        }

        function forwardBasket(name){
            if (name === undefined)
                location.href = "http://localhost:8080/Basket?language=" + '${language}';
            else
                location.href = "http://localhost:8080/Basket?language=" + '${language}' + "&" + name + "=1";
        }

    </script>

</head>
<body>
<div id="square">
    <c:import url="header.jsp">
        <c:param name="language" value="${pageContext.request.getParameter('language').toLowerCase()}"/>
    </c:import>

    <div id="list">
        <c:set var="index" value="0"/>
        <%--<c:forEach items="${pageContext.session.attributeNames}" var="item">
            ${item}<br>
        </c:forEach>--%>
        <c:forEach items="${pageContext.session.attributeNames}" var="item">
            <c:choose>
                <c:when test="${item.toString() eq characteristics_en[0][0]}">
                    <c:set var="index" value="0"/>
                </c:when>
                <c:when test="${item.toString() eq characteristics_en[1][0]}">
                    <c:set var="index" value="1"/>
                </c:when>
                <c:when test="${item.toString() eq characteristics_en[2][0]}">
                    <c:set var="index" value="2"/>
                </c:when>
            </c:choose>
            <c:if test="${item.toString() ne 'language' and item.toString() ne 'javax.servlet.jsp.jstl.fmt.request.charset'}">
                <c:choose>
                    <c:when test="${'characteristics_ru'.indexOf(language) ne -1}">
                        <c:import url="picture.jsp">
                            <c:param name="name" value="${characteristics_ru[index][0]}"/>
                            <c:param name="picture" value="${characteristics_ru[index][1]}"/>
                            <c:param name="description" value="${characteristics_ru[index][2]}"/>
                            <c:param name="price" value="${characteristics_ru[index][3]}"/>
                            <c:param name="language" value="${language}"/>
                            <c:param name="id" value="${characteristics_en[index][0]}"/>
                        </c:import>
                    </c:when>
                    <c:when test="${'characteristics_en'.indexOf(language) ne -1}">
                        <c:import url="picture.jsp">
                            <c:param name="name" value="${characteristics_en[index][0]}"/>
                            <c:param name="picture" value="${characteristics_en[index][1]}"/>
                            <c:param name="description" value="${characteristics_en[index][2]}"/>
                            <c:param name="price" value="${characteristics_en[index][3]}"/>
                            <c:param name="language" value="${language}"/>
                            <c:param name="id" value="${characteristics_en[index][0]}"/>
                        </c:import>
                    </c:when>
                    <c:when test="${'characteristics_de'.indexOf(language) ne -1}">
                        <c:import url="picture.jsp">
                            <c:param name="name" value="${characteristics_de[index][0]}"/>
                            <c:param name="picture" value="${characteristics_de[index][1]}"/>
                            <c:param name="description" value="${characteristics_de[index][2]}"/>
                            <c:param name="price" value="${characteristics_de[index][3]}"/>
                            <c:param name="language" value="${language}"/>
                            <c:param name="id" value="${characteristics_en[index][0]}"/>
                        </c:import>
                    </c:when>
                </c:choose>
                <div id="${item}_count_and_price_block_${language}" class="count_and_price_block" align="center"
                     style="width: 300px;
                        height: auto;
                        border: 2px solid rgb(215, 0, 70);
                        margin-top: 30px;
                        margin-right: 30%;
                        min-height: 50px;
                        float: right;" >
                    <h4 id="${item}_count_block_${language}" class="count_block">
                        <fmt:message key="quantity"/>: ${pageContext.session.getAttribute(item)}
                    </h4>
                    <h4 id="${item}_price_block_${language}" class="price_block">
                        <fmt:message key="price"/>:
                    </h4>
                    <div id="buttons" style="display: inline">
                        <img class="add_reduce" src="plus.png" width="80" height="70" onclick="add('${item}')">
                        <img class="add_reduce" src="minus.png" width="80" height="70" onclick="reduce('${item}')">
                    </div>
                </div>
                <div style="clear: both"></div>
            </c:if>
        </c:forEach>
    </div>

    <div id="summary" style="display: none; float: right; color: rgb(215, 0, 70); margin-right: 5%;">
        <h1>
            <fmt:message key="total_cost"/>:
        </h1>
    </div>
</div>
<script>
    hideBuyAndPriceAndFilter();
    showPrice();
    showSummaryPrice();
    document.getElementById("RU").onclick = () => {location.href='http://localhost:8080/Basket?language=ru'};
    document.getElementById("EN").onclick = () => {location.href='http://localhost:8080/Basket?language=en'};
    document.getElementById("DE").onclick = () => {location.href='http://localhost:8080/Basket?language=de'};
    //setLanguage();
</script>
</body>
</html>
