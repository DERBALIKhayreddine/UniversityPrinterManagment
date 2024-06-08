<%--
  Created by IntelliJ IDEA.
  User: khayreddine
  Date: 02/06/2024
  Time: 00:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page import="tn.iit.projetjee.entity.Groupe" %>
<%@ page import="java.util.List" %>
<%@ page import="tn.iit.projetjee.entity.Course" %>
<%@ page session="false" %>

<%
    HttpSession session = request.getSession(false);
    if (session == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User user = (User) session.getAttribute("user");

    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Groupe> groupList = (List<Groupe>) request.getAttribute("groupList");
    List<Course> courseList = (List<Course>) request.getAttribute("courseList");
    List<User> userList = (List<User>) request.getAttribute("userList");
%>
<html>
<head>
    <title>Create new Teacher</title>
</head>
<body>
<h2>Create New teacher</h2>
<form action="CreateUserServlet" method="post">
    <input type="text" name="name" placeholder="Name" required>
    <input type="text" name="lname" placeholder="Last Name" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="hidden" name="role" value="teacher"> <!-- Default role for teachers -->
    <button type="submit">Create User</button>
</form>
</body>
</html>
