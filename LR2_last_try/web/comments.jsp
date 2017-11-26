<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="utils" uri="http://mimimi.com" %>

<html>
<head>
    <meta charset="utf-8">
</head>
<body>

<ul>
    <c:forEach items="${utils:getComments(pageContext.request)}" var="comment">
        <li>
                ${utils:formatDate(comment.date)}: ${comment.text}
        </li>
    </c:forEach>
</ul>
</body>