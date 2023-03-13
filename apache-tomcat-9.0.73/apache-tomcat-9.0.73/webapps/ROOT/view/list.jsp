<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="/css/bootstrap.css">
<body>
<p><a class="btn btn-primary" href="/product?action=create">Thêm mới</a>
</p>
<form class="mb-3" action="/product?action=search" method="post">
    <input type="text" name="search" id="">
    <input type="submit" value="Tìm kiếm" class="btn btn-primary">
</form>
<form action="" method="get">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Chi tiết sản phẩm</th>
            <th>Nhà sản xuất</th>
        </tr>
        <c:forEach items='${requestScope["product"]}' var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.describe}</td>
                <td>${product.producer}</td>
                <td><a class="btn btn-primary" href="/product?action=update&id=${product.id}">Sửa</a></td>
                <td><a class="btn btn-danger" href="/product?action=delete&id=${product.id}">Xoá</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
<script src="/js.bootstrap.js"></script>
</body>
</html>