<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="http://mimimi.com" %>

<c:set var="lang" value="${util:getLanguage(pageContext.request, pageContext.response)}"/>

<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="language"/>

<html>
<head>
    <title>Main_field</title>
    <style>
        #square {
            width: 74%;
            background: white;
            margin: 5% 13% 7%;
            overflow: hidden;
            padding-bottom: 5%;
        }

        h1 {
            color: white;
        }

        h2 {
            color: rgb(215, 0, 70);
        }

    </style>
</head>
<body>


<div id="square">
    <jsp:include page="header.jsp"/>

    <div id="filter" style="float: right; margin-right: 100px; margin-top: -20px">
        <h2 id="filter_title" align="center" style="color: rgb(215, 0, 70);">
            <fmt:message key="filter"/>
        </h2>
        <select id="filter_select" style="margin-top: -18px" onchange="setFilter()">
            <option id="All" value="0">
                <fmt:message key="all_toys"/>
            </option>
            <option id="Racoon" value="1">
                <fmt:message key="enotic_title"/>
            </option>
            <option id="Bear" value="2">
                <fmt:message key="bear"/>
            </option>
        </select>
    </div>

    <c:forEach var="toy" items="${util:getToysForCategory(pageContext.request, pageContext.response)}" varStatus="in">

        <c:set var="toy" value="${toy}" scope="request"/>
        <jsp:include page="picture.jsp"/>

    </c:forEach>

</div>

<script type="text/javascript">
    $('#filter_select').val("${util:getCategory(pageContext.request, pageContext.response)}");

    function setFilter() {
        let category = $('#filter_select').val();
        document.cookie = "toy = " + category;
        location.reload()
    }
</script>
</body>
</html>
