<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>List</title>
</head>
<body>

<br/>
<center>
    <h1 style="color: #a52834">User Management</h1>
    <h2>
        <a href="/create.jsp">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2 style="color: darkblue">List of Users</h2></caption>
        <tr style="color: darkmagenta">
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        "{listUser}">
            <tr style="color: midnightblue">
                <td>user.id</td>
                <td>user.name</td>
                <td>user.email</td>
                <td>user.country</td>
                <td>
                    <a href="/?action=edit&id= user.id">Edit</a>
                    <a href="/?action=delete&id= user.id">Delete</a>
                </td>
            </tr>

    </table>
</div>
</body>
</html>