<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="http://mimimi.com" %>

<html>
<head>
    <meta charset="utf-8">
</head>
<body style="background: lightgrey;">

<fmt:setLocale value="${util:getLanguage(pageContext.request, pageContext.response)}"/>
<fmt:setBundle basename="language"/>


<div id="square">
    <jsp:include page="header.jsp"/>
    <form action="j_security_check" method="post" name="loginForm">
        <label><fmt:message key="login"/></label><br>
        <input name="j_username" size="20"/><br>
        <label><fmt:message key="password"/></label><br>
        <input type="password" name="j_password" size="20"/><br>
        <input type="submit" value="<fmt:message key="signin"/>"/>
    </form>
</div>
</body>