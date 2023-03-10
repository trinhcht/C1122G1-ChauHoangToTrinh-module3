<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 3/10/2023
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
  <tr>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach items="${listCustomer}" var="customer" varStatus="loop">
    <tr>
      <td>${loop.name}</td>
      <td>${loop.dateOfBirth}</td>
      <td>${loop.dress}</td>
      <td>${loop.image}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
