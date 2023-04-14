<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/10/2023
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <!-- Font-icon css-->
  <%--  <link rel="stylesheet" type="text/css"--%>
  <%--        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
  <link rel="stylesheet" href="../../themify-icons/themify-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    .table {
      text-align: center;
      margin-left: auto;
      margin-right: auto;
      border-collapse: collapse;
      border: 1px solid #3f1c8a;
      width: 100%;
    }
    .table, th {
      border: 1px solid #868585;
    }
    th {
      text-align: center;
      padding: 10px;
    }
    .table tr:nth-child(odd) {
      background-color: #eee;
    }
    .table tr:nth-child(even) {
      background-color: white;
    }
    h1 {
      margin-top: 50px;
      margin-bottom: 60px;
      font-family: "Sans Serif Collection";
      text-align: center;
      color: #490b5b;
      font-weight: bolder;
      font-size: 30px;
    }
    td {
      border: 1px solid;
    }
  </style>
</head>
<body>
<h1> Book List</h1>
<a class="btn btn-primary" style="margin-left: 80px;margin-bottom: 30px" href="/book?action=create">Create new book</a>
<form class="mb-3" action="/book">
  <input type="hidden" name="action" value="search">
  <input type="text" name="name" id="name">
  <button type="submit" class="btn btn-primary">Search</button>
</form>
<table class="table" style="width: 600px">
  <thead>
  <tr style="background: #c49ca6">
    <th>ID</th>
    <th>Title</th>
    <th>Page size</th>
    <th>Author</th>
    <th>Category</th>
    <th>Function</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="book" items="${bookList}">
    <tr>
      <td>${book.id}</td>
      <td>${book.title}</td>
      <td>${book.pageSize}</td>
      <td>${book.author.authorName}</td>
      <td>${book.category.nameCategory}</td>
      <td>
        <button type="button" onclick="deleteInfo('${book.id}','${book.title}')"  class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
          <i class="fas fa-trash-alt"></i>
        </button>
        <a href="/book?action=edit&id=${book.id}" class="btn btn-primary"><i
                class="fas fa-edit"></i></a>
      </td>

    </tr>
  </c:forEach>
  </tbody>
</table>
<%-- modal xóa --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Book</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="/book?action=delete" method="post">
        <div class="modal-body">
          <label for="deleteId"></label>
          <input type="text" hidden id="deleteId" name="deleteId" value="${book.id}">
          Do you want to delete <span id="deleteName" style="color: brown; font-weight: bold">${book.title}</span>
          ?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-primary">Confirm</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  function deleteInfo(id, name) {
    debugger
    document.getElementById("deleteId").value = id;
    document.getElementById("deleteName").innerText = name;
  }
</script>
</body>
</html>