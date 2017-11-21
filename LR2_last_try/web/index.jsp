<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11.11.2017
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <style>
      body {
        background: rgb(255, 174, 192);
      }
    </style>
    <script>
      var language;

      function setLanguage(param) {
          if (param === undefined){
              param = '<%=request.getParameter("language") == null ?
              request.getAttribute("language") : request.getParameter("language")%>';
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

      function setFilter() {
          var toy_index = document.getElementById("filter_select").options.selectedIndex;
          var toy = document.getElementById("filter_select").options[toy_index].value;
          window.location = (toy === "All" ? "http://localhost:8080/LR2?language="+ language +"&toy="
              : "http://localhost:8080/LR2?language="+ language +"&toy=" + toy);
      }

      function setIndex() {
          var toy = '<%=request.getParameter("toy") == null ?
                          request.getAttribute("toy") : request.getParameter("toy")%>';
          var options = document.getElementById("filter_select");
          options.value = ((toy === 'null') || (toy === "") ? "All" : toy);
      }

      function gotoLR1(param) {
          var items = document.getElementsByClassName("picture");
          for (let i = 0; i < items.length; ++i){
              items[i].onclick = function () {
                  if (param !== false)
                    location.href = 'http://localhost:8080/LR1?language=' + language;
              }
              items[i].onmouseover = function () {
                  items[i].style.cursor = 'pointer';
                  items[i].style.background = 'gray';
              }
              items[i].onmouseout = function () {
                  items[i].style.background = 'lightgray';
              }
          }
      }

      function forwardBasket(name){
          if (document.getElementById("authorization").value === "authorized"){
              if (name === undefined)
                  location.href = "http://localhost:8080/Basket?language=" + language;
              else
                  location.href = "http://localhost:8080/Basket?language=" + language + "&" + name + "=1";
          }
          else {
              alert("Для оформления заказа необходимо авторизоваться");
          }
      }

      function getLanguage() {
          return language;
      }

    </script>
  </head>
  <body>
  <jsp:include page="main_field.jsp"/>
  <script>
    setLanguage();
    setIndex();
    gotoLR1();
  </script>
  </body>
</html>
