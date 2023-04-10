<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/10/2023
  Time: 10:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .table {
            text-align: center;
            border-collapse: collapse;
            border: 2px solid black;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
        }
        .table, th {
            border: 1px solid #3f1c8a;
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
            margin-top: 100px;
            margin-bottom: 50px;
            text-align: center;
            color: #f159ff;
            font-weight: bolder;
            font-family: "Sans Serif Collection";
            font-size: 35px;
        }
        td {
            border: 1px solid #3f1c8a;
        }
    </style>
</head>
<body style="background: url('https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg');background-size: cover">
<h1>Danh sách học viên CodeGym</h1>
<p class="text-center text-danger">${msg}</p>
<table class="table" style="width: 600px">
    <thead>
    <tr style="background: #c49ca6">
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Score</th>
        <th>Level</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${studentList}" varStatus="loop">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>
                <c:if test="${student.gender ==0}">Female</c:if>
                <c:if test="${student.gender ==1}">Male</c:if>


            </td>
            <td>${student.score}</td>
            <td>
                <c:choose>
                    <c:when test="${student.score >=90}">Good</c:when>
                    <c:when test="${student.score >=80}">Rather</c:when>
                    <c:when test="${student.score >=60}">Medium</c:when>
                    <c:when test="${student.score <60}">Low</c:when>
                    <c:otherwise>Error</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src="js/bootstrap.bundle.js"></script>
</html>
