<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 3/9/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/bai1Servlet" method="post">
  Product Description: <input type="text" name="description">
  <br>
  <br>
  List Price: <input type="number" name="price">
  <br>
  <br>
  Discount Percent: <input type="number" name="discount">
  <br>
  <br>
  <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
