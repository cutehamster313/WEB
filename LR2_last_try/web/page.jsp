<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="utils" uri="http://mimimi.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="lang" value="${utils:getLanguage(pageContext.request, pageContext.response)}"/>

<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="language"/>

<jsp:useBean id="toy" class="entities.Toy" scope="request">
    <jsp:setProperty name="toy" property="*"/>
</jsp:useBean>

<html>
<head>

    <meta charset="UTF-8">
    <script>
        function changeDescription(param) {
            switch (param) {
                case "short_description": {
                    document.getElementById("text").innerHTML = "<p align=\"center\" style=\"margin-right: 80px\">\n" +
                        "            </p>\n" +
                        "            <p style=\"text-align: justify; text-indent: 28px\">${toy.getToyLanguage(lang).description}\n" +
                        "            </p>";
                    break;
                }
                case "detail_description": {
                    document.getElementById("text").innerHTML = "<p align=\"center\" style=\"margin-right: 80px\">\n" +
                        "            </p>\n" +
                        "            ${toy.getToyLanguage(lang).moreInfo}";
                    break;
                }
                case "feedbacks": {
                    document.getElementById("text").innerHTML = "<p align=\"center\" style=\"margin-right: 80px\">\n" +
                        "            </p>\n" +
                        "            ${toy.getToyLanguage(lang).reviews}";
                    break;
                }
            }
        }
    </script>
    <style>
        body {
            background: rgb(255, 174, 192);
        }

        #square {
            width: 74%;
            height: 700px;
            background: white;
            margin-top: 5%;
            margin-left: 13%;
            margin-right: 13%;
            margin-bottom: 7%;
        }

        #line {
            width: 100%;
            height: 80px;
            background: rgb(215, 0, 70);
            margin-top: 5%;
        }

        #picture {
            float: left;
            width: 33%;
            height: 413px;
            background: lightgrey;
            margin-top: 20px;
            margin-left: 70px;
            /*margin-right: 67%;*/
        }

        h1 {
            color: white;
        }

        h2 {
            color: rgb(215, 0, 70);
        }

        #description {
            float: right;
            margin-top: 70px;
            width: 55%;
            height: 10px;
        }

        .button_style {
            margin-right: 15px;
            border: 0;
            background: lightgrey;
            width: 145px;
            height: 40px;
        }

        /*.button_style:focus {
            outline: none;
        }*/
        .button_style:hover {
            background: pink;
        }

        .button_style:active {
            background: rgb(215, 0, 70);
        }

        #buy {
            float: left;
            margin-top: 30px;
            margin-left: 100px;
            width: 120px;
            heigth: 50px;
            background: rgb(215, 0, 70);
        }

        #buy:focus {
            outline: none;
        }

        #title_href {
            text-decoration: none;
        }

        #title_href:active {
            text-decoration: underline;
        }

        #title_href:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>

<div id="square">
    <jsp:include page="header.jsp"/>

    <br>

    <div style="clear: both"></div>
    <div id="picture">
        <h2 align="center"
            style="font_stile: normal; font-size: 50px; margin-top: 0">${toy.getToyLanguage(lang).name}</h2>
        <img src="images/${toy.imageUrl}" width="300" height="300" style="margin-left: 13px">
        <div id="buy">
            <button style="background: none; border: 0; width: 120px">
                <h3 align="center" ; style="font-size: 25px;color: white">
                    <fmt:message key="buy"/>
                </h3>
            </button>
        </div>
    </div>
    <div id="description">
        <div id="bookmarks" style="">
            <button id="short_description" class="button_style" onclick="changeDescription('short_description')">
                <fmt:message key="description_title"/>
            </button>
            <button id="detail_description" width="150" class="button_style"
                    onclick="changeDescription('detail_description')">
                <fmt:message key="detail_description_title"/>
            </button>
            <button id="feedbacks" class="button_style" onclick="changeDescription('feedbacks')">
                <fmt:message key="feedbacks_title"/>
            </button>
        </div>
        <br><br>
        <div id="text">
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    changeDescription("${requestScope.get("bookmark")}")
</script>
</html>
