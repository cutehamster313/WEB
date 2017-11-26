<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="util" uri="http://mimimi.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="lang" value="${util:getLanguage(pageContext.request, pageContext.response)}"/>

<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="language"/>

<html>
<head>
    <title>Picture</title>
    <style>
        .picture {
            float: left;
            width: 80%;
            height: 490px;
            background: lightgrey;
            margin-top: 45px;
            margin-left: 10%;
        }

        #buy {
            float: left;
            margin-top: 87px;
            margin-left: 130px;
            margin-bottom: 20px;
            width: 110px;
            height: 35px;
        }

        #description {
            float: right;
            background: none;
            margin-right: 20px;
            width: 47%;
        }
    </style>
</head>
<body>


<div id="${toy.id}" class="picture">
    <br>
    <h2 align="center" style="font_stile: normal; font-size: 50px; margin-top: 0"
        onclick="location.href = 'LR1?id=${toy.id}'">
        ${toy.getToyLanguage(lang).name}
    </h2>
    <img src="images/${toy.imageUrl}" width="350" height="350"
         style="margin-left: 13px">
    <div id="description">
        <h3 align="center">
            <b><fmt:message key="description_title"/>
            </b>
        </h3>
        <p style="text-align: justify; text-indent: 28px">
            ${toy.getToyLanguage(lang).description}
        </p><br>
        <p class="price" style="text-align: justify">
            <b id="${toy.id}_price"><fmt:message key="price"/>
                $${toy.cost}
            </b></p>
        <div id="buy" class="buy">
            <button style="background: rgb(215, 0, 70); width: 110px"
                    onclick="location.href = 'Basket?' + ${toy.id} + '=1';">
                <h3 align="center" style="font-size: 25px;color: white">
                    <fmt:message key="buy"/>
                </h3>
            </button>
        </div>
    </div>
</div>
</body>
</html>
