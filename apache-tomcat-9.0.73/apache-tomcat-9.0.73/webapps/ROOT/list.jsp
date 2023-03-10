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
  <style>
    .total{
      background: lightpink;
      color: brown;
    }
    .myName{
      background: antiquewhite;
      color: blueviolet;
    }
    .birth{
      background: beige;
      color: navy;
    }
    .dress{
      background: lavender;
      color: orangered;
    }
    .customer{
      background: slateblue;
      color: maroon;
      text-align: center;
    }
    .myTable{
      width: 70%;
      text-align: center;
      margin: auto;
    }
    .myImage{
      background: lightgoldenrodyellow;
    }
  </style>
</head>
<body>
<h1 class="customer">Danh sách khách hàng</h1>
<table action="/customer" border="1" class="myTable">
  <tr class="total">
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach items="${listCustomer}" var="customer" >
    <tr>
      <td class="myName">${customer.name}</td>
      <td class="birth">${customer.dateOfBirth}</td>
      <td class="dress">${customer.dress}</td>
      <td class="myImage"><img src="${customer.image}" style="width: 150px" width="200px"></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
