<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/11/2023
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Update</title>
  <link rel="stylesheet" href="../css/bootstrap-grid.css">
  <link rel="stylesheet" href="../css/bootstrap.css">
  <style>
    * {
      padding: 0;
      margin: 0 auto;
    }
    body {
      display: flex;
      align-items: center;
      height: 900px;
      font-size: 24px;
    }
    label {
      color: #564040;
      font-family: "Sans Serif Collection";
      font-size: 20px;
      font-weight: bolder;
      margin-top: 10px;
      margin-bottom: 10px;
    }
    input {
      border-radius: 5px;
      font-family: "Sans Serif Collection";
      font-size: 20px !important;
    }
    h1 {
      margin: 10px;
      margin-bottom: 15px;
      color: #a350f3;
      text-align: center;
      text-transform: uppercase;
      font-size: 35px;
    }
  </style>
</head>
<body>
<div class="col-md-5 main">
  <h1>Update book</h1>
  <form action="" method="post">
    <input type="hidden" name="id" value="${book.id}">
    <label for="title">Input title: </label>
    <input type="text" class="form-control" name="title" id="title"  value="${book.title}">

    <label for="pageSize">Input page size: </label>
    <input type="text" class="form-control" name="pageSizeBook" id="pageSize" value="${book.pageSize}">

<%--    <label for="author">Input author: </label>--%>
<%--    <input type="text" class="form-control" name="author" id="author" value="${book.author}">--%>

    <label for="authorID" id="authorID">Input Author name: </label>
    <select class="form-select" name="authorId" >
      <c:forEach var="author" items="${authorList}">
        <c:if test="${author.authorId == book.author.authorId}">
          <option value="${author.authorId}" selected>${author.authorName}</option>
        </c:if>
        <c:if test="${author.authorId != book.author.authorId}">
          <option value="${author.authorId}">${author.authorName}</option>
        </c:if>
      </c:forEach>
    </select>

    <label for="categoryID" id="categoryID">Input category name: </label>
    <select class="form-select" name="categoryID" >
      <c:forEach var="category" items="${categoryList}">
        <c:if test="${category.idCategory == book.category.idCategory}">
          <option value="${category.idCategory}" selected>${category.nameCategory}</option>
        </c:if>
        <c:if test="${category.idCategory != book.category.idCategory}">
          <option value="${category.idCategory}">${category.nameCategory}</option>
        </c:if>
      </c:forEach>
    </select>

    <input type="submit" value="Update" class="btn btn-secondary mt-3" style="background: #3d3c3c; margin-top: 10px;margin-left: 200px">
  </form>
</div>
<script src="../js/bootstrap.bundle.js">
</script>
</body>
</html>