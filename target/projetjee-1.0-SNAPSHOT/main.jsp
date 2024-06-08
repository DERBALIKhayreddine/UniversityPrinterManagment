<%--
  Created by IntelliJ IDEA.
  User: khayreddine
  Date: 08/06/2024
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Main Page</title>
</head>
<body>
<h1>Welcome, ${user.username}</h1>
${user.userId}
<a href="LogoutServlet">Logout</a>

</body>
</html>
