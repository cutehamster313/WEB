<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.11.2017
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Main_field</title>
    <style>
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

        h1 {
            color: white;
        }

        h2{
            color: rgb(215, 0, 70);
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
    <%!
        String characteristics_ru[][] = {{"Енотик", "enot1.jpg", "Милый енотик станет отличным другом" +
                "                                                  для Вас или Вашего ребенка!", "15$"},
                                      {"Белый Мишка", "white_bear.jpg", "Улыбчивый белый мишка подарит Вам " +
                                                                        "солнечное настроение!", "10$"},
                                      {"Розовый Мишка", "pink_bear.jpg", "Розовый мишка станет отличным признанием " +
                                                                        "в Ваших чувствах!", "13$"}};
        String characteristics_en[][] = {{"Racoon", "enot1.jpg", "A cute racoon will be a great friend" +
                "                                                for you or your child!", "15$"},
                {"White Bear", "white_bear.jpg", "Smiling white bear will give you a sunny mood!", "10$"},
                {"Pink Bear", "pink_bear.jpg", "Lächelnder weißer Bär gibt Ihnen eine sonnige Stimmung!", "13$"}};
        String characteristics_de[][] = {{"Waschbär", "enot1.jpg", "Ein niedlicher Waschbär wird " +
                                                                "ein großer Freund für Sie oder Ihr Kind sein!", "15$"},
                {"Weißer Bär", "white_bear.jpg", "Lächelnder weißer Bär gibt Ihnen eine sonnige Stimmung!", "10$"},
                {"Rosa Bär", "pink_bear.jpg", "Rosa Bär wird eine große Anerkennung Ihrer Gefühle sein!", "13$"}};

        String[] languages = {"RU", "EN", "DE"};
    %>
</head>
<body>
<div id="square">
    <jsp:include page="header.jsp">
        <jsp:param name="language" value='<%=request.getParameter("language") == null ?
         ((String)request.getAttribute("language")).toLowerCase() : request.getParameter("language").toLowerCase()%>'/>
    </jsp:include>

    <select id="authorization" style="margin-top: 20px" class="select_filter">
        <option value="authorized">
            Авторизован
        </option>
        <option value="non_authorized">
            Не авторизован
        </option>
    </select>

    <%
        request.setCharacterEncoding("UTF-8");
        String toy = request.getParameter("toy") == null ? (String)request.getAttribute("toy") : request.getParameter("toy");
        for (int i = 0; i < characteristics_ru.length; i++){
                    if (characteristics_en[i][0].contains(toy)){
                        %>
                        <jsp:include page="picture.jsp">
                            <jsp:param name="name" value="<%=characteristics_ru[i][0]%>"/>
                            <jsp:param name="picture" value="<%=characteristics_ru[i][1]%>"/>
                            <jsp:param name="description" value="<%=characteristics_ru[i][2]%>"/>
                            <jsp:param name="price" value="<%=characteristics_ru[i][3]%>"/>
                            <jsp:param name="language" value="<%=languages[0]%>"/>
                            <jsp:param name="id" value="<%=characteristics_en[i][0]%>"/>
                        </jsp:include>

                        <jsp:include page="picture.jsp">
                            <jsp:param name="name" value="<%=characteristics_en[i][0]%>"/>
                            <jsp:param name="picture" value="<%=characteristics_en[i][1]%>"/>
                            <jsp:param name="description" value="<%=characteristics_en[i][2]%>"/>
                            <jsp:param name="price" value="<%=characteristics_en[i][3]%>"/>
                            <jsp:param name="language" value="<%=languages[1]%>"/>
                            <jsp:param name="id" value="<%=characteristics_en[i][0]%>"/>
                        </jsp:include>

                        <jsp:include page="picture.jsp">
                            <jsp:param name="name" value="<%=characteristics_de[i][0]%>"/>
                            <jsp:param name="picture" value="<%=characteristics_de[i][1]%>"/>
                            <jsp:param name="description" value="<%=characteristics_de[i][2]%>"/>
                            <jsp:param name="price" value="<%=characteristics_de[i][3]%>"/>
                            <jsp:param name="language" value="<%=languages[2]%>"/>
                            <jsp:param name="id" value="<%=characteristics_en[i][0]%>"/>
                        </jsp:include>
                        <%
                    }
        }
    %>
    </div>
</body>
</html>
