<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.io.File" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        #buy{
            float: left;
            margin-top: 87px;
            margin-left: 130px;
            margin-bottom: 20px;
            width: 110px;
            height: 35px;
        }

        #description{
            float: right;
            background: none;
            margin-right: 20px;
            width: 47%;
        }
    </style>
    <%!
       ResourceBundle rb = null;
    %>
    <%
        File file = new File("C:\\Users\\User\\IdeaProjects\\LR2_last_try\\src");
        URL[] urls = {file.toURI().toURL()};
        ClassLoader loader = new URLClassLoader(urls);
        rb = ResourceBundle.getBundle("_language", Locale.forLanguageTag(request.getParameter("language")), loader);
    %>
    <jsp:useBean id="item" class="toys.Toy" scope="request"/>
    <jsp:setProperty name="item" property="name" value='<%=request.getParameter("name")%>'/>
    <jsp:setProperty name="item" property="picture" value='<%=request.getParameter("picture")%>'/>
    <jsp:setProperty name="item" property="description" value='<%=request.getParameter("description")%>'/>
    <jsp:setProperty name="item" property="price" value='<%=request.getParameter("price")%>'/>
    <jsp:setProperty name="item" property="language" value='<%=request.getParameter("language")%>'/>
    <jsp:setProperty name="item" property="id" value='<%=request.getParameter("id")%>'/>

</head>
<body>
<div id="<jsp:getProperty name="item" property="id"/><jsp:getProperty name="item" property="language"/>" class="picture">
    <br>
    <h2 align="center" style="font_stile: normal; font-size: 50px; margin-top: 0"><jsp:getProperty name="item" property="name"/></h2>
    <img src="<jsp:getProperty name="item" property="picture"/>" width="350" height="350" style="margin-left: 13px">
    <div id="description">
        <h3 align="center">
         <b><%=rb.getString("description_title")%></b>
        </h3>
        <p style="text-align: justify; text-indent: 28px"><jsp:getProperty name="item" property="description"/></p><br>
        <p id="<jsp:getProperty name="item" property="id"/>_price" class="price" style="text-align: justify"><b><%=rb.getString("price")%>: <jsp:getProperty name="item" property="price"/></b></p>
        <div id="buy" class="buy">
            <button style="background: rgb(215, 0, 70); width: 110px" onclick="gotoLR1(false); forwardBasket('<jsp:getProperty name="item" property="id"/>'); return false;">
                <h3 align = "center"; style="font-size: 25px;color: white">
                    <%=rb.getString("buy")%>
                </h3>
            </button>
        </div>
</div>
</div>
</body>
</html>
