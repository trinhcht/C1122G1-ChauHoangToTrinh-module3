<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/23/2023
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <title>Create</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<form action="/sieuThi?action=create" method="post">
  <div class="container">
    <h1>THÊM MỚI THỰC PHẨM</h1>
    <div class="form-group">
      <label for="id">Mã thực phẩm</label>
      <input type="text"
             class="form-control" name="id" id="id" aria-describedby="helpId" placeholder="Vui lòng nhập mã thực phẩm mới">
    </div>

    <div class="form-group">
      <label for="name">Tên thực phẩm</label>
      <input type="text"
             class="form-control" name="name" id="name" aria-describedby="helpId" placeholder="Vui lòng nhập tên thực phẩm mới">
    </div>

    <div class="form-group">
      <label for="NSX">Ngày sản xuất</label>
      <input type="text"
             class="form-control" name="NSX" id="NSX" aria-describedby="helpId" placeholder="Vui lòng nhập ngày sản xuất của thực phẩm mới">
    </div>

    <div class="form-group">
      <label for="HSD">Hạn sử dụng</label>
      <input type="text"
             class="form-control" name="HSD" id="HSD" aria-describedby="helpId" placeholder="Vui lòng nhập ngày hết hạn của thực phẩm mới">
    </div>

      <div class="form-group">
        <label for="ltpId">Mã loại thực phẩm</label>
        <input type="text"
               class="form-control" name="ltpId" id="ltpId" aria-describedby="helpId" placeholder="Vui lòng nhập mã loai thực phẩm">
      </div>

    <div class="form-group">
      <label for="ltpName">Tên loại thực phẩm</label>
      <input type="text"
             class="form-control" name="ltpName" id="ltpName" aria-describedby="helpId" placeholder="Vui lòng nhập tên loai thực phẩm">
    </div>


<%--    <div class="dropdown open">--%>
<%--      <button class="btn btn-secondary dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown"--%>
<%--              aria-haspopup="true"--%>
<%--              aria-expanded="false">--%>
<%--        Dropdown--%>
<%--      </button>--%>
<%--      <div class="dropdown-menu" aria-labelledby="triggerId">--%>
<%--        <button class="dropdown-item" href="#">Action</button>--%>
<%--        <button class="dropdown-item disabled" href="#">Disabled action</button>--%>
<%--      </div>--%>
<%--    </div>--%>

    <div class="form-group">
      <label for="moTa">Mô tả</label>
      <input type="text"
             class="form-control" name="moTa" id="moTa" aria-describedby="helpId" placeholder="Nhập mô tả thêm (Nếu có)">
    </div>

    <button type="button" class="btn btn-primary">Submit</button>

  </div>
</form>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
