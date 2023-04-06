<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/5/2023
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <title>Login</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    form {
      margin-top: 10px;
    }
    .login {
      margin: auto;
      width: 500px;
      height: 300px;
      border: 1px solid gray;
      border-radius:5px;
      text-align: center;
    }
    .login h2 {
      margin-top: 25px;
      color: pink;
      font-size: 50px;
      font-family: "Berlin Sans FB";
      font-weight: bolder;
    }
    .login h3 {
      margin-left: 10px;
      font-size: 15px;
      color: purple;
      font-family: SansSerif;
    }
    .login .form-control {
      width: 100px;
      height: 40px;
      margin-bottom: 10px;
      border-radius: 5px;
      border: 1px solid gray;
      padding-left: 15px;
    }
    .login .btn btn-primary {
      display: inline-block;
      width: 400px;
      height: 40px;
      margin-bottom: 10px;
      border-radius: 5px;
      border: none;
      background-color: paleturquoise;
      color: mediumblue;
      text-decoration: none;
      line-height: 40px;
      opacity: 0.8;
    }
    .login .btn btn-primary:hover,
    .login a:hover {
      opacity: 1;
    }
    #use-name{
      width: 35px;
        color: indigo;
      contain: inline-size;
    }
    #password{
        width: 35px;
        color: indigo;
        contain: inline-size;
    }
  </style>
</head>
<body>
<form action="/login" method="post">
  <div>
    <div class="login">
      <h2>Login</h2>
      <div class="input-group" style="margin: 75px 0 35px;text-indent: 30px">
        <label for="use-name">Use name:</label>
        <input type="text" style="margin: 0 45px 0 18px;border-radius: 7px; width: 200px;"
               class="form-control" name="useName" id="use-name" placeholder="Input User name">
      </div>
      <div class="input-group" style="text-indent: 31px">
        <label for="password">Password:</label>
        <input type="password" style="margin: 0 45px 0 21px; border-radius: 3px; width: 200px"
               class="form-control" name="password" id="password" placeholder="Input your password">
      </div>
        <h3 style="margin-top: 50px">${messengerLogin}</h3>
      <button type="submit" class="btn btn-primary" style="margin: 26px">Submit</button>
    </div>
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
