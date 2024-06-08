<%--
  Created by IntelliJ IDEA.
  User: khayreddine
  Date: 02/06/2024
  Time: 00:43
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
    <title>Title</title>
</head>
<body>
<h2>Create Group</h2>
<form action="CreateGroupServlet" method="post">
    <input type="text" name="name" placeholder="Group Name" required>
    <input type="number" name="numberOfStudents" placeholder="Number of Students" required>
    <button type="submit">Create Group</button>
</form>

</body>
</html>
