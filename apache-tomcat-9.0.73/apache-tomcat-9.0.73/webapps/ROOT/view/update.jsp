<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 3/13/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="" method="post">
    <label for="name">Name</label>
    <input type="text" name="name" id="name" value="${product.name}">

    <label for="price">Price</label>
    <input type="text" name="price" id="price" value="${product.price}">

    <label for="describe">Describe</label>
    <input type="text" name="describe" id="describe" value="${product.describe}">

    <label for="producer">Producer</label>
    <input type="text" name="producer" id="producer" value="${product.producer}">

    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
