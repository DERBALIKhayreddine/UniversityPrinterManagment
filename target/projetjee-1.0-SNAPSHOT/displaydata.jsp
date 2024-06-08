<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page import="tn.iit.projetjee.entity.Groupe" %>
<%@ page import="tn.iit.projetjee.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page session="false" %>

<%
    List<User> userList = (List<User>) request.getAttribute("userList");
    List<Course> courseList = (List<Course>) request.getAttribute("courseList");
    List<Groupe> groupList = (List<Groupe>) request.getAttribute("groupList");
%>

<html>
<head>
    <title>Display Lists</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>Teachers List</h2>
<table>
    <thead>
    <tr>
        <th>Teacher ID</th>
        <th>Name</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <% if (userList != null && !userList.isEmpty()) {
        for (User teacher : userList) { %>
    <tr>
        <td><%= teacher.getUserId() %></td>
        <td><%= teacher.getName() %></td>
        <td><%= teacher.getEmail() %></td>
    </tr>
    <%  }
    } else { %>
    <tr>
        <td colspan="3">No Teachers Available</td>
    </tr>
    <% } %>
    </tbody>
</table>

<h2>Groups List</h2>
<table>
    <thead>
    <tr>
        <th>Group ID</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <% if (groupList != null && !groupList.isEmpty()) {
        for (Groupe group : groupList) { %>
    <tr>
        <td><%= group.getGroupeId() %></td>
        <td><%= group.getName() %></td>
    </tr>
    <%  }
    } else { %>
    <tr>
        <td colspan="2">No Groups Available</td>
    </tr>
    <% } %>
    </tbody>
</table>

<h2>Courses List</h2>
<table>
    <thead>
    <tr>
        <th>Course ID</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <% if (courseList != null && !courseList.isEmpty()) {
        for (Course course : courseList) { %>
    <tr>
        <td><%= course.getCourseId() %></td>
        <td><%= course.getName() %></td>
    </tr>
    <%  }
    } else { %>
    <tr>
        <td colspan="3">No Courses Available</td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
