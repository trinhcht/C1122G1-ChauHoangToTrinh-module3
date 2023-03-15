<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 3/14/2023
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<h1>User Management</h1>
<div align="center">
    <form method="post">
        <h1> Edit User </h1>
        <div>
            <input type="hidden" value="${user.id}">
        </div>
        <div>
            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="${user.name}">
        </div>
        <div>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="${user.email}">
        </div>
        <div>
            <label for="country">Country</label>
            <input type="text" name="country" id="country" value="${user.country}">
        </div>
        <input class="btn btn-primary" type="submit" value="Cập nhật">
    </form>
</div>
</body>
</html>