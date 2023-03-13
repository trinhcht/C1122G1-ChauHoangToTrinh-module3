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
<form action="/product?action=create" method="post">
    <div>
        <label for="name">Nhập tên sản phẩm</label>
        <input type="text" name="name" id="name">
    </div>
    <div>
        <label for="price">Nhập giá sản phẩm</label>
        <input type="text" name="price" id="price">
    </div>
    <div>
        <label for="describe">Nhập mô tả sản phẩm</label>
        <input type="text" name="describe" id="describe">
    </div>
    <div>
        <label for="producer">Nhập nhà sản xuất</label>
        <input type="text" name="producer" id="producer">
    </div>
    <div>
        <input class="btn btn-primary" type="submit" value="Lưu">
    </div>
</form>
</body>
</html>
